const express = require('express');
const { Client } = require('pg');
const path = require('path');

const app = express();
const port = 3000;

// Configuración de la base de datos
const client = new Client({
    host: 'localhost',
    port: 5432,
    user: 'postgres', // Cambia por tu usuario de PostgreSQL
    password: '1209', // Cambia por tu contraseña
    database: 'farmacia', // Cambia por el nombre de tu base de datos
});

client.connect();

// Middleware para servir archivos estáticos
app.use(express.static('public'));
app.use(express.json()); 
app.use(express.urlencoded({ extended: true }));

// Ruta para la consulta 1: Total de stock por medicamento con filtro
app.get('/stock', async (req, res) => {
    const query = `
    SELECT M.Nombre, M.Laboratorio, SUM(I.Cantidad) AS Total_Stock
    FROM Medicamentos M
    JOIN Inventario I ON M.ID_medicamento = I.ID_medicamento
    GROUP BY M.Nombre, M.Laboratorio
    HAVING SUM(I.Cantidad) > 5
    ORDER BY Total_Stock DESC;
    `;
    try {
        const result = await client.query(query);
        res.json(result.rows);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Ruta para la consulta 2: Mejores 5 clientes frecuentes por número de compras
app.get('/topClientes', async (req, res) => {
    const query = `
    SELECT C.Nombre, C.Correo, COUNT(B.ID_boleta) AS Total_Compras
    FROM Clientes_Frecuentes C
    LEFT JOIN Boleta B ON C.ID_cliente = B.Cliente
    GROUP BY C.Nombre, C.Correo
    ORDER BY Total_Compras DESC
    LIMIT 5;
    `;
    try {
        const result = await client.query(query);
        res.json(result.rows);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Ruta para la consulta 3: Medicamentos con cantidad disponible en inventario y proveedor
app.get('/medicamentosConProveedor', async (req, res) => {
    const query = `
    SELECT
        M.Nombre AS Medicamento_Nombre,
        I.cantidad AS Cantidad_Disponible,
        P.Nombre AS Proveedor_Nombre
    FROM
        Medicamentos M
    JOIN
        Inventario I ON M.ID_medicamento = I.id_medicamento
    JOIN
        Compras C ON M.ID_medicamento = C.ID_medicamento
    JOIN
        Proveedores P ON C.ID_proveedor = P.ID_proveedor
    ORDER BY
        M.Nombre;
    `;
    try {
        const result = await client.query(query);
        res.json(result.rows);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Ruta para la consulta 4: Medicamentos con stock bajo y ventas
app.get('/medicamentosStockBajo', async (req, res) => {
    const query = `
    SELECT
        M.Nombre AS Medicamento,
        I.cantidad AS Stock_Actual,
        SUM(B.Cantidad) AS Total_Vendido,
        (I.cantidad - SUM(B.Cantidad)) AS Stock_Restante
    FROM
        Medicamentos M
    JOIN
        Inventario I ON M.ID_medicamento = I.id_medicamento
    JOIN
        Boleta B ON M.ID_medicamento = B.ID_medicamento
    GROUP BY
        M.Nombre, I.cantidad
    HAVING
        I.cantidad < 60
    ORDER BY
        Stock_Restante ASC;
    `;
    try {
        const result = await client.query(query);
        res.json(result.rows);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Ruta para la consulta 5: Medicamentos con stock menor al promedio
app.get('/medicamentosStockPromedio', async (req, res) => {
    const query = `
    SELECT I.Cantidad, M.Nombre, M.Laboratorio
    FROM Inventario I
    JOIN Medicamentos M ON I.ID_medicamento = M.ID_medicamento
    WHERE I.Cantidad < (
        SELECT AVG(Cantidad) FROM Inventario
    )
    ORDER BY I.Cantidad ASC;    
    `;
    try {
        const result = await client.query(query);
        res.json(result.rows);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Ruta para la consulta 6: Ordenar boletas
app.get('/boletas', async (req, res) => {
    const query = `
    SELECT
        B.ID_boleta,
        B.Fecha,
        C.Nombre AS Cliente,
        V.Nombre AS Vendedor,
        B.Ingreso_pesos,
        B.Cantidad
    FROM
        Boleta B
    JOIN
        Clientes_Frecuentes C ON B.Cliente = C.ID_cliente
    JOIN
        Vendedores V ON B.ID_vendedor = V.ID_vendedor
    ORDER BY
        B.Fecha ASC;
    `;
    try {
        const result = await client.query(query);
        res.json(result.rows);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Ruta para obtener todos los medicamentos
app.get('/medicamentos', async (req, res) => {
    try {
        const result = await client.query('SELECT * FROM Medicamentos;');
        console.log(result.rows);
        res.json(result.rows);
    } catch (error) {
        console.error('Error al obtener medicamentos:', error);
        res.status(500).json({ error: 'Error al obtener medicamentos' });
    }
});

// Ruta para buscar un medicamento por nombre
app.get('/medicamentos/:nombre', async (req, res) => {
    const nombre = req.params.nombre;
    try {
        const result = await client.query(
            'SELECT Nombre, Nombre_principio_activo, Fecha_de_vencimiento, Lote FROM Medicamentos WHERE Nombre = $1;',
            [nombre]
        );
        if (result.rows.length > 0) {
            res.json(result.rows[0]);
        } else {
            res.status(404).json({ error: 'Medicamento no encontrado' });
        }
    } catch (error) {
        console.error('Error al buscar medicamento:', error);
        res.status(500).json({ error: 'Error al buscar medicamento' });
    }
});

// Ruta para agregar un medicamento
app.post('/medicamentos', async (req, res) => {
    const { ID_medicamento, Nombre, Nombre_principio_activo, Fecha_de_vencimiento, Lote, Laboratorio } = req.body;
    try {
        await client.query(
            'INSERT INTO Medicamentos(ID_medicamento, Nombre, Nombre_principio_activo, Fecha_de_vencimiento, Lote, Laboratorio) VALUES ($1, $2, $3, $4, $5, $6);',
            [ID_medicamento, Nombre, Nombre_principio_activo, Fecha_de_vencimiento, Lote, Laboratorio]
        );
        res.status(201).json({ message: 'Medicamento agregado con éxito' });
    } catch (error) {
        console.error('Error al agregar medicamento:', error);
        res.status(500).json({ error: 'Error al agregar medicamento' });
    }
});

// Ruta para eliminar un medicamento por nombre
app.delete('/medicamentos/:nombre', async (req, res) => {
    const nombre = req.params.nombre;
    try {
        const result = await client.query(
            'DELETE FROM Medicamentos WHERE Nombre = $1;',
            [nombre]
        );
        if (result.rowCount > 0) {
            res.json({ message: 'Medicamento eliminado con éxito' });
        } else {
            res.status(404).json({ error: 'Medicamento no encontrado' });
        }
    } catch (error) {
        console.error('Error al eliminar medicamento:', error);
        res.status(500).json({ error: 'Error al eliminar medicamento' });
    }
});

// Ruta para actualizar un medicamento por nombre
app.put('/medicamentos/:nombre', async (req, res) => {
    const nombre = req.params.nombre;
    const { Nombre, Nombre_principio_activo, Fecha_de_vencimiento, Lote } = req.body;
    try {
        const result = await client.query(
            'UPDATE Medicamentos SET Nombre = $1, Nombre_principio_activo = $2, Fecha_de_vencimiento = $3, Lote = $4 WHERE Nombre = $5;',
            [Nombre, Nombre_principio_activo, Fecha_de_vencimiento, Lote, nombre]
        );
        if (result.rowCount > 0) {
            res.json({ message: 'Medicamento actualizado con éxito' });
        } else {
            res.status(404).json({ error: 'Medicamento no encontrado' });
        }
    } catch (error) {
        console.error('Error al actualizar medicamento:', error);
        res.status(500).json({ error: 'Error al actualizar medicamento' });
    }
});



// Iniciar servidor
app.listen(port, () => {
    console.log(`Servidor en puerto http://localhost:${port}`);
});


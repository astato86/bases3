--Total de stock por medicamento con filtro de cantidad mayor a 50, si
SELECT M.Nombre, M.Laboratorio, SUM(I.Cantidad) AS Total_Stock
FROM Medicamentos M
JOIN Inventario I ON M.ID_medicamento = I.ID_medicamento
GROUP BY M.Nombre, M.Laboratorio
HAVING SUM(I.Cantidad) > 5
ORDER BY Total_Stock DESC;


--Mejores 5 clientes frecuentes por número de compras, si
SELECT C.Nombre, C.Correo, COUNT(B.ID_boleta) AS Total_Compras
FROM Clientes_Frecuentes C
LEFT JOIN Boleta B ON C.ID_cliente = B.Cliente
GROUP BY C.Nombre, C.Correo
ORDER BY Total_Compras DESC
LIMIT 5;

-- Medicamentos con su cantidad disponible en inventario y el proveedor correspondiente (new)
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



-- Medicamentos con stock bajo y sus ventas(new)
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
    I.cantidad < 10
ORDER BY
    Stock_Restante ASC;





--Medicamentos en inventario con stock menor al promedio, si
SELECT I.Cantidad, M.Nombre, M.Laboratorio
FROM Inventario I
JOIN Medicamentos M ON I.ID_medicamento = M.ID_medicamento
WHERE I.ID_medicamento = 'MED1'
AND I.Cantidad < (
    SELECT AVG(Cantidad) FROM Inventario
)
ORDER BY I.Cantidad ASC;    



--Ordenar boletas, si
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

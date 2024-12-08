CREATE TABLE Medicamentos (
    ID_medicamento VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Nombre_principio_activo VARCHAR(255) NOT NULL,
    Fecha_de_vencimiento DATE NOT NULL,
    Lote VARCHAR(255) NOT NULL,
    Laboratorio VARCHAR(255),
    Bioequivalente BOOLEAN
);

CREATE TABLE Clientes_Frecuentes (
    ID_cliente VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Correo VARCHAR(255),
    Telefono BIGINT
);

CREATE TABLE Vendedores (
    ID_vendedor VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Correo VARCHAR(255),
    Edad INT,
    Telefono BIGINT
);

CREATE TABLE Administradores (
    ID_administrador VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Proveedores (
    ID_proveedor VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Telefono VARCHAR(255)
);

CREATE TABLE Boleta (
    ID_boleta VARCHAR(255) PRIMARY KEY,
    Fecha DATE NOT NULL,
    Cliente VARCHAR(255) NOT NULL,
    ID_medicamento VARCHAR(255) NOT NULL,
    ID_vendedor VARCHAR(255) NOT NULL,
    Ingreso_pesos BIGINT NOT NULL,
    Cantidad INT NOT NULL,
    FOREIGN KEY (Cliente) REFERENCES Clientes_Frecuentes(ID_cliente),
    FOREIGN KEY (ID_medicamento) REFERENCES Medicamentos(ID_medicamento),
    FOREIGN KEY (ID_vendedor) REFERENCES Vendedores(ID_vendedor)
);

CREATE TABLE Inventario (
    id_medicamento VARCHAR(255) PRIMARY KEY,
    cantidad INT NOT NULL,
    fecha_ingreso DATE NOT NULL, 
    id_boleta_mercaderia VARCHAR(255) REFERENCES Boleta(ID_boleta)
);

CREATE TABLE Compras (
    ID_boleta_mercaderia VARCHAR(255) PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_medicamento VARCHAR(255) NOT NULL,
    ID_proveedor VARCHAR(255),
    ID_administrador VARCHAR(255),
    Costo BIGINT NOT NULL,
    FOREIGN KEY (ID_medicamento) REFERENCES Medicamentos(ID_medicamento),
    FOREIGN KEY (ID_proveedor) REFERENCES Proveedores(ID_proveedor),
    FOREIGN KEY (ID_administrador) REFERENCES Administradores(ID_administrador)
);

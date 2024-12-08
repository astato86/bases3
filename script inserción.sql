-- Medicamentos
INSERT INTO Medicamentos (ID_medicamento, Nombre, Nombre_principio_activo, Fecha_de_vencimiento, Lote, Laboratorio, Bioequivalente)
VALUES 
(1, 'Paracetamol', 'Paracetamol', '2025-01-01', 'L001', 'Lab1', true),
(2, 'Ibuprofeno', 'Ibuprofeno', '2024-06-15', 'L002', 'Lab2', false),
(3, 'Aspirina', 'Ácido acetilsalicílico', '2023-11-10', 'L003', 'Lab3', true),
(4, 'Amoxicilina', 'Amoxicilina', '2025-03-20', 'L004', 'Lab4', true),
(5, 'Loratadina', 'Loratadina', '2024-12-05', 'L005', 'Lab5', false),
(6, 'Ranitidina', 'Ranitidina', '2024-09-30', 'L006', 'Lab6', false),
(7, 'Clonazepam', 'Clonazepam', '2025-05-25', 'L007', 'Lab7', true),
(8, 'Metformina', 'Metformina', '2026-01-15', 'L008', 'Lab8', true),
(9, 'Losartán', 'Losartán', '2024-04-18', 'L009', 'Lab9', true),
(10, 'Salbutamol', 'Salbutamol', '2024-02-22', 'L010', 'Lab10', true),
(11, 'Omeprazol', 'Omeprazol', '2025-07-01', 'L011', 'Lab11', true),
(12, 'Diazepam', 'Diazepam', '2023-12-19', 'L012', 'Lab12', true),
(13, 'Azitromicina', 'Azitromicina', '2025-10-08', 'L013', 'Lab13', true),
(14, 'Dexametasona', 'Dexametasona', '2024-03-14', 'L014', 'Lab14', false),
(15, 'Levofloxacino', 'Levofloxacino', '2023-11-11', 'L015', 'Lab15', false),
(16, 'Cetirizina', 'Cetirizina', '2025-04-10', 'L016', 'Lab16', true),
(17, 'Aciclovir', 'Aciclovir', '2024-07-07', 'L017', 'Lab17', false),
(18, 'Enalapril', 'Enalapril', '2023-10-20', 'L018', 'Lab18', true),
(19, 'Simvastatina', 'Simvastatina', '2026-06-12', 'L019', 'Lab19', false),
(20, 'Prednisona', 'Prednisona', '2025-09-09', 'L020', 'Lab20', true);

-- Clientes Frecuentes
INSERT INTO Clientes_Frecuentes (ID_cliente, Nombre, Correo, Telefono)
VALUES 
(1, 'Juan Perez', 'juanperez@correo.com', '987654321'),
(2, 'Ana Torres', 'ana.torres@gmail.com', '987654321'),
(3, 'Luis Martínez', 'luis.martinez@hotmail.com', '987654322'),
(4, 'Carla Gómez', 'carla.gomez@yahoo.com', '987654323'),
(5, 'Pedro Herrera', 'pedro.herrera@gmail.com', '987654324'),
(6, 'Sofía López', 'sofia.lopez@hotmail.com', '987654325'),
(7, 'Roberto García', 'roberto.garcia@gmail.com', '987654326'),
(8, 'María Sánchez', 'maria.sanchez@yahoo.com', '987654327'),
(9, 'José Morales', 'jose.morales@gmail.com', '987654328'),
(10, 'Valeria Castro', 'valeria.castro@hotmail.com', '987654329');

-- Vendedores
INSERT INTO Vendedores (ID_vendedor, Nombre, Correo, Edad, Telefono)
VALUES
(1, 'Alejandro Reyes', 'alejandro.reyes@gmail.com', 29, '912345678'),
(2, 'Andrea Ramírez', 'andrea.ramirez@hotmail.com', 35, '922345678'),
(3, 'Manuel Vargas', 'manuel.vargas@yahoo.com', 42, '932345678'),
(4, 'Lucía Morales', 'lucia.morales@gmail.com', 30, '942345678');

-- Administradores
INSERT INTO Administradores (ID_administrador, Nombre)
VALUES 
('A001', 'Carlos Mendoza'),
('A002', 'Laura Fernández'),
('A003', 'José Rodríguez'),
('A004', 'María Pérez'),
('A005', 'Luis Gómez'),
('A006', 'Ana Díaz'),
('A007', 'Ricardo Torres'),
('A008', 'Patricia Ruiz'),
('A009', 'Manuel Sánchez'),
('A010', 'Elena Martín');

-- Proovedores
INSERT INTO Proveedores (ID_proveedor, Nombre, Telefono)
VALUES 
('P001', 'Farmacéutica ABC', '912345679'),
('P002', 'Distribuciones Salud', '922345679'),
('P003', 'Medicamentos S.A.', '932345679'),
('P004', 'FarmaWorld', '942345679'),
('P005', 'Laboratorio Vita', '952345679'),
('P006', 'MedTech Inc.', '962345679'),
('P007', 'Distribuciones Farma', '972345679'),
('P008', 'BioMedics', '982345679'),
('P009', 'HealthPlus', '992345679'),
('P010', 'Farmacia Moderna', '902345679');

-- Boleta
INSERT INTO Boleta (ID_boleta, Fecha, Cliente, ID_medicamento, ID_vendedor, Ingreso_pesos, Cantidad)
VALUES 
('B001', '2024-01-01', '1', '1', '1', 5000, 2),
('B002', '2024-01-02', '2', '2', '2', 4000, 1),
('B003', '2024-01-03', '3', '3', '3', 3000, 5),
('B004', '2024-01-04', '4', '4', '4', 6000, 3),
('B005', '2024-01-05', '5', '5', '1', 3500, 7),
('B006', '2024-01-06', '6', '6', '2', 2500, 10),
('B007', '2024-01-07', '7', '7', '3', 2000, 4),
('B008', '2024-01-08', '8', '8', '4', 4500, 6),
('B009', '2024-01-09', '9', '9', '1', 5500, 3),
('B010', '2024-01-10', '10', '10', '2', 6500, 2);

-- Inventario
INSERT INTO Inventario (id_medicamento, cantidad, fecha_ingreso, id_boleta_mercaderia)
VALUES 
('1', 100, '2024-01-01', 'B001'),
('2', 50, '2024-01-02', 'B002'),
('3', 200, '2024-01-03', 'B003'),
('4', 150, '2024-01-04', 'B004'),
('5', 300, '2024-01-05', 'B005'),
('6', 400, '2024-01-06', 'B006'),
('7', 250, '2024-01-07', 'B007'),
('8', 350, '2024-01-08', 'B008'),
('9', 450, '2024-01-09', 'B009'),
('10', 500, '2024-01-10', 'B010');

-- Compras
INSERT INTO Compras (ID_boleta_mercaderia, Fecha, ID_medicamento, ID_proveedor, ID_administrador, Costo)
VALUES 
('B001', '2024-01-01', '1', 'P001', 'A001', 3000),
('B002', '2024-01-02', '2', 'P002', 'A002', 2000),
('B003', '2024-01-03', '3', 'P003', 'A003', 1500),
('B004', '2024-01-04', '4', 'P004', 'A004', 3500),
('B005', '2024-01-05', '5', 'P005', 'A001', 2500),
('B006', '2024-01-06', '6', 'P006', 'A002', 1800),
('B007', '2024-01-07', '7', 'P007', 'A003', 2200),
('B008', '2024-01-08', '8', 'P008', 'A004', 2700),
('B009', '2024-01-09', '9', 'P009', 'A001', 3200),
('B010', '2024-01-10', '10', 'P010', 'A002', 4000);


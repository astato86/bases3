UPDATE Medicamentos SET Nombre = 'Ibuprofeno' WHERE ID_medicamento = 'MED1';

DELETE FROM Clientes_Frecuentes WHERE Telefono = '987654321';

ALTER TABLE Medicamentos ADD COLUMN Precio DECIMAL(10, 2);
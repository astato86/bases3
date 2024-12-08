INSERT INTO Medicamentos(ID_medicamento, Nombre, Nombre_principio_activo, Fecha_de_vencimiento, Lote, Laboratorio) VALUES(/*aqui los valores de la web*/);
SELECT * FROM Medicamentos;
SELECT  Nombre, Nombre_principio_activo, Fecha_de_vencimiento, Lote FROM medicamentos WHERE nombre = /*aqui los valores de la web*/;
DELETE FROM Medicamentos WHERE Nombre = /*aqui los valores de la web*/;
UPDATE Medicamentos SET Nombre = /*aqui los valores de la web*/, Nombre_principio_activo = /*aqui los valores de la web*/, Fecha_de_vencimiento = /*aqui los valores de la web*/, Lote = /*aqui los valores de la web*/ WHERE Nombre = /*aqui los valores de la web*/;
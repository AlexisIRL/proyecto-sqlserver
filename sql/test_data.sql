USE EmpresaDB;
GO

INSERT INTO Ventas (Producto, Cantidad)
VALUES
    ('Laptop', 3),
    ('Monitor', 5),
    ('Teclado', 10),
    ('Mouse', 8),
    ('Impresora', 2);
GO

SELECT * FROM Ventas;
GO

SELECT * FROM AuditoriaVentas;
GO

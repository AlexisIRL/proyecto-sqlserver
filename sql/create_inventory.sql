USE EmpresaDB;
GO

CREATE TABLE Inventario (
    Producto VARCHAR(100) PRIMARY KEY,
    Existencias INT NOT NULL CHECK (Existencias >= 0)
);
GO

INSERT INTO Inventario (Producto, Existencias)
VALUES
    ('Laptop', 20),
    ('Monitor', 30),
    ('Teclado', 50),
    ('Mouse', 50),
    ('Impresora', 15);
GO

SELECT * FROM Inventario;
GO

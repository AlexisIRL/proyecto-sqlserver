USE EmpresaDB;
GO

CREATE OR ALTER TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM (
            SELECT Producto, SUM(Cantidad) AS Total
            FROM inserted
            GROUP BY Producto
        ) AS V
        LEFT JOIN Inventario AS I
            ON I.Producto = V.Producto
        WHERE I.Producto IS NULL
           OR I.Existencias < V.Total
    )
    BEGIN
        THROW 50002, 'Producto inexistente o inventario insuficiente.', 1;
    END;

    UPDATE I
    SET I.Existencias = I.Existencias - V.Total
    FROM Inventario AS I
    INNER JOIN (
        SELECT Producto, SUM(Cantidad) AS Total
        FROM inserted
        GROUP BY Producto
    ) AS V
        ON I.Producto = V.Producto;

    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    SELECT
        VentaID,
        'Venta registrada automáticamente'
    FROM inserted;
END;
GO

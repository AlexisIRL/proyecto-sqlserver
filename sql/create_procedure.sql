USE EmpresaDB;
GO

CREATE OR ALTER PROCEDURE sp_RegistrarAuditoria
    @Producto VARCHAR(100),
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;

    IF @Cantidad <= 0
        THROW 50001, 'La cantidad debe ser mayor que cero.', 1;

    INSERT INTO Ventas (Producto, Cantidad)
    VALUES (@Producto, @Cantidad);
END;
GO

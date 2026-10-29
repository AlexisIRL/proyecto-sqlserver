USE EmpresaDB;
GO

CREATE TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    SELECT
        VentaID,
        'Venta registrada automáticamente'
    FROM inserted;
END;
GO

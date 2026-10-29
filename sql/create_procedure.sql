USE EmpresaDB;
GO

CREATE OR ALTER PROCEDURE sp_RegistrarAuditoria
    @Producto VARCHAR(100),
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @Cantidad <= 0
            THROW 50001, 'La cantidad debe ser mayor que cero.', 1;

        UPDATE Inventario
        SET Existencias = Existencias - @Cantidad
        WHERE Producto = @Producto
          AND Existencias >= @Cantidad;

        IF @@ROWCOUNT = 0
            THROW 50002, 'Producto inexistente o inventario insuficiente.', 1;

        INSERT INTO Ventas (Producto, Cantidad)
        VALUES (@Producto, @Cantidad);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO

USE EmpresaDB;
GO

EXEC sp_RegistrarAuditoria 'Laptop', 3;
EXEC sp_RegistrarAuditoria 'Monitor', 5;
EXEC sp_RegistrarAuditoria 'Teclado', 10;
EXEC sp_RegistrarAuditoria 'Mouse', 8;
EXEC sp_RegistrarAuditoria 'Impresora', 2;
GO

SELECT * FROM Ventas;
GO

SELECT * FROM AuditoriaVentas;
GO

SELECT * FROM Inventario;
GO

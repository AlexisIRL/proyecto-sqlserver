USE EmpresaDB;
GO

EXEC sp_RegistrarAuditoria 'Laptop', 3;
EXEC sp_RegistrarAuditoria 'Monitor', 5;
GO

SELECT * FROM Ventas;
GO

SELECT * FROM AuditoriaVentas;
GO

SELECT * FROM Inventario;
GO

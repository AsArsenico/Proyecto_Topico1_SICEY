EXECUTE SP_InicioSesion_Baja @ID_Usuario = 1;

SELECT * 
FROM T_InicioSesion;

SELECT * 
FROM T_InicioSesionAuditoria;

--DELETE FROM T_InicioSesion;
--DBCC CHECKIDENT ('T_InicioSesion', RESEED, 0);

--DELETE FROM T_InicioSesionAuditoria;
--DBCC CHECKIDENT ('T_InicioSesionAuditoria', RESEED, 0);
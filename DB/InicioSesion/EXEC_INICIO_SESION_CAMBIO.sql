EXEC SP_InicioSesion_Cambio 
	@ID_Usuario = 1, 
	@Correo = 'cp.as@sicey.m',
	@Contra = '25896'

SELECT * 
FROM T_InicioSesion;
SELECT * 
FROM T_InicioSesionAuditoria;
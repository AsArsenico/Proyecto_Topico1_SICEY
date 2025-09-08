EXEC SP_Usuario_Cambio @ID_Usuario = 1, 
@Nombre = NULL,
	@Edad = NULL,
	@Correo = NULL,
	@Fecha_N = '2004-02-19',
	@PesoActual = NULL,
	@Altura = NULL

SELECT * 
FROM T_Usuarios;
SELECT * 
FROM T_UsuariosAuditoria;
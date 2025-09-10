EXEC SP_InicioSesion_Alta 
	@Correo = 'as.cp@sicey.m',
	@Contra = '12345'

EXEC SP_DatosUsuario_Alta
	@Nombre = 'Adrian Sosa',
	@Edad = 21,
	@Fecha_N = '2004-02-19',
	@PesoActual = 79.0,
	@Altura = 1.77,
	@ID_Usuario = 1;

SELECT * 
FROM T_InicioSesion;

SELECT * 
FROM T_DatosUsuario;

SELECT * 
FROM T_InicioSesionAuditoria;

SELECT * 
FROM T_DatosUsuarioAuditoria;

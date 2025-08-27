
EXEC SP_Usuario_Alta 
@Nombre = 'FAUSTO',
		@Edad = 20,
		@Correo = 'reccor',
		@Fecha_N = '2004-08-19',
		@PesoActual = 80.0,
		@Altura = 1.19

SELECT * 
FROM T_Usuarios;

SELECT * 
FROM T_UsuariosAuditoria;

CREATE PROCEDURE SP_InicioSesion_Alta --El @ indica que un parámetro que recibe el SP
@Correo NVARCHAR(50),
@Contra NVARCHAR(50),
@FechaRegistro DATETIME = NULL 
AS
BEGIN
	INSERT INTO T_InicioSesion(
		Correo,
		Contra,
		FechaRegistro
	) VALUES (
		@Correo,
		@Contra,
		ISNULL(@FechaRegistro,GETDATE())
	)
END
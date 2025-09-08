
CREATE PROCEDURE SP_Usuario_Alta
@Nombre NVARCHAR(50), --El @ indica que un parámetro que recibe el SP
@Edad INT,
@Correo NVARCHAR(50),
@Fecha_N DATE,
@PesoActual DECIMAL(5,2),
@Altura DECIMAL(5,2),
@FechaRegistro DATETIME = NULL 
AS
BEGIN
	INSERT INTO T_Usuarios(
		Nombre,
		Edad,
		Correo,
		Fecha_N,
		PesoActual,
		Altura,
		FechaRegistro
	) VALUES (
		@Nombre,
		@Edad,
		@Correo,
		@Fecha_N,
		@PesoActual,
		@Altura,
		ISNULL(@FechaRegistro,GETDATE())
	)
END

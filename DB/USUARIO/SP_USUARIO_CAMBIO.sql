CREATE PROCEDURE SP_Usuario_Cambio
	@ID_Usuario INT,
	@Nombre VARCHAR(50),
	@Edad INT,
	@Correo VARCHAR(50),
	@Fecha_N DATE,
	@PesoActual DECIMAL (5,2),
	@Altura DECIMAL(5,2)
	
AS
BEGIN
	IF @Nombre IS NOT NULL
	BEGIN
		UPDATE T_Usuarios
		SET Nombre = @Nombre
		WHERE ID_Usuario = @ID_Usuario
	END
	IF @Edad IS NOT NULL
	BEGIN
		UPDATE T_Usuarios
		SET Edad = @Edad
		WHERE ID_Usuario = @ID_Usuario
	END 
	IF @Correo IS NOT NULL
	BEGIN
		UPDATE T_Usuarios
		SET Correo = @Correo
		WHERE ID_Usuario = @ID_Usuario
	END

	IF @Fecha_N IS NOT NULL
	BEGIN
		UPDATE T_Usuarios
		SET Fecha_N = @Fecha_N
		WHERE ID_Usuario = @ID_Usuario
	END

IF @PesoActual IS NOT NULL
	BEGIN
		UPDATE T_Usuarios
		SET PesoActual = @PesoActual
		WHERE ID_Usuario = @ID_Usuario
	END 

IF @Altura IS NOT NULL
	BEGIN
		UPDATE T_Usuarios
		SET Altura = @Altura
		WHERE ID_Usuario = @ID_Usuario
	END 
END

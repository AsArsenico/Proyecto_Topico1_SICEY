CREATE PROCEDURE SP_InicioSesion_Cambio
	@ID_Usuario INT,
	@Correo NVARCHAR(50),
	@Contra NVARCHAR(50)
AS
BEGIN
	IF @Correo IS NOT NULL
	BEGIN
		UPDATE T_InicioSesion
		SET Correo = @Correo
		WHERE ID_Usuario = @ID_Usuario
	END
	IF @Contra IS NOT NULL
	BEGIN
		UPDATE T_InicioSesion
		SET Contra = @Contra
		WHERE ID_Usuario = @ID_Usuario
	END 
END
DROP PROCEDURE SP_InicioSesion_Cambio;
CREATE PROCEDURE SP_InicioSesion_Consulta
	@ID_Usuario INT
AS
BEGIN
	IF @ID_Usuario IS NOT NULL
	BEGIN
SELECT Correo, Contra, FechaRegistro
FROM V_InicioSesion
WHERE ID_Usuario = @ID_Usuario
	END
	ELSE
	BEGIN
SELECT Correo, Contra, FechaRegistro
FROM V_InicioSesion
	END
END
GO
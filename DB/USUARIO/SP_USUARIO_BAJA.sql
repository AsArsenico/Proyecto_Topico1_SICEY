--use SICEY
CREATE PROCEDURE SP_Usuario_Baja
	@ID_Usuario INT
AS
BEGIN
	DELETE
	FROM T_Usuarios
	WHERE ID_Usuario = @ID_Usuario
END

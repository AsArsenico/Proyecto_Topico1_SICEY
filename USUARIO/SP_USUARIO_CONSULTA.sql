--
CREATE PROCEDURE SP_Usuario_Consulta
	@ID_Usuario INT
AS
BEGIN
	IF @ID_Usuario IS NOT NULL
	BEGIN
SELECT Nombre, Edad, Correo, Fecha_N, PesoActual, Altura, FechaRegistro
FROM V_Usuarios
WHERE ID_Usuario = @ID_Usuario
	END
	ELSE
	BEGIN
SELECT Nombre, Edad, Correo, Fecha_N, PesoActual, Altura, FechaRegistro	
FROM V_Usuarios
	END
END
GO

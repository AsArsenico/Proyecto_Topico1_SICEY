CREATE PROCEDURE SP_InicioSesion_Baja
    @ID_Usuario INT
AS
BEGIN
    DELETE FROM T_DatosUsuario
    WHERE ID_Usuario = @ID_Usuario;

    DELETE FROM T_InicioSesion
    WHERE ID_Usuario = @ID_Usuario;
END

--DROP PROCEDURE SP_InicioSesion_Baja;
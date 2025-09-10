CREATE PROCEDURE SP_InicioSesion_ConsultarPorCorreo
    @Correo NVARCHAR(50)
AS
BEGIN
    -- El objetivo es encontrar al usuario por su correo.
    -- La API se encargará de verificar la contraseña.
    SELECT ID_Usuario, Correo, Contra
    FROM T_InicioSesion
    WHERE Correo = @Correo;
END

--IF OBJECT_ID('dbo.SP_InicioSesion_Consulta', 'P') IS NOT NULL
--    DROP PROCEDURE dbo.SP_InicioSesion_Consulta;
--GO

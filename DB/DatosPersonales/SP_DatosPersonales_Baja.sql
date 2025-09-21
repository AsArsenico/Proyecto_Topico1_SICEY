CREATE PROCEDURE SP_DatosPersonales_Baja
    @Correo NVARCHAR(50),
    @Contra NVARCHAR(50)
AS
BEGIN
    DECLARE @ID_Usuario INT;

    -- Buscar el ID del usuario según su correo y contraseña
    SELECT @ID_Usuario = ID_Usuario
    FROM T_InicioSesion
    WHERE Correo = @Correo AND Contra = @Contra;

    -- Validar si el usuario existe
    IF @ID_Usuario IS NULL
    BEGIN
        PRINT 'Error: Usuario no encontrado o contraseña incorrecta';
        RETURN;
    END

    -- Verificar si tiene datos personales registrados
    IF NOT EXISTS (SELECT 1 FROM T_DatosUsuario WHERE ID_Usuario = @ID_Usuario)
    BEGIN
        PRINT 'No hay datos personales registrados para este usuario';
        RETURN;
    END

    -- Eliminar los datos personales del usuario
    DELETE FROM T_DatosUsuario
    WHERE ID_Usuario = @ID_Usuario;

    PRINT 'Datos personales eliminados correctamente';
END;
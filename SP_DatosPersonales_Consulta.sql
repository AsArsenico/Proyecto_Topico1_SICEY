CREATE PROCEDURE SP_DatosPersonales_Consulta
    @Correo NVARCHAR(50)
AS
BEGIN
    DECLARE @ID_Usuario INT;

    -- Buscar el ID del usuario según correo
    SELECT @ID_Usuario = ID_Usuario
    FROM T_InicioSesion
    WHERE Correo = @Correo;

    -- Validar si el usuario existe
    IF @ID_Usuario IS NULL
    BEGIN
        PRINT 'Error: Usuario no encontrado';
        RETURN;
    END

    -- Verificar si hay datos personales
    IF NOT EXISTS (SELECT 1 FROM T_DatosUsuario WHERE ID_Usuario = @ID_Usuario)
    BEGIN
        PRINT 'No hay datos personales registrados para este usuario';
        RETURN;
    END

    -- Devolver los datos personales
    SELECT 
        Nombre,
        Edad,
        Fecha_N,
        PesoActual,
        Altura
    FROM T_DatosUsuario
    WHERE ID_Usuario = @ID_Usuario;
END;
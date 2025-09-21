CREATE PROCEDURE SP_DatosPersonales_Cambio
    @Correo NVARCHAR(50),
    @Contra NVARCHAR(50),
    @Nombre NVARCHAR(50),
    @Edad INT = NULL,
    @Fecha_N DATE,
    @PesoActual DECIMAL(5,3) = NULL,
    @Altura DECIMAL(5,2) = NULL
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

    -- Verificar si ya existen datos personales
    IF NOT EXISTS (SELECT 1 FROM T_DatosUsuario WHERE ID_Usuario = @ID_Usuario)
    BEGIN
        PRINT 'No existen datos personales para actualizar';
        RETURN;
    END

    -- Actualizar datos personales
    UPDATE T_DatosUsuario
    SET
        Nombre = @Nombre,
        Fecha_N = @Fecha_N,
        Edad = COALESCE(@Edad, Edad),
        PesoActual = COALESCE(@PesoActual, PesoActual),
        Altura = COALESCE(@Altura, Altura)
    WHERE ID_Usuario = @ID_Usuario;

    PRINT 'Datos personales actualizados correctamente';
END;
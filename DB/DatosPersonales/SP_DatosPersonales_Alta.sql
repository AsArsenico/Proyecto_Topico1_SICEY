CREATE PROCEDURE SP_DatosPersonales_Alta
    @Correo NVARCHAR(50),
    @Contra NVARCHAR(50),
    @Nombre NVARCHAR(50),
    @Edad INT,
    @Fecha_N DATE,
    @PesoActual DECIMAL(5,3),
    @Altura DECIMAL(5,2)
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

    -- Insertar los datos personales
    INSERT INTO T_DatosUsuario (
        Nombre,
        Edad,
        Fecha_N,
        PesoActual,
        Altura,
        ID_Usuario
    )
    VALUES (
        @Nombre,
        @Edad,
        @Fecha_N,
        @PesoActual,
        @Altura,
        @ID_Usuario
    );

    PRINT 'Datos personales registrados correctamente';
END;

--DROP PROCEDURE SP_DatosPersonales_Alta;
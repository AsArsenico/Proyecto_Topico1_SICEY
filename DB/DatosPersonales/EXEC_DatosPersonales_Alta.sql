EXEC SP_DatosPersonales_Alta
    @Correo = 'adrian.pioquinto',
    @Contra = 'AC',
    @Nombre = 'Cinthya Barriosz',
    @Edad = 23,
    @Fecha_N = '2000-01-01',
    @PesoActual = 65.000,
    @Altura = 1.65;

SELECT * FROM T_DatosUsuario;
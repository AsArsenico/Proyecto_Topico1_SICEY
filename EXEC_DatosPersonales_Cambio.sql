EXEC SP_DatosPersonales_Cambio
    @Correo = 'adrian.pioquinto',
    @Contra = 'AC',
    @Nombre = 'Cinthya Barriosz',  
    @Edad = 24,
    @Fecha_N = '2003-01-12',       
    @PesoActual = 65.500,
    @Altura = NULL;                 

SELECT * FROM T_DatosUsuario;
SELECT * FROM T_DatosUsuarioAuditoria;
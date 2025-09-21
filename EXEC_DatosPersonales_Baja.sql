EXEC SP_DatosPersonales_Baja
    @Correo = 'adrian.pioquinto',
    @Contra = 'AC';

SELECT * FROM T_DatosUsuario;
SELECT * FROM T_DatosUsuarioAuditoria;
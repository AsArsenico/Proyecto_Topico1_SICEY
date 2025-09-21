EXEC SP_DatosPersonales_Consulta
    @Correo = 'adrian.pioquinto'

SELECT * FROM T_DatosUsuario;
SELECT * FROM T_InicioSesion;
SELECT * FROM T_DatosUsuarioAuditoria;
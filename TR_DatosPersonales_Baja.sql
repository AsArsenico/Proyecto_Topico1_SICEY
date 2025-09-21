CREATE TRIGGER Tr_DatosPersonales_Baja
ON T_DatosUsuario
AFTER DELETE
AS
BEGIN
    INSERT INTO T_DatosUsuarioAuditoria(
        ID_Usuario,
	    Nombre,
	    Edad,
	    Fecha_N,
	    PesoActual,
	    Altura,
        MovimientoDUAuditoria,
        PerfilDUAuditoria,
	    FechaDUAuditoria
    )
    SELECT
        ID_Usuario,
	    Nombre,
	    Edad,
	    Fecha_N,
	    PesoActual,
	    Altura,
        'B',              -- B de baja
        USER_NAME(),
        GETDATE()
    FROM deleted;
END

SELECT * FROM T_DatosUsuarioAuditoria;
CREATE TRIGGER Tr_DatosPersonales_Cambio
ON T_DatosUsuario
AFTER UPDATE
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
        'C',
        USER_NAME(),
        GETDATE()
    FROM INSERTED;
END
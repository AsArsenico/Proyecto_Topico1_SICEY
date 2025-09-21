CREATE TRIGGER Tr_DatosUsuario_Alta
ON T_DatosUsuario
AFTER INSERT
AS 
BEGIN
	INSERT INTO T_DatosUsuarioAuditoria (
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

SELECT ID_Usuario,
		Nombre,
		Edad,
		Fecha_N,
		PesoActual,
		Altura,
		'A',
		USER_NAME(),
		GETDATE()
	FROM INSERTED;
END

SELECT * FROM T_DatosUsuarioAuditoria;

--DROP TRIGGER Tr_DatosUsuario_Alta;
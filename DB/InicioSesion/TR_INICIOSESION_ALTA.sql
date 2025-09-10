CREATE TRIGGER Tr_InicioSesion_Alta
ON T_InicioSesion
AFTER INSERT
AS 
BEGIN
	INSERT INTO T_InicioSesionAuditoria (
		ID_Usuario,
		Correo,
		Contra,
		FechaRegistro,
		MovimientoAuditoria,
		PerfilAuditoria,
		FechaAuditoria
)

SELECT ID_Usuario,
		Correo,
		Contra,
		FechaRegistro,
		'A',
		USER_NAME(),
		GETDATE()
	FROM INSERTED;
END
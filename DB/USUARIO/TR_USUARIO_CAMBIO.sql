
CREATE TRIGGER Tr_Usuario_Cambio
ON T_Usuarios
AFTER UPDATE
AS
BEGIN
	INSERT INTO T_UsuariosAuditoria (
		ID_Usuario,
		Nombre,
		Edad,
		Correo,
		Fecha_N,
		PesoActual,
		Altura,
		FechaRegistro,
		MovimientoAuditoria,
		PerfilAuditoria,
		FechaAuditoria
	)
	SELECT ID_Usuario,
		Nombre,
		Edad,
		Correo,
		Fecha_N,
		PesoActual,
		Altura,
		FechaRegistro,
		'C',
		USER_NAME(),
		GETDATE()
	FROM INSERTED;
END

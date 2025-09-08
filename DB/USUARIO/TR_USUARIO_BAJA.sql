CREATE TRIGGER Tr_Usuario_Baja
ON T_Usuarios
AFTER DELETE
AS
BEGIN
	INSERT INTO T_UsuariosAuditoria(
		ID_UsuarioAuditoria,
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
		'B',
		USER_NAME(),
		GETDATE()
	FROM deleted;
END

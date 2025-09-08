
CREATE TRIGGER Tr_Usuario_Alta
ON T_Usuarios
AFTER INSERT
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
		'A',
		USER_NAME(),
		GETDATE()
	FROM INSERTED;
END

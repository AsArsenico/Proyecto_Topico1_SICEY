CREATE TRIGGER Tr_InicioSesion_Baja
ON T_InicioSesion
AFTER DELETE
AS
BEGIN
    INSERT INTO T_InicioSesionAuditoria(
        ID_Usuario,
        Correo,
        Contra,
        FechaRegistro,
        MovimientoAuditoria,
        PerfilAuditoria,
        FechaAuditoria
    )
    SELECT
        ID_Usuario,
        Correo,
        Contra,
        FechaRegistro,
        'B',              -- B de baja
        USER_NAME(),
        GETDATE()
    FROM deleted;
END

--DROP TRIGGER Tr_InicioSesion_Baja;
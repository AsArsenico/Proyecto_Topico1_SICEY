CREATE TRIGGER Tr_InicioSesion_Cambio
ON T_InicioSesion
AFTER UPDATE
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
        Correo,
        Contra,
        FechaRegistro,
        'C',
        USER_NAME(),
        GETDATE()
    FROM INSERTED;
END

--DROP TRIGGER IF EXISTS Tr_InicioSesion_Cambio;
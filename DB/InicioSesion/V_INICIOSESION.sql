CREATE VIEW V_InicioSesion
AS
SELECT ID_Usuario,
Correo,
Contra,
FechaRegistro
FROM T_InicioSesion;
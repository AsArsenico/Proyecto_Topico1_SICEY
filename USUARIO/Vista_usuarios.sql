CREATE VIEW V_Usuarios
AS
SELECT ID_Usuario,
Nombre,
Edad,
Correo,
Fecha_N,
PesoActual,
Altura,
FechaRegistro
FROM T_Usuarios;

SELECT * FROM T_Usuarios;
SELECT * FROM V_Usuarios;

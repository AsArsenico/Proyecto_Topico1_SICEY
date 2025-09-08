CREATE TABLE T_Usuarios(
	ID_Usuario INT PRIMARY KEY IDENTITY (1,1),
	Nombre NVARCHAR(50) NOT NULL,
	Edad INT NOT NULL,
	Correo NVARCHAR(50) NOT NULL,
	Fecha_N DATE NOT NULL,
	PesoActual DECIMAL(5,3) NOT NULL,
	Altura DECIMAL(5,2) NOT NULL,
	FechaRegistro DATE DEFAULT GETDATE()
);

CREATE TABLE T_UsuariosAuditoria(
	ID_UsuarioAuditoria INT PRIMARY KEY IDENTITY (1,1),
	ID_Usuario INT,
	Nombre NVARCHAR(50),
	Edad INT, 
	Correo NVARCHAR(50),
	Fecha_N DATE,
	PesoActual DECIMAL(5,2),
	Altura DECIMAL(5,2),
	FechaRegistro DATE,
	MovimientoAuditoria NVARCHAR(1) NOT NULL, --- A = ALTA, B = BAJA, C = CAMBIO
	PerfilAuditoria NVARCHAR(100) NOT NULL,
	FechaAuditoria DATETIME NOT NULL
);



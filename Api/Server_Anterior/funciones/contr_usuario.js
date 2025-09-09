const { sql, config } = require('../db/sqlConfig');

exports.altaUsuario = async (req, res) => {
  const { Nombre, Edad, Correo, Fecha_N, PesoActual, Altura } = req.body;
  try {
    const pool = await sql.connect(config);
    await pool.request()
      .input('Nombre', sql.VarChar(50), Nombre)
      .input('Edad', sql.Int, Edad)
      .input('Correo', sql.VarChar(50), Correo)
      .input('Fecha_N', sql.Date, Fecha_N)
      .input('PesoActual', sql.Decimal(5, 2), PesoActual)
      .input('Altura', sql.Decimal(5, 2), Altura)
      .execute('SP_Usuario_Alta');
    res.status(200).json({ mensaje: 'Usuario dado de alta' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.cambioUsuario = async (req, res) => {
  const { ID_Usuario,Nombre, Edad, Correo, Fecha_N, PesoActual, Altura } = req.body;
  try {
    const pool = await sql.connect(config);
    await pool.request()
      .input('ID_Usuario', sql.Int,ID_Usuario)
      .input('Nombre', sql.VarChar(50), Nombre)
      .input('Edad', sql.Int, Edad)
      .input('Correo', sql.VarChar(50), Correo)
      .input('Fecha_N', sql.Date, Fecha_N)
      .input('PesoActual', sql.Decimal(5, 2), PesoActual)
      .input('Altura', sql.Decimal(5, 2), Altura)
      .execute('SP_Usuario_Cambio');
    res.status(200).json({ mensaje: 'Cambio realizado en el usuario' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.bajaUsuario = async (req, res) => {
  const { ID_Usuario} = req.body;
  try {
    const pool = await sql.connect(config);
    await pool.request()
      .input('ID_Usuario', sql.Int,ID_Usuario)
      .execute('SP_Usuario_Baja');
    res.status(200).json({ mensaje: 'Usuario dado de baja' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
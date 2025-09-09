const express = require('express');
require('dotenv').config();

const app = express();
app.use(express.json());

// Rutas
const rutas_usuario = require('./rutas/rutas_usuario');
app.use('/api/usuario', rutas_usuario);

// Puerto
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor en puerto ${PORT}`);
});
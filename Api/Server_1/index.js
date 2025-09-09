//Libreria express y dotenv
const express = require('express');
require('dotenv').config();

// 2. CONFIGURACIÓN INICIAL
// ================================================
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware para entender JSON
app.use(express.json());

// 3. CONFIGURACIÓN DE LA BASE DE DATOS (PARA EXPORTAR)
// ================================================
const dbConfig = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_HOST,
    database: process.env.DB_NAME,
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

// Exportamos la configuración para que otros archivos la puedan usar
module.exports.dbConfig = dbConfig;

// 4. RUTAS PRINCIPALES DE LA APLICACIÓN
// ================================================
app.use('/usuarios', require('./rutas/rutas.usuario'));

// 5. INICIAR EL SERVIDOR
// ================================================
app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto ${PORT}`);
});
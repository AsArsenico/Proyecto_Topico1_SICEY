//Libreria express y dotenv
const express = require('express');
const cors = require('cors'); // <-- CORS PARA LA PAGINA WEB
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

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

module.exports.dbConfig = dbConfig;


app.use('/usuarios', require('./rutas/rutas.usuario'));

app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto ${PORT}`);
});
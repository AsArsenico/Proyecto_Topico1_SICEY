// 1. IMPORTAR LAS HERRAMIENTAS NECESARIAS
// ================================================
const { Router } = require('express');
const sql = require('mssql');

// Obtenemos la configuración de la base de datos que ya tenemos en index.js
// Para ello la exportaremos desde ese archivo y la importaremos aqui
const { dbConfig } = require('../index.js');

const router = Router();

// 2. DEFINICIÓN DE LAS RUTAS PARA /usuarios
// ================================================

// ALTA (POST) - Ruta: /
router.post('/', async (req, res) => {
    const { Correo, Contra } = req.body;
    if (!Correo || !Contra) {
        return res.status(400).json({ msg: 'Por favor, envía Correo y Contra' });
    }
    try {
        let pool = await sql.connect(dbConfig);
        await pool.request()
            .input('Correo', sql.NVarChar(50), Correo)
            .input('Contra', sql.NVarChar(50), Contra)
            .execute('SP_InicioSesion_Alta');
        res.status(201).json({ msg: 'Usuario creado exitosamente' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: 'Error al crear el usuario' });
    }
});

// LECTURA (GET) - Ruta: /
router.get('/', async (req, res) => {
    try {
        let pool = await sql.connect(dbConfig);
        let result = await pool.request().query('SELECT ID_Usuario, Correo, FechaRegistro FROM T_InicioSesion');
        res.json(result.recordset);
    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: 'Error al obtener los usuarios' });
    }
});

// LECTURA POR ID (GET) - Ruta: /:id
router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        let pool = await sql.connect(dbConfig);
        let result = await pool.request()
            .input('ID_Usuario', sql.Int, id)
            .query('SELECT ID_Usuario, Correo, FechaRegistro FROM T_InicioSesion WHERE ID_Usuario = @ID_Usuario');
        if (result.recordset.length === 0) {
            return res.status(404).json({ msg: 'Usuario no encontrado' });
        }
        res.json(result.recordset[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: 'Error al obtener el usuario' });
    }
});

// CAMBIO (PUT) - Ruta: /:id
router.put('/:id', async (req, res) => {
    const { id } = req.params;
    const { Correo, Contra } = req.body;
    try {
        let pool = await sql.connect(dbConfig);
        await pool.request()
            .input('ID_Usuario', sql.Int, id)
            .input('Correo', sql.NVarChar(50), Correo)
            .input('Contra', sql.NVarChar(50), Contra)
            .execute('SP_InicioSesion_Cambio');
        res.json({ msg: 'Usuario actualizado exitosamente' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: 'Error al actualizar el usuario' });
    }
});

// BAJA (DELETE) - Ruta: /:id
router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        let pool = await sql.connect(dbConfig);
        await pool.request()
            .input('ID_Usuario', sql.Int, id)
            .execute('SP_InicioSesion_Baja');
        res.json({ msg: 'Usuario eliminado exitosamente' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: 'Error al eliminar el usuario' });
    }
});

router.post('/login', async (req, res) => {
    const { Correo, Contra } = req.body;

    if (!Correo || !Contra) {
        return res.status(400).json({ msg: 'Por favor, envía Correo y Contra' });
    }

    try {
        let pool = await sql.connect(dbConfig);
        
        // Ejecutamos el SP para buscar al usuario por su correo
        let result = await pool.request()
            .input('Correo', sql.NVarChar(50), Correo)
            .execute('SP_InicioSesion_ConsultarPorCorreo');
        
        const usuario = result.recordset[0];

        // Verificamos si encontramos un usuario
        if (!usuario) {
            return res.status(400).json({ msg: 'Credenciales inválidas' });
        }

        // Comparamos la contraseña enviada con la de la base de datos
        // (Esto es comparación de texto plano, como lo pediste para las pruebas)
        if (usuario.Contra !== Contra) {
            return res.status(400).json({ msg: 'Credenciales inválidas' });
        }

        // Si todo es correcto, el inicio de sesión es exitoso
        res.json({
            msg: 'Inicio de sesión exitoso',
            usuario: {
                ID_Usuario: usuario.ID_Usuario,
                Correo: usuario.Correo
            }
        });

    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: 'Error en el servidor' });
    }
});
// 3. EXPORTAR EL ROUTER
// ================================================
module.exports = router;
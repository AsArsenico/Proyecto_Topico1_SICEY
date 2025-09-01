const express = require('express');
const router = express.Router();
const contr_usuario = require('../funciones/contr_usuario');

router.post('/alta', contr_usuario.altaUsuario);
router.put('/cambio', contr_usuario.cambioUsuario);
router.delete('/baja', contr_usuario.bajaUsuario);

module.exports = router;
const sql = require('mssql');

const config = {
  server: 'localhost',
  user: 'SICEY_User',
  password: 'PERFIL_SICEY',
  database: 'SICEY',
  port: 1433,
  options: {
    encrypt: false,
    trustServerCertificate: true
  }
};

sql.connect(config)
  .then(() => {
    console.log('✅ Conexión exitosa');
    sql.close();
  })
  .catch(err => {
    console.error('❌ Error de conexión:', err.message);
  });
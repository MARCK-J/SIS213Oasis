<template>
  <div class="dashboard">
    <h1>Dashboard</h1>
    <div class="total-registros">
      <h2>Datos de Auditoria</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Actividad</th>
            <th>Usuario</th>
            <th>Fecha</th>
            <th>Hora</th>
            <th>Fecha Fin</th>
            <th>Hora Fin</th>
            <th>IP</th>
          </tr>
        </thead>
        <tbody>
          
          
          
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TableAudit',
};
</script>

<style scoped>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

.dashboard {
  width: 95%;
  margin: 20px auto;
  text-align: left;
}

.total-registros {
  background-color: #FCEEDA;
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0 0px 8px rgba(0, 0, 0, 0.1);
  position: relative;
  text-align: center;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

th, td {
  border: 1px solid #FFD28E;
  padding: 8px;
  text-align: left;
}

th {
  background-color: #FFD28E;
}
</style>

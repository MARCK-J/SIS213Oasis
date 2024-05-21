<template>
  <div class="dashboard">
    <div class="dashboardTitle">
      <h1>Dashboard</h1>
      <button>
        <router-link to="/RegistroAdmin" class="enlacerouter"> Registrar Administrador</router-link>
      </button>
    </div>
    <div class="total-registros">
      <h2>Datos de Auditoria</h2>
      <table>
        <thead>
        <tr>
          <th>ID</th>
          <th>Actividad</th>
          <th>Administrador</th>
          <th>Usuario</th>
          <th>Fecha</th>
          <th>Hora</th>
          <th>Fecha Inicio</th>
          <th>Fecha Fin</th>
          <th>IP</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="(auditoria, index) in auditorias" :key="index">
          <td>{{ auditoria.idAudit }}</td>
          <td>{{ auditoria.actividad }}</td>
          <td>{{ auditoria.idAdmin }}</td>
          <td>{{ auditoria.idCliente }}</td>
          <td>{{ auditoria.fecha }}</td>
          <td>{{ auditoria.hora }}</td>
          <td>{{ auditoria.fechaInicio }}</td>
          <td>{{ auditoria.fechaFin }}</td>
          <td>{{ auditoria.ip }}</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'TableAudit',
  data() {
    return {
      auditorias: [],
    };
  },
  created() {

    this.getAuditorias();
  },
  methods: {
    async getAuditorias(userId) {
      try {
        const response = await axios.get(`http://localhost:9999/api/v1/auditoria`);
        this.auditorias = response.data.result; // Acceder a la propiedad `result` en la respuesta
        console.log('Auditorias cargadas exitosamente:', this.auditorias);
      } catch (error) {
        console.error('Error al cargar las auditorias:', error);
      }
    },
  },

};
</script>

<style scoped>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}
.dashboardTitle{
  display: flex;
  flex-direction: row;
  padding-bottom: 50px;
}
.dashboardTitle button{
  margin-left: 30px;
  border-radius: 20px;
  border: 2px solid black;
  padding: 10px 20px;
  background-color: rgb(84, 84, 239); 
}

.dashboard {
  width: 95%;
  margin: 20px auto;
  text-align: left;
}
.enlacerouter{
  color: #fff;
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

<template>
  <div class="app">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6 left-side">
          <img src="../assets/img.png" alt="Imagen" class="left-image">
        </div>
        <div class="col-md-6 right-side">
          <h2>Registro de Datos Personales</h2>
          <form @submit.prevent="createPersona" class="form-container">
            <div class="form-group">
              <input type="text" v-model="nombre" class="form-control" placeholder="Nombre" required>
            </div>
            <div class="form-group">
              <input type="text" v-model="apellidoP" class="form-control" placeholder="Apellido Paterno" required>
            </div>
            <div class="form-group">
              <input type="text" v-model="apellidoM" class="form-control" placeholder="Apellido Materno">
            </div>
            <div class="form-group">
              <input type="tel" v-model="telefono" class="form-control" placeholder="Teléfono">
            </div>
            <h2>Registro de Cuenta</h2>
            <div class="form-group">
              <input type="text" v-model="correo" class="form-control" placeholder="Correo electronico">
            </div>
            <div class="form-group">
              <input type="password" v-model="password" class="form-control" placeholder="Contraseña">
            </div>
            <div class="form-group">
              <input type="password" v-model="passwordConf" class="form-control" placeholder="Confirmar contraseña">
            </div>
            <div class="button-group">
              <button type="button" @click="goBack" class="btn btn-secondary">Regresar</button>
              <input type="submit" value="Continuar" class="btn btn-primary">
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      personas:[],
      nombre: '',
      apellidoP: '',
      apellidoM: '',
      telefono: '',
      correo: '',
      password: '',
      passwordConf: '',
    };
  },
  methods: {
    async createPersona(){
      try {
        // Enviar solicitud para crear una persona
        const response = await axios.post('http://localhost:9999/api/v1/persona/create',{
          nombre: this.nombre,
          apellidoP: this.apellidoP,
          apellidoM: this.apellidoM,
          telefono: this.telefono,
        });

        const nuevaPersona = response.data.data;
        console.log("Persona created");

        // Enviar solicitud para obtener el id de la ultima persona creada
        const response2 = await axios.get('http://localhost:9999/api/v1/persona/lastId');
        const lastPersona = response2.data.result;
        console.log("Last persona",lastPersona);

        // Enviar solicitud para crear una cuenta
        const response3 = await axios.post('http://localhost:9999/api/v1/cliente/create',{
          correo: this.correo,
          password: this.password,
          estadoCuenta: 'Activa',
          idPersona: lastPersona,
        });

        const nuevaCuenta = response3.data.data;
        console.log("Cuenta created");


        // Limpiar campos
        this.nombre = '';
        this.apellidoP = '';
        this.apellidoM = '';
        this.telefono = '';
        this.correo = '';
        this.password = '';
        this.passwordConf = '';

        this.$router.push('/'); // Redirige a la ruta de Login

      } catch (error){
        console.error("Error al crear la persona",error)
      }

    },

    goBack() {
      this.$router.push('/');
    }
  }
};
</script>

<style scoped>
html, body {
  height: 100%;
  margin: 0;
  color: white;
  font-size: 24px;
}

.app {
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.78); /* Color de fondo */
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
}

.left-side {
  padding: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.left-image {
  max-width: 100%;
  max-height: 100%;
}

.right-side {
  padding: 20px; /* Ajustar el padding */
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center; /* Centrar el contenido horizontalmente */
  height: 100vh;
}

.form-container {
  width: 90%; /* Ancho del formulario aumentado */
}

.form-group {
  margin-bottom: 15px;
}

input[type="text"],
input[type="tel"],
input[type="password"] {
  padding: 15px; /* Ajustar el padding */
  border: none;
  border-bottom: 2px solid #000; /* Aumentar el grosor de la línea inferior */
  background-color: transparent;
  margin-bottom: 20px; /* Ajustar el margen inferior */
  color: white;
}

.button-group {
  margin-top: 20px; /* Espacio entre los botones */
  display: flex;
  justify-content: space-between; /* Colocar los botones en los extremos */
  width: 100%; /* Ajustar el ancho del contenedor de botones */
}
</style>
<script setup lang="ts">
</script>
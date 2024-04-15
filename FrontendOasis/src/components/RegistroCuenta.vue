  <template>
  <div id="app">
    <div class="container">
      <div class="left-side">
        <img src="./assets/img.png" alt="Imagen" >
      </div>
      <div class="right-side">
        <h2>Registro de Datos</h2>
        <form @submit.prevent="createPersona" class="form-container">
          <div class="form-group">
            <input type="text" v-model="nombre" placeholder="Nombre" required>
          </div>
          <div class="form-group">
            <input type="text" v-model="apellidoP" placeholder="Apellido Paterno" required>
          </div>
          <div class="form-group">
            <input type="text" v-model="apellidoM" placeholder="Apellido Materno">
          </div>
          <div class="form-group">
            <input type="tel" v-model="telefono" placeholder="Teléfono">
          </div>
          <div class="button-group">
            <button type="button" @click="goBack">Regresar</button>
            <input type="submit" value="Continuar">
          </div>
        </form>
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

        // Limpiar campos
        this.nombre = '';
        this.apellidoP = '';
        this.apellidoM = '';
        this.telefono = '';

      } catch (error){
        console.error("Error al crear la persona",error)
      }

    },

    submitForm() {
      // Aquí puedes manejar el envío del formulario, por ejemplo, enviar los datos a un servidor
      console.log('Nombre:', this.nombre);
      console.log('Apellido Paterno:', this.apellidoP);
      console.log('Apellido Materno:', this.apellidoM);
      console.log('Teléfono:', this.telefono);
    },
    goBack() {
      // Lógica para regresar, por ejemplo, redireccionar a la página anterior
      console.log('Ir hacia atrás');
    }
  }
};
</script>

<style>
html, body {
  height: 100%;
  margin: 0;
  color: white;
  font-size: 24px;
}

#app {
  height: 100%;
}

.container {
  display: flex;
  flex-direction: row;
  height: 100%;
  width: 100%;
  background-color: rgba(0, 0, 0, 0.78);
  border-radius: 10px;
  overflow: hidden;
}

.left-side {
  flex: 1;
  padding: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.left-image {
  max-width: 100%; /* Ajustar el tamaño máximo de la imagen */
  max-height: 100%; /* Ajustar el tamaño máximo de la imagen */
}

.right-side {
  flex: 1;
  padding: 20px 40px 20px 20px; /* Ajustar el padding */
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center; /* Centrar el contenido horizontalmente */
}

.form-container {
  width: 90%; /* Ancho del formulario aumentado */
}

.form-group {
  margin-bottom: 15px;
}

input[type="text"],
input[type="tel"] {
  width: 100%;
  padding: 15px; /* Ajustar el padding */
  border: none;
  border-bottom: 2px solid #000; /* Aumentar el grosor de la línea inferior */
  background-color: transparent;
  margin-bottom: 20px; /* Ajustar el margen inferior */
}

.button-group {
  margin-top: 20px; /* Espacio entre los botones */
  display: flex;
  justify-content: space-between; /* Colocar los botones en los extremos */
  width: 100%; /* Ajustar el ancho del contenedor de botones */
}

input[type="submit"],
button {
  padding: 15px 30px; /* Ajustar el padding */
  border: none;
  border-radius: 8px; /* Ajustar el radio del borde */
  background-color: #6c757d;
  color: white;
  cursor: pointer;
}

input[type="submit"]:hover,
button:hover {
  background-color: #5a6268;
}
</style>

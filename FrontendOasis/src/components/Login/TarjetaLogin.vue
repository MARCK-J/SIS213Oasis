<template>
  <div class="TarjetaLogin">
    <img src="src/assets/logo_black.png" alt="Logo Oasis" />
    <br />
    <h3>Bienvenido</h3>
    <p>Inicie su sesión para continuar en Oasis</p>
    <form @submit.prevent="continuar" class="form">
      <input

        placeholder="Ingrese su nombre de usuario"
        type="text"
        v-model="correo"
      />
      <input

        placeholder="Ingrese su contraseña"
        type="password"
        v-model="password"
      />
      <router-link to="" class="enlace">¿Olvidaste tu contraseña?</router-link>
      <button type="submit">Continuar</button>
    </form>
    <div class="registro-enlace-container">
      <span>¿No tienes una cuenta?</span>
      <router-link to="/RegistroPersona" class="enlace">Regístrate</router-link>
    </div>
    <GoogleLogin :callback="callback" prompt auto-login />
  </div>
</template>

<script>
import {defineComponent, ref} from 'vue';
import { useStore } from 'vuex';
import { decodeCredential } from "vue3-google-login";
import CustomInput from "./CustomInput.vue";
import { useRouter } from "vue-router";
import axios from 'axios';



export default defineComponent({
  name: "TarjetaLogin",
  data() {
    return {
      correo: '',
      password: '',
      actividad: '',
      fecha: "",
      hora: "",
      fechaInicio: "",
      fechaFin: "",
      ipAddress: "",
      idAdmin: 0,
      idCliente: 0,

    };
  },
  components: {
    CustomInput,
  },

  setup() {
    const store = useStore();
    const router = useRouter();

    const actividad = ref('');
    const fecha = ref('');
    const hora = ref('');
    const fechaInicio = ref('');
    const fechaFin = ref('');
    const ipAddress = ref('');
    const idAdmin = ref('');
    const idCliente = ref('');

    const calcularFecha = () => {
      const ahora = new Date();
      const dia = String(ahora.getDate()).padStart(2, '0');
      const mes = String(ahora.getMonth() + 1).padStart(2, '0');
      const anio = ahora.getFullYear();
      const horas = String(ahora.getHours()).padStart(2, '0');
      const minutos = String(ahora.getMinutes()).padStart(2, '0');
      const segundos = String(ahora.getSeconds()).padStart(2, '0');

      fecha.value = `${anio}-${mes}-${dia}`;
      hora.value = `${horas}:${minutos}:${segundos}`;
      fechaInicio.value = `${fecha.value}T${hora.value}`;
      fechaFin.value = `${fecha.value}T${hora.value}`;
    };

    const getIPAddress = async () => {
      try {
        const response = await fetch('https://api.ipify.org?format=json');
        const data = await response.json();
        console.log("IP: ", data.ip);
        ipAddress.value = data.ip;
      } catch (error) {
        console.error('Error al obtener la dirección IP:', error);
      }
    };

    const auditoriaUser = async () => {

      try {
        actividad.value = "Inicio Sesion Google"
        await axios.post('http://localhost:9999/api/v1/auditoria/create', {
          actividad: actividad.value,
          fecha: fecha.value,
          hora: hora.value,
          fechaInicio: "",
          fechaFin: fechaFin.value,
          ip: ipAddress.value,
          idAdmin: null,
          idCliente: parseInt(idCliente.value, 16)
        });

        console.log("Auditoria created");
      } catch (error) {
        console.error('Error al crear la auditoría:', error);
      }
    };


    const callback = async (response) => {

      console.log("Inicio de sesión con éxito");
      const user = decodeCredential(response.credential);
      store.commit('setLoggedIn', true);
      store.commit('setUser', user);
      console.info("SUB: ",user.sub )
      store.commit('setId', user.sub);
      calcularFecha();
      await getIPAddress();


      console.info("ID SUB: ",store.state.id )


      idAdmin.value = null;
      idCliente.value = parseInt(store.state.id, 16);
      await auditoriaUser();

      router.push("/");


    };
    return {
      callback,
      user: store.state.user,
    };
  },

  created() {
    // Calcular IP
    this.getIPAddress();
  },

  methods: {
    calcularFecha() {
      const ahora = new Date();
      const dia = String(ahora.getDate()).padStart(2, '0');
      const mes = String(ahora.getMonth() + 1).padStart(2, '0');
      const anio = ahora.getFullYear();
      const horas = String(ahora.getHours()).padStart(2, '0');
      const minutos = String(ahora.getMinutes()).padStart(2, '0');
      const segundos = String(ahora.getSeconds()).padStart(2, '0');

      this.fecha = `${anio}-${mes}-${dia}`;
      this.hora = `${horas}:${minutos}:${segundos}`;
      this.fechaInicio = `${this.fecha}T${this.hora}`;
    },

    async getIPAddress() {
      try {
        const response = await fetch('https://api.ipify.org?format=json');
        const data = await response.json();
        console.log("IP: ", data.ip);
        return this.ipAddress = data.ip;

      } catch (error) {
        console.error('Error al obtener la dirección IP:', error);
      }

    },

    async auditoriaUser (actividad, fecha, hora, fechaInicio, fechaFin, ip, idAdmin, idCliente){
      // Enviar solicitud para crear una auditoria
      const response = await axios.post('http://localhost:9999/api/v1/auditoria/create',{
        actividad: actividad,
        fecha: fecha,
        hora: hora,
        fechaInicio: fechaInicio,
        fechaFin: fechaFin,
        ip: ip,
        idAdmin: idAdmin,
        idCliente: idCliente
      });

      const nuevaPersona = response.data.data;
      console.log("Auditoria created");

    },

    async loginPersona () {
      const store = useStore();
      const router = useRouter();
      try {
        // Realiza una solicitud POST al endpoint de inicio de sesión
        const response = await axios.post('http://localhost:9999/api/v1/cliente/login', {
          correo: this.correo, // Usa el valor del nombre de usuario del input
          password: this.password // Usa el valor de la contraseña del input
        });

        const user = response.data.code;
        if (user === '200-OK') {



          // Si el inicio de sesión es exitoso, guarda el usuario en el store y redirige a la página principal
          this.$store.commit('setLoggedIn', true);
          this.$store.commit('setUser', user);
          console.info("ID: ", response.data.result["idCliente"]);
          this.$store.commit('setId', response.data.result["idCliente"]);
          this.$store.commit('setRol', "Cliente");



          // Calcular fechas
          this.calcularFecha();



          // Registrar auditoria:
          this.actividad = "Inicio de Sesion";
          console.info("ID: ", this.$store.state.id);
          //this.idAdmin.value = this.$store.state.id;
          this.idAdmin = null;
          this.idCliente = this.$store.state.id;
          await this.auditoriaUser(this.actividad, this.fecha, this.hora, this.fechaInicio,
              this.fechaFin, this.ipAddress, this.idAdmin , this.idCliente);



          //router.push("/");
          this.$router.push('/');
        } else {
          // Si el inicio de sesión no es exitoso, muestra un mensaje de error
          console.error('Error al iniciar sesión:', response.data.message);
          alert('Error al iniciar sesión: Correo o contraseña incorrectos');
        }

      } catch (error) {
        console.error('Error al iniciar sesión:', error);
        alert('Error al iniciar sesión');
      }
    },

    async loginAdmin () {
      const store = useStore();
      const router = useRouter();
      try {
        // Realiza una solicitud POST al endpoint de inicio de sesión
        const response = await axios.post('http://localhost:9999/api/v1/admin/login', {
          correo: this.correo, // Usa el valor del nombre de usuario del input
          password: this.password // Usa el valor de la contraseña del input
        });

        const user = response.data.code;
        if (user === '200-OK') {
          // Si el inicio de sesión es exitoso, guarda el usuario en el store y redirige a la página principal
          this.$store.commit('setLoggedIn', true);
          this.$store.commit('setUser', user);
          console.info("ID: ", response.data.result["idAdmin"]);
          this.$store.commit('setId', response.data.result["idAdmin"]);
          this.$store.commit('setRol', "Admin");

          // Calcular fechas
          this.calcularFecha();


          // Registrar auditoria:
          this.actividad = "Inicio de Sesion";
          console.info("ID: ", this.$store.state.id);
          //this.idAdmin.value = this.$store.state.id;
          this.idAdmin = this.$store.state.id;
          this.idCliente = null;
          await this.auditoriaUser(this.actividad, this.fecha, this.hora, this.fechaInicio,
              this.fechaFin, this.ipAddress, this.idAdmin , this.idCliente);

          //router.push("/");
          this.$router.push('/Dashboard');
        } else {
          // Si el inicio de sesión no es exitoso, muestra un mensaje de error
          console.error('Error al iniciar sesión:', response.data.message);
          alert('Error al iniciar sesión: Correo o contraseña incorrectos');
        }

      } catch (error) {
        console.error('Error al iniciar sesión:', error);
        alert('Error al iniciar sesión');
      }
    },

    async verificarCorreoAdmin(correo) {
      if (correo.includes('@oasis')) {
        // El correo contiene el dominio "@oasis", realiza la acción deseada
        console.log('El correo ingresado pertenece a la empresa');
        await this.loginAdmin();
      } else {
        // El correo no contiene el dominio "@oasis"
        console.log('El correo ingresado no pertenece a la empresa');
        await this.loginPersona();
      }
    },

    async continuar (){
      console.log("Usuario:", this.correo);
      console.log("ENTRA", this.correo, this.password);
      // Validar los campos, por ejemplo, si están llenos
      if (this.correo && this.password) {
        // Si los campos son válidos, llamar a loginPersona para iniciar sesión
        // Llamar al método para verificar el correo
        this.verificarCorreoAdmin(this.correo);
      } else {
        // Si los campos no son válidos, puedes mostrar un mensaje de error o realizar otra acción
        console.error("Por favor, llena todos los campos");
        window.alert("Por favor, llena todos los campos");
      }
    },
  }
});
</script>

<style>
.form {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.TarjetaLogin {
  background: #d5f3fb;
  border: 3px solid black;
  width: 25%;
  height: fit-content;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 20px 8px;
  border-radius: 30px;
}

.TarjetaLogin img {
  width: 35%;
}

.enlace {
  margin: 10px 0px;
}

.TarjetaLogin button {
  width: 85%;
  border-radius: 25px;
  padding: 10px;
  background-color: blue;
  border: 2px solid black;
  color: #fff;
}

.registro-enlace-container {
  display: flex;
  flex-direction: row;
  align-items: center;
}
@media (max-width: 860px) {
  .TarjetaLogin {
    width: 70%;
    padding: 10px 2px;
  }
}
</style>

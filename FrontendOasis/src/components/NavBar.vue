<template>
  <div class="nav-container">
    <nav class="navbar navbar-expand-md navbar-light custom-navbar-color">
      <div class="container">
        <img id="logo" src="/src/assets/logo.png" alt="Logo de Oasis">
        <button
            id="custom-button"
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <router-link to="/" class="nav-link">Home</router-link>
            </li>
          </ul>
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <router-link to="/Hotel" class="nav-link">Hoteles</router-link>
            </li>
          </ul>
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <router-link to="/vuelos" class="nav-link">Vuelos</router-link>
            </li>
          </ul>
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <router-link to="/Autos" class="nav-link">Autos</router-link>
            </li>
          </ul>
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <router-link to="/quienes_somos" class="nav-link">Quienes Somos</router-link>
            </li>
          </ul>
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <router-link to="/contactanos" class="nav-link">Contactanos</router-link>
            </li>
          </ul>
          <ul class="navbar-nav mr-auto">
            <li v-if="!isAuthenticated" class="nav-item">
              <router-link to="/RegistroPersona" class="nav-link">Registrarse</router-link>
            </li>
          </ul>
          <ul class="navbar-nav mr-auto">
            <li v-if="!isAuthenticated" class="nav-item">
              <router-link to="" class="nav-link" @click.prevent="login">Login</router-link>
            </li>
          </ul>
<ul class="navbar-nav mr-auto d-none d-md-block">
            <li class="nav-item dropdown" v-if="isAuthenticated">
              <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="profileDropDown"
                  data-toggle="dropdown"
              >
                <img
                    :src="user.picture ? user.picture : ('/src/assets/deafult.jpeg')"
                    alt="User's profile picture"
                    class="nav-user-profile rounded-circle"
                    width="100"
                />
              </a>
              <div class="dropdown-menu dropdown-menu-right ">
                <router-link to="/profile" class="dropdown-item dropdown-profile">
                  <font-awesome-icon class="mr-3" icon="user" />Profile
                </router-link>
                <a id="qsLogoutBtn" href="#" class="dropdown-item" @click.prevent="logout">
                  <font-awesome-icon class="mr-3" icon="power-off" />Log out
                </a>
              </div>
            </li>
          </ul>


          <ul
              id="mobileAuthNavBar"
              class="navbar-nav d-md-none d-flex"
              v-if="isAuthenticated"
          >
            <li class="nav-item">
              <span class="user-info">
                <img
                    :src="user.picture"
                    alt="User's profile picture"
                    class="nav-user-profile d-inline-block rounded-circle mr-3"
                    width="50"
                />
                <h6 class="d-inline-block">{{ user.name }}</h6>
              </span>
            </li>
            <li>
              <font-awesome-icon icon="user" class="mr-3" />
              <router-link to="/profile">Profile</router-link>
            </li>

            <li>
              <font-awesome-icon icon="power-off" class="mr-3" />
              <a id="qsLogoutBtn" href="#" class @click.prevent="logout">Log out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue'; // Importa ref desde vue
import { useStore } from 'vuex';
import { useRouter } from "vue-router";
import { googleLogout } from 'vue3-google-login';
import axios from "axios";


export default defineComponent({
  name: "NavBar",
  setup() {
    const store = useStore();
    const router = useRouter();
    const isAuthenticated = ref(store.state.loggedIn);
    const user = ref(store.state.user);

    const actividad = ref('');
    const fecha = ref('');
    const hora = ref('');
    const fechaInicio = ref('');
    const fechaFin = ref('');
    const ipAddress = ref('');
    const idAdmin = ref('');
    const idCliente = ref('');

    const login = () => {
      router.push("/login");
    };

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
        actividad.value = "Cierrre Sesion"
        await axios.post('http://localhost:9999/api/v1/auditoria/create', {
          actividad: actividad.value,
          fecha: fecha.value,
          hora: hora.value,
          fechaInicio: "",
          fechaFin: fechaFin.value,
          ip: ipAddress.value,
          idAdmin: idAdmin.value,
          idCliente: idCliente.value
        });

        console.log("Auditoria created");
      } catch (error) {
        console.error('Error al crear la auditoría:', error);
      }
    };

    const logout = async () => {
      try {
        calcularFecha();
        await getIPAddress();

        console.log("ROL: ", store.state.rol);
        if (store.state.rol === 'Admin') {
          idAdmin.value = store.state.id;
          idCliente.value = '';
          console.info("Id Cliente: ", idCliente.value);
          console.info("Id Admin: ", idAdmin.value);
        } else if (store.state.rol === 'Cliente') {
          idCliente.value = store.state.id;
          idAdmin.value = '';
          console.info("Id Cliente: ", idCliente.value);
          console.info("Id Admin: ", idAdmin.value);
        }
        await auditoriaUser();

        console.log("Proceso de cerrado de sesión");
        googleLogout();
        store.commit('setLoggedIn', false);
        store.commit('setUser', null);
        console.log("Cierre completado");
        router.push("/");
        window.location.reload();
      } catch (error) {
        console.error('Error al cerrar sesión:', error);
      }
    };

    return {
      isAuthenticated,
      user,
      login,
      logout
    };
  },
  data() {
    return {
      tiempoRestante: 5*60, // 5 minutos en segundos
      temporizador: null as number | null
    };
  },
  mounted() {
    // Iniciar el temporizador
    this.temporizador = setTimeout(this.realizarAccion, this.tiempoRestante * 1000);
  },
  methods: {
    async realizarAccion() {
      const store = useStore();
      const router = useRouter();
      console.log("Proceso de cerrado de sesión");
      this.logout();
      // Aquí puedes poner la acción que quieras realizar después de 5 minutos
      console.log("Han pasado 5 minutos. Se realiza la acción.");

      // También puedes reiniciar el temporizador si deseas que se repita la acción después de cada intervalo de 5 minutos
      this.tiempoRestante = 5*60;
      this.temporizador = setTimeout(this.realizarAccion, this.tiempoRestante * 1000);
      clearTimeout(this.temporizador);
    }
  },

});
</script>


<style scoped>
.custom-navbar-color {
    background-color: black;
}
.navbar-nav .nav-link {
    color: #fff; /* Color del texto en blanco */
}
.navbar-nav .nav-link:hover {
    color: #939292; /* Color del texto en blanco */
}
#custom-button {
  background-color: rgb(184, 178, 178); /* Cambia el color de fondo del botón */
  color: white; /* Cambia el color del texto del botón */
}
#logo{
    margin: 4px 30px;
    width: 8%;
}
#mobileAuthNavBar {
  min-height: 125px;
  justify-content: space-between;
}
</style>
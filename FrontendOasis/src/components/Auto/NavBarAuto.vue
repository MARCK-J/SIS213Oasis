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
            <li class="nav-item">
              <router-link to="/Hotel" class="nav-link">Hoteles</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/vuelos" class="nav-link">Vuelos</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/Autos" class="nav-link">Autos</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/quienes_somos" class="nav-link">Quienes Somos</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/contactanos" class="nav-link">Contactanos</router-link>
            </li>
            <li v-if="!isAuthenticated" class="nav-item">
              <router-link to="/RegistroPersona" class="nav-link">Registrarse</router-link>
            </li>
            <li v-if="!isAuthenticated" class="nav-item">
              <router-link to="" class="nav-link" @click.prevent="login">Login</router-link>
            </li>
          </ul>

          <ul class="navbar-nav ml-auto">
            <!-- Mapa Icono con opciones -->
            <li class="nav-item dropdown">
              <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="mapDropdown"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
              >
                <img src="src/assets/icono.png" alt="Map Icon" class="nav-icon">
              </a>
              <div class="dropdown-menu" aria-labelledby="mapDropdown">
                <a class="dropdown-item" href="#" @click.prevent="changeCountry('bolivia')">Bolivia</a>
                <a class="dropdown-item" href="#" @click.prevent="changeCountry('brasil')">Brasil</a>
                <a class="dropdown-item" href="#" @click.prevent="changeCountry('republica_dominicana')">República Dominicana</a>
                <a class="dropdown-item" href="#" @click.prevent="changeCountry('mexico')">mexico</a>
                <a class="dropdown-item" href="#" @click.prevent="changeCountry('Argentina')">Argentina</a>

              </div>
            </li>

            <li class="nav-item dropdown" v-if="isAuthenticated">
              <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="profileDropDown"
                  data-toggle="dropdown"
              >
                <img
                    :src="user.picture ? user.picture : ('/src/assets/default.jpeg')"
                    alt="User's profile picture"
                    class="nav-user-profile rounded-circle"
                    width="30"
                />
              </a>
              <div class="dropdown-menu dropdown-menu-right">
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
              <a id="qsLogoutBtn" href="#" @click.prevent="logout">Log out</a>
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
import { useRouter } from 'vue-router';
import { googleLogout } from 'vue3-google-login';
import axios from 'axios';
import { useCountryStore } from '../../store/country'; // ruta para el gestor de datos

export default defineComponent({
  name: 'NavBar',
  setup() {
    const store = useStore();
    const router = useRouter();
    const isAuthenticated = ref(store.state.loggedIn);
    const user = ref(store.state.user);

    const countryStore = useCountryStore(); // Usa la store de Pinia

    const actividad = ref('');
    const fecha = ref('');
    const hora = ref('');
    const fechaInicio = ref('');
    const fechaFin = ref('');
    const ipAddress = ref('');
    const idAdmin = ref('');
    const idCliente = ref('');

    const login = () => {
      router.push('/login');
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
        console.log('IP: ', data.ip);
        ipAddress.value = data.ip;
      } catch (error) {
        console.error('Error al obtener la dirección IP:', error);
      }
    };

    const auditoriaUser = async () => {
      try {
        actividad.value = 'Cierre Sesion';
        await axios.post('http://localhost:9999/api/v1/auditoria/create', {
          actividad: actividad.value,
          fecha: fecha.value,
          hora: hora.value,
          fechaInicio: '',
          fechaFin: fechaFin.value,
          ip: ipAddress.value,
          idAdmin: idAdmin.value,
          idCliente: idCliente.value,
        });

        console.log('Auditoria created');
      } catch (error) {
        console.error('Error al crear la auditoría:', error);
      }
    };

    const logout = async () => {
      try {
        calcularFecha();
        await getIPAddress();

        console.log('ROL: ', store.state.rol);
        if (store.state.rol === 'Admin') {
          idAdmin.value = store.state.id;
          idCliente.value = '';
          console.info('Id Cliente: ', idCliente.value);
          console.info('Id Admin: ', idAdmin.value);
        } else if (store.state.rol === 'Cliente') {
          idCliente.value = store.state.id;
          idAdmin.value = '';
          console.info('Id Cliente: ', idCliente.value);
          console.info('Id Admin: ', idAdmin.value);
        }
        await auditoriaUser();

        console.log('Proceso de cerrado de sesión');
        googleLogout();
        store.commit('setLoggedIn', false);
        store.commit('setUser', null);
        console.log('Cierre completado');
        router.push('/');
        window.location.reload();
      } catch (error) {
        console.error('Error al cerrar sesión:', error);
      }
    };

    const changeCountry = (country: string) => {
      countryStore.setCountry(country.toLowerCase());
      router.push('/');
    };

    return {
      isAuthenticated,
      user,
      login,
      logout,
      changeCountry,
    };
  },
});
</script>


<style scoped>
/* Estilos personalizados */
.navbar-nav .nav-item .nav-link {
  white-space: nowrap; /* Evita que el texto se desplace */
}

.nav-user-profile {
  width: 30px;
  height: 30px;
}

.user-info h6 {
  margin: 0;
}
.custom-navbar-color {
  background-color: rgba(0, 0, 0, 0.1); /* Transparente con fondo negro */
  z-index: 1000; /* Asegura que el navbar esté por encima del carrusel */
  position: absolute; /* Coloca el navbar encima del carrusel */
  width: 100%; /* Asegura que el navbar ocupe todo el ancho de la página */
}
.navbar-nav .nav-link {
  color: white; /* Color del texto en blanco */
}
.navbar-nav .nav-link:hover {
  color: rgba(81, 73, 73, 0.91); /* Color del texto en blanco */
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

.nav-icon{
  height: 50px;
  width: 50px;

}
.container{
  margin-left: 50px;
}
</style>
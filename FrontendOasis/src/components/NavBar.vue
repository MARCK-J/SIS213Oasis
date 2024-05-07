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
              <router-link to="/hoteles" class="nav-link">Hoteles</router-link>
            </li>
          </ul>
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <router-link to="/vuelos" class="nav-link">Vuelos</router-link>
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
                    :src="user.picture"
                    alt="User's profile picture"
                    class="nav-user-profile rounded-circle"
                    width="50"
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
import { defineComponent } from 'vue';
import { useStore } from 'vuex';
import { useRouter } from "vue-router";
import { googleLogout } from 'vue3-google-login';

export default defineComponent({
  name: "NavBar",
  setup() {
    const store = useStore();
    const router = useRouter();
    const isAuthenticated = store.state.loggedIn;
    const user = store.state.user;

    const login = () => {
      router.push("/login");
    };

    const logout = () => {
      console.log("Proceso de cerrado de sesion")
      googleLogout();
      store.commit('setLoggedIn', false);
      store.commit('setUser', null);
      console.log("Cierre completado");
      window.location.reload();
    };

    return {
      isAuthenticated,
      user,
      login,
      logout
    };
  }
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
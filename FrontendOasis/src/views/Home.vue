<template>
  <div>
    <nav-bar/>
    <Inicio/>
    <Informacion/>
    <Carusel/>
    <NuestrosServicios/>
    <NuestrosViajes/>
    <Team/>
    <Contactanos/>
    <Ubicacion/>
    <!-- <hr />
    <home-content /> -->
  </div>
</template>

<script lang="ts">
import NuestrosServicios from "../components/NuestrosServicios.vue";
import Inicio from "../components/Inicio.vue"
import NuestrosViajes from "../components/NuestrosViajes.vue"
import Team from "../components/Team.vue";
import Contactanos from "../components/Contactanos.vue";
import Ubicacion from "../components/Ubicacion.vue";
import NavBar from "../components/NavBar.vue";
import Carusel from '../components/Carusel.vue'
import Informacion from "../components/Informacion.vue";

export default {
  name: "home-view",
  components: { 
    NavBar,
    Inicio,
    NuestrosServicios,
    NuestrosViajes,
    Team,
    Contactanos,
    Ubicacion,
    Carusel,
    Informacion,
  },
};
</script>

<template>
  <div>
    <Inicio/>
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

export default {
  name: "home-view",
  components: {
    Inicio,
    NuestrosServicios,
    NuestrosViajes,
    Team,
    Contactanos,
    Ubicacion,
  },
};
</script>

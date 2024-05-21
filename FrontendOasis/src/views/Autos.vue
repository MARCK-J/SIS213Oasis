<script>

import NavBar from '../components/NavBar.vue';
import CarruselAuto from "../components/Auto/CarruselAuto.vue";

export default {
  name: "Autos",
  components: {
    CarruselAuto,
    NavBar,
  }
};

</script>

<template>
  <div>
    <NavBar/>
    <carrusel-auto/>



  </div>
</template>

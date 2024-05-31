<template>
  <div>
    <NavBar/>
    <HotelSeleccionado/>



  </div>
</template>

<script>



import HotelSeleccionado from "../../components/Hoteles/HotelSeleccionado.vue";
import NavBar from "../../components/NavBar.vue";


export default {
  name: "Autos",
  components: {
    NavBar,
    HotelSeleccionado,

  },
};
</script>

<style scoped>
/* Estilos adicionales si son necesarios */
</style>

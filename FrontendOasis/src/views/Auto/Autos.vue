<template>
  <div>
    <nav-bar-auto />
    <carrusel-auto />
    <modelos-autos/>


    <FooterHotel/>

  </div>
</template>

<script>
import NavBar from "../../components/NavBar.vue";
import NavBarAuto from "../../components/Auto/NavBarAuto.vue";
import CarruselAuto from "../../components/Auto/CarruselAuto.vue";
import ExplorarNissan from "../../components/Auto/Empresas/Nissan/ExplorarNissan.vue";
import ModelosAutos from "../../components/Auto/ModelosAutos.vue";
import FooterHotel from "../../components/Hoteles/FooterHotel.vue";
import HotelSeleccionado from "../../components/Hoteles/HotelSeleccionado.vue";

export default {
  name: "Autos",
  components: {
    ExplorarNissan,
    HotelSeleccionado,
    NavBarAuto,
    ModelosAutos,
    CarruselAuto,
    FooterHotel,
  },
};
</script>

<style scoped>
/* Estilos adicionales si son necesarios */
</style>

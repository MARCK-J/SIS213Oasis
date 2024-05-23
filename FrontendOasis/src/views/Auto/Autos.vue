<template>
  <div>
    <nav-bar-auto />
    <carrusel-auto />
    <inicio-auto/>
    <inicio-auto2/>
    <inicio-auto3/>
    <inicio-auto4/>
    <FooterHotel/>

  </div>
</template>

<script>
import NavBar from "../../components/NavBar.vue";
import NavBarAuto from "../../components/Auto/NavBarAuto.vue";
import CarruselAuto from "../../components/Auto/CarruselAuto.vue";
import InicioAuto from "../../components/Auto/Empresas/Nissan/InicioAuto.vue";
import InicioAuto2 from "../../components/Auto/Empresas/Toyota/InicioAuto2.vue";
import InicioAuto3 from "../../components/Auto/Empresas/Ford/InicioAuto3.vue";
import InicioAuto4 from "../../components/Auto/Empresas/Chevrolet/InicioAuto4.vue";
import FooterHotel from "../../components/Hoteles/FooterHotel.vue";

export default {
  name: "Autos",
  components: {
    FooterHotel,
    InicioAuto4,
    InicioAuto3,
    InicioAuto2,
    InicioAuto,
    NavBarAuto,
    CarruselAuto,
  },
};
</script>

<style scoped>
/* Estilos adicionales si son necesarios */
</style>

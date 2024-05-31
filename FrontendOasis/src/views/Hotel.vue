<script>

import NavBar from '../components/NavBar.vue';
import InicioHotel from "../components/Hoteles/InicioHotel.vue";
import FooterHotel from "../components/Hoteles/FooterHotel.vue";
import PopularHotels from "../components/Hoteles/PopularHotels.vue";
import CarruselHotel from '@/components/Hoteles/CarruselHotel.vue';
export default {
  name: "hotel",
  components: {
    NavBar,
    CarruselHotel,
    InicioHotel,
    FooterHotel,
    PopularHotels
  }
};

</script>

<template>
  <div>
    <NavBar/>
    <carrusel-hotel/>
    <popular-hotels/>
  </div>
</template>

<style scoped>

</style>
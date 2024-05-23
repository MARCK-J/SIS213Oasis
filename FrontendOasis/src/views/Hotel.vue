<script>

import NavBar from '../components/NavBar.vue';
import InicioHotel from "../components/Hoteles/InicioHotel.vue";
import FooterHotel from "../components/Hoteles/FooterHotel.vue";
import PopularHotels from "../components/Hoteles/PopularHotels.vue";
export default {
  name: "hotel",
  components: {
    NavBar,
    InicioHotel,
    FooterHotel,
    PopularHotels
  }
};

</script>

<template>
  <div>
    <NavBar/>
    <InicioHotel/>
    <FooterHotel/>
    <PopularHotels/>
  </div>
</template>

<style scoped>

</style>
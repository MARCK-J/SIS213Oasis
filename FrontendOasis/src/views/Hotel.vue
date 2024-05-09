<script>

import NavBar from '../components/NavBar.vue';
import InicioHotel from "../components/Hoteles/InicioHotel.vue";
import FooterHotel from "../components/Hoteles/FooterHotel.vue";
import CarrilHotel from "../components/Hoteles/CarrilHotel.vue";
export default {
  name: "hotel",
  components: {
    NavBar,
    InicioHotel,
    CarrilHotel,
    FooterHotel
  }
};

</script>

<template>
  <div>
    <NavBar/>
    <InicioHotel> </InicioHotel>
    <CarrilHotel/>
    <FooterHotel/>

  </div>
</template>

<style scoped>

</style>
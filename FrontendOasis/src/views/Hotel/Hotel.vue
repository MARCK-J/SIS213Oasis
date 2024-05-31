<script>

import NavBar from '../../components/NavBar.vue';
import InicioHotel from "../../components/Hoteles/InicioHotel.vue";
import FooterHotel from "../../components/Hoteles/FooterHotel.vue";
import CarrilHotel from "../../components/Hoteles/CarrilHotel.vue";
import NavBarAuto from "../../components/Auto/NavBarAuto.vue";
export default {
  name: "hotel",
  components: {
    NavBar,
    NavBarAuto,
    InicioHotel,
    CarrilHotel,
    FooterHotel,
  }
};

</script>

<template>
  <div>
    <NavBarAuto/>
    <CarrilHotel/>
    <inicio-hotel/>

    <FooterHotel/>

  </div>
</template>

<style scoped>

</style>
/*PopularHotels.vue*/
<template>
  <div class="container">
    <h1>{{ titulo }}</h1>
    <p>{{ subtitulo }}</p>

    <div class="image-row" v-for="(row, index) in hotelRows" :key="index">
      <div class="image-container" v-for="hotel in row" :key="hotel.name">
        <router-link :to="'/Hotel_Ordenar'" @click.native="selectHotel(hotel)">
          <img :src="hotel.image" :alt="hotel.name" class="hover-zoom">
        </router-link>
        <span class="image-name">{{ hotel.name }}</span>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, computed, onMounted, watch } from 'vue';
import { useCountryStore } from '../../store/country';
import { Hotel } from '../../data/data';

export default defineComponent({
  name: 'PopularHotels',
  setup() {
    const store = useCountryStore();

    const selectedCountry = computed(() => store.selectedCountry);

    onMounted(() => {
      if (selectedCountry.value) {
        store.setCountry(selectedCountry.value);
        store.selectCategory('hotel');
      } else {
        console.log('No hay país seleccionado');
      }
    });

    watch(selectedCountry, (newCountry) => {
      if (newCountry) {
        store.setCountry(newCountry);
        store.selectCategory('hotel');
      }
    });

    const titulo = computed(() => store.titulo);
    const subtitulo = computed(() => store.subtitulo);

    const hotelRows = computed(() => {
      const hotels = store.hotels;
      const rows = [];
      for (let i = 0; i < hotels.length; i += 4) {
        rows.push(hotels.slice(i, i + 4));
      }
      return rows;
    });

    const selectHotel = (hotel: Hotel) => {
      store.selectHotel(hotel);
    };

    return {
      titulo,
      subtitulo,
      hotelRows,
      selectHotel,
    };
  }
});
</script>



<style scoped>
.container {
  max-width: 1200px;
  margin: 30px auto;
  text-align: center;
}

.image-row {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  margin-bottom: 20px;
}

.image-container {
  flex: 1 1 calc(25% - 20px);
  margin: 10px;
  transition: transform 0.3s ease;
  text-align: center;
  cursor: pointer;
}

.image-container img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  max-width: 280px;
  max-height: 200px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.image-container:hover {
  transform: translateY(-5px);
}

.image-container:hover img {
  transform: scale(1.1);
}

.image-name {
  font-size: 15px;
  margin-top: 5px;
}

h1 {
  font-size: 30px;
}

p {
  font-size: 16px;
  margin-bottom: 20px;
}
</style>

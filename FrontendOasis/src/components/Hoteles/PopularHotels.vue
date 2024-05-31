<template>
  <div class="container">
    <h1>Los hoteles más populares para tus próximas vacaciones</h1>
    <p>Estos son algunos hoteles que han visitado otros viajeros:</p>
    <div class="image-row" v-for="(row, index) in hotelRows" :key="index">
      <div class="image-container" v-for="hotel in row" :key="hotel.name" @click="goToHotelDetails(hotel.link)">
        <img :src="hotel.image" :alt="hotel.name">
        <span class="image-name">{{ hotel.name }}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PopularHotels',
  data() {
    return {
      hotels: [
        { name: 'Sumerville All Inclusive Resort', image: 'src/assets/hotel/hotel1.jpg', link: '/hotel/sumerville' },
        { name: 'Salinas Margogi All Inclusive Resort', image: 'src/assets/hotel/hotel2.jpg', link: '/hotel/sumerville' },
        { name: 'Japaratinga Lounge Resort', image: 'src/assets/hotel/hotel3.jpg', link: '/hotel/sumerville' },
        { name: 'Fairmont Rio de Janeiro Copacabana', image: 'src/assets/hotel/hotel4.jpg', link: '/hotel/sumerville' },
        { name: 'Four Seasons Buenos Aires', image: 'src/assets/hotel/hotel5.jpg', link: '/hotel/sumerville' },
        { name: 'Elcielo Colombia', image: 'src/assets/hotel/hotel6.jpg', link: '/hotel/sumerville' },
        { name: 'Emiliano Rio de Janeiro Brasil', image: 'src/assets/hotel/hotel7.jpg', link: '/hotel/sumerville' },
        { name: 'Hotel Eurobuilding Caracas Venezuela', image: 'src/assets/hotel/hotel8.jpg', link: '/hotel/sumerville' },
        { name: 'Hotel Fasano Belo Horizonte Brasil', image: 'src/assets/hotel/hotel9.jpg', link: '/hotel/sumerville' },
        { name: 'Hyatt Centric San Isidro Lima Peru', image: 'src/assets/hotel/hotel10.jpg', link: '/hotel/sumerville' },
        { name: 'Intercontinental Real Santo Domingo Republica Dominicana', image: 'src/assets/hotel/hotel11.jpg', link: '/hotel/sumerville' },
        { name: 'Live Aqua Urban Resort Monterrey, Mexico', image: 'src/assets/hotel/hotel12.jpg', link: '/hotel/sumerville' },
        { name: 'Los Tajibos, a Tribute Portfolio Hotel Santa Cruz, Bolivia', image: 'src/assets/hotel/hotel13.jpg', link: '/hotel/sumerville' },
        { name: 'Mandarin Oriental de Santiago Santiago de Chile', image: 'src/assets/hotel/hotel14.jpg', link: '/hotel/sumerville' },
        { name: 'W Bogota Colombia', image: 'src/assets/hotel/hotel15.jpg', link: '/hotel/sumerville' },
        { name: 'Hilton Guadalajara Midtown Mexico', image: 'src/assets/hotel/hotel16.jpg', link: '/hotel/sumerville' },
        { name: 'Alvear Palace Hotel', image: 'src/assets/hotel/hotel17.jpg', link: '/hotel/sumerville' },
        { name: 'Baruk Hotel de Autor', image: 'src/assets/hotel/hotel18.jpg', link: '/hotel/sumerville' },
        { name: 'Four Seasons México City', image: 'src/assets/hotel/hotel9.jpg', link: '/sumerville' },
        { name: 'Gran Hotel Costa Rica, Curio Collection by Hilton', image: 'src/assets/hotel/hotel20.jpg', link: '/hotel/sumerville' },
        { name: 'Grand Hyatt', image: 'src/assets/hotel/hotel21.jpg', link: '/hotel/sumerville' },

      ],
    };
  },
  computed: {
    hotelRows() {
      const rows = [];
      for (let i = 0; i < this.hotels.length; i += 4) {
        rows.push(this.hotels.slice(i, i + 4));
      }
      return rows;
    }
  },
  methods: {
    goToHotelDetails(link) {
      this.$router.push(link);
    }
  }
};
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

<template>
    <div class="container">
      <h1>Los hoteles más populares para tus próximas vacaciones</h1>
      <p>Estos son algunos hoteles que han visitado otros viajeros:</p>
      <div class="image-row" v-for="(row, index) in hotelRows" :key="index">
        <div class="image-container" v-for="hotel in row" :key="hotel.name">
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
          { name: 'Sumerville All Inclusive Resort', image: 'src/assets/Hotel/hotel1.jpg' },
          { name: 'Salinas Margogi All Inclusive Resort', image: 'src/assets/hoteles/hotel2.jpg' },
          { name: 'Japaratinga Lounge Resort', image: 'src/assets/hoteles/hotel3.jpg' },
          { name: 'Fairmont Rio de Janeiro Copacabana', image: 'src/assets/hoteles/hotel4.jpg' },
          { name: 'Four Seasons Buenos Aires', image: 'src/assets/hoteles/hotel5.jpg' },
          { name: 'Elcielo Colombia', image: 'src/assets/hoteles/hotel6.jpg' },
          { name: 'Emiliano Rio de Janeiro Brasil', image: 'src/assets/hoteles/hotel7.jpg' },
          { name: 'Hotel Eurobuilding Caracas Venezuela', image: 'src/assets/hoteles/hotel8.jpg' },
          { name: 'Hotel Fasano Belo Horizonte Brasil', image: 'src/assets/hoteles/hotel9.jpg' },
          { name: 'Hyatt Centric San Isidro Lima Peru', image: 'src/assets/hoteles/hotel10.jpg' },
          { name: 'Intercontinental Real Santo Domingo Republica Dominicana', image: 'src/assets/hoteles/hotel11.jpg' },
          { name: 'Live Aqua Urban Resort Monterrey, Mexico', image: 'src/assets/hoteles/hotel12.jpg' },
          { name: 'Los Tajibos, a Tribute Portfolio Hotel Santa Cruz, Bolivia', image: 'src/assets/hoteles/hotel13.jpg' },
          { name: 'Mandarin Oriental de Santiago Santiago de Chile', image: 'src/assets/hoteles/hotel14.jpg' },
          { name: 'W Bogota Colombia', image: 'src/assets/hoteles/hotel15.jpg' },
          { name: 'Hilton Guadalajara Midtown Mexico', image: 'src/assets/hoteles/hotel16.jpg' },
        ]
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
  
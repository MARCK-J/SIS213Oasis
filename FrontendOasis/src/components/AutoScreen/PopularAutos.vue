<template>
  <div class="container">
    <h1>Los Autos más populares para tus próximas vacaciones</h1>
    <p>Estos son algunos autos que han alquilado o comprado otros viajeros:</p>
    <div class="image-row" v-for="(row, index) in filteredAutoRows" :key="index">
      <div class="image-container" v-for="auto in row" :key="auto.alt">
        <img :src="auto.src" :alt="auto.alt">
        <span class="image-name">{{ auto.title }}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PopularAutos',
  data() {
    return {
      autos: [
        {
          src: "https://i.pinimg.com/originals/c9/b5/6e/c9b56e1c8c4a7199cd83b27e34be219f.jpg",
          alt: "Auto1",
          author: "OASIS",
          title: "DESING SLIDER",
          topic: "AUTOS",
          des: "Autos para toda la ciudad",
          city: 1
        },
        {
          src: "https://wallpaper.forfun.com/fetch/90/90091e333f2aa9ee8e35642c93cf6752.jpeg",
          alt: "Auto2",
          author: "OASIS",
          title: "DESING SLIDER",
          topic: "AUTOS",
          des: "Autos para camino peligrosos",
          city: 2
        },
        {
          src: "https://arblatinamerica.com/wp-content/uploads/2021/07/Salar-de-Uyuni-1.jpg",
          alt: "Auto3",
          author: "OASIS",
          title: "DESING SLIDER",
          topic: "AUTOS",
          des: "Autos para acampar con tu familia",
          city: 3
        },
        {
          src: "https://www.chevrolet.com.ec/content/dam/chevrolet/south-america/ecuador/espanol/index/index-subcontent/mh-scroller/abril-2024/mhs/2024-masthead-home-trailblazer-xl.jpg?imwidth=960",
          alt: "Auto4",
          author: "OASIS",
          title: "Autos para todo terreno",
          topic: "Exclusivos",
          des: "Lorem esta es una descripcion para hacer en slider",
          city: 4
        }
      ],
      cityMap: {
        1: 'La Paz',
        2: 'Santa Cruz de la Sierra',
        3: 'Cochabamba',
        4: 'Sucre',
        5: 'Oruro',
        6: 'Potosí',
        7: 'Tarija',
        8: 'Beni',
        9: 'Pando',
      }
    };
  },
  computed: {
    filteredAutoRows() {
      const rows = [];
      const selectedCity = this.$store.getters.selectedCity || 'all';
      const filteredAutos = selectedCity === 'all' ? this.autos : this.autos.filter(auto => this.cityMap[auto.city] === selectedCity);
      for (let i = 0; i < filteredAutos.length; i += 4) {
        rows.push(filteredAutos.slice(i, i + 4));
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

.image-city {
  font-size: 14px;
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

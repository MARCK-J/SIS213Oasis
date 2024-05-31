<template>
  <div class="container">
    <h1>Compañias de Vuelos accesibles</h1>
    <p>Estos son algunas de las compañias de vuelos que puede elegir:</p>
    <div class="image-row" v-for="(row, index) in vueloRows" :key="index">
      <div
        class="image-container"
        v-for="vuelo in row"
        :key="vuelo.name"
        @click="goTovueloDetails(vuelo.link)"
      >
        <img :src="vuelo.image" :alt="vuelo.name" />
        <span class="image-name">{{ vuelo.name }}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Popularvuelos",
  data() {
    return {
      vuelo: [
        {
          name: "Boliviana de Aviación (BOA)",
          image: "https://www.expreso.info/files/2022-05/Boliviana_de_Aviacion.jpg",
          link: "/airline/boa",
        },
        {
          name: "Amaszonas",
          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6jSWIID2SYId_xSREzMb4x9qiqEAFzupA7Q&s",
          link: "/airline/amaszonas",
        },
        {
          name: "EcoJet",
          image: "https://flyecojet.aero/wp-content/uploads/2023/12/995X5001avrof.webp",
          link: "/airline/ecojet",
        },
        {
          name: "LATAM Airlines",
          image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/53/b1/4b/latam.jpg?w=1200&h=-1&s=1",
          link: "/airline/latam",
        },
        {
          name: "American Airlines",
          image: "https://i0.wp.com/bitfinanzas.com/wp-content/uploads/DALL%C2%B7E-2024-01-25-17.56.59-Simple-illustration-of-an-American-Airlines-plane-taking-off-against-a-clear-sky-with-financial-indicators-subtly-integrated-into-the-scene.-The-plan-e1706227113249.jpg?fit=1220%2C697&ssl=1",
          link: "/airline/american",
        },
        {
          name: "United Airlines",
          image: "https://skift.com/wp-content/uploads/2024/03/N654UA-United-Airlines-Boeing-767-322ER-1-scaled.jpg",
          link: "/airline/united",
        },
        {
          name: "Delta Airlines",
          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvLMWLCD2X0c-_DhZedACZjjGchB6Qp0g3qg&s",
          link: "/airline/delta",
        },
        {
          name: "Air France",
          image: "https://www.pixartprinting.es/blog/wp-content/uploads/2020/10/Aifrance_Cover.jpg",
          link: "/airline/airfrance",
        },
        {
          name: "Star Peru",
          image: "https://elcomercio.pe/resizer/YPzQdSQ_PkanZ3Vh0BsXOyg07hI=/1200x800/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/II4XZEYJYBBDFBKDHJWNFC24PA.jpg",
          link: "/airline/lufthansa",
        },
        {
          name: "GOL LINHAS AÉREAS INTELIGENTES",
          image: "https://contactonews.co/storage/photos/shares/Aviacion/Gol%20Linhas%20Aereas/avion-gol.jpg",
          link: "/airline/klm",
        },
      ],
    };
  },
  computed: {
    vueloRows() {
      const rows = [];
      for (let i = 0; i < this.vuelo.length; i += 4) {
        rows.push(this.vuelo.slice(i, i + 4));
      }
      return rows;
    },
  },
  methods: {
    goTovueloDetails(link) {
      this.$router.push(link);
    },
  },
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

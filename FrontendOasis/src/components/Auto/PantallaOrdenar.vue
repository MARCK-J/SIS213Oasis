<template>
  <div id="app" class="container">
    <!-- Contenedor de la imagen con botones de navegación -->
    <div class="image-container">
      <button class="nav-button left" @click="prevOption">&#9664;</button>
      <img class="car-image" :src="selectedOption.image" :alt="selectedOption.type">
      <button class="nav-button right" @click="nextOption">&#9654;</button>
    </div>
    <!-- Contenedor de detalles del coche y datos de renta -->
    <div class="details">
      <div class="header">
        <img src="https://cdn.worldvectorlogo.com/logos/nissan-6.svg" alt="Tesla Logo">
        <div class="info">
          <div class="title">Auto en alquiler</div>
          <div>modelo Qashqai </div>
        </div>
      </div>

      <div class="price">
        {{ selectedOption.price }} <span>Despues de 3 dias rentado *</span>
      </div>
      <div class="rental-details">





        <h3>Datos de Renta</h3>

        <div><strong>Precio por día:</strong> {{ rentalData.pricePerDay }}</div>
        <div><strong>Disponible en:</strong> {{ rentalData.availability }}</div>
        <button @click="toggleCities">{{ showCities ? 'Ocultar' : 'Mostrar' }} ciudades disponibles</button>
        <ul v-if="showCities">
          <li v-for="city in rentalData.cities" :key="city">{{ city }}</li>
        </ul>
        <div><strong>Empresa:</strong> {{ rentalData.company }}</div>
      </div>
      <div class="buttons">
        <button @click="moreInfo">Más Informaciones</button>
        <button @click="addToCart">Agregar</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      options: [
        {
          type: 'Rear-Wheel Drive',
          price: '$250',
          displayPrice: '$35.269.000',
          range: '513 km',
          acceleration: '6,1 s',
          maxSpeed: '201 km/h',
          image: 'https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MT351,$PPSW,$W38A,$IPB2&view=STUD_FRONT34&model=m3&size=1920&bkba_opt=2&crop=0,0,0,0&'
        },
        {
          type: 'Long Range',
          price: '$250',
          displayPrice: '$40.269.000',
          range: '629 km',
          acceleration: '4,4 s',
          maxSpeed: '233 km/h',
          image: 'https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MT351,$PPSW,$W38A,$IPB2&view=STUD_SIDEVIEW&model=m3&size=1920&bkba_opt=2&crop=0,0,0,0&'
        },
        {
          type: 'Performance',
          price: '$250',
          displayPrice: '$45.269.000',
          range: '528 km',
          acceleration: '3,1 s',
          maxSpeed: '261 km/h',
          image: 'https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MT353,$PPSW,$W30P,$IPB4&view=STUD_REAR34&model=m3&size=1920&bkba_opt=2&crop=0,0,0,0&'
        }
      ],
      paintOptions: [
        { color: 'Pearl White Multi-Coat', price: 'Incluido', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_white.png' },
        { color: 'Solid Black', price: '$1.500.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_black.png' },
        { color: 'Midnight Silver Metallic', price: '$1.500.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_silver.png' },
        { color: 'Deep Blue Metallic', price: '$1.500.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_blue.png' },
        { color: 'Red Multi-Coat', price: '$2.500.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_red.png' },
      ],
      wheelOptions: [
        { type: 'Rines Photon de 18"', details: 'Neumáticos para todas las estaciones\nAutonomía (est.): 554 km', price: 'Incluido', image: 'https://www.tesla.com/ns_videos/model-3_order_page_wheels_silver.png' },
        { type: 'Rines Sport de 19"', details: 'Neumáticos para verano\nAutonomía (est.): 547 km', price: '$1.700.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_wheels_sport.png' }
      ],
      rentalData: {
        pricePerDay: '300 bs',
        availability: 'Todo el país',
        cities: ['La paz', 'Cochabamba', 'Santa cruz'],
        company: 'NISSAN'
      },
      selectedOptionIndex: 0,
      showCities: false
    };
  },
  computed: {
    selectedOption() {
      return this.options[this.selectedOptionIndex];
    }
  },
  methods: {
    selectOption(option) {
      this.selectedOptionIndex = this.options.indexOf(option);
    },
    prevOption() {
      this.selectedOptionIndex = (this.selectedOptionIndex - 1 + this.options.length) % this.options.length;
    },
    nextOption() {
      this.selectedOptionIndex = (this.selectedOptionIndex + 1) % this.options.length;
    },
    toggleCities() {
      this.showCities = !this.showCities;
    },
    moreInfo() {
      // Acción para más información

    },
    addToCart() {
      // Acción para agregar al carrito
      alert('Auto agregado al carrito.');
    }
  },
  mounted() {
    // Selecciona la primera opción de pintura y rines por defecto si están disponibles
    this.selectedPaint = this.paintOptions.length ? this.paintOptions[0] : {};
    this.selectedWheel = this.wheelOptions.length ? this.wheelOptions[0] : {};
  }
};
</script>


<style scoped>
/* Reseteo de márgenes y padding */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
/* Configuración del cuerpo de la página */
body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  overflow: hidden;
  background-color: #f5f5f5;
}
/* Contenedor principal */
.container {
  display: flex;
  width: 100%;
  height: 100%;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  margin-left: 250px;
}
/* Contenedor de la imagen del coche */
.image-container {
  position: relative;
  flex: 100; /* Ajustar el ancho para ocupar el 50% de la pantalla */
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

/* Imagen del coche */
.car-image {
  width: 100%; /* La imagen ocupará todo el ancho del contenedor */
  height: auto; /* Se ajustará automáticamente manteniendo la proporción */
  object-fit: cover; /* La imagen se ajustará para cubrir todo el contenedor */
  transition: transform 0.3s;
}
/* Botones de navegación del carrusel */
.nav-button {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background-color: rgba(255, 255, 255, 0.7);
  border: none;
  padding: 10px;
  cursor: pointer;
  font-size: 24px;
  z-index: 1;
  border-radius: 50%;
  color: #333;
  transition: background-color 0.3s, color 0.3s;
}
.nav-button.left {
  left: 10px;
}
.nav-button.right {
  right: 10px;
}
.nav-button:hover {
  background-color: rgba(0, 0, 0, 0.1);
  color: #000;
}
/* Contenedor de detalles */
.details {
  flex: 2; /* Ajustar el ancho */
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  margin-left: 100px; /* Alineado a la derecha */
}
/* Encabezado con logo y título */
.header {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
  gap: 50px;
}
.header img {
  width: 50px;
  margin-right: 10px;
  margin-left: 100px;
}
.header .info {
  font-size: 16px;
  color: #333;
  text-align: right;
  margin-left: 100px;

}
.header .info .title {
  font-weight: bold;
  font-size: 24px;
  color: #000;
  margin-left: -100px;
}
/* Precio del coche */
.price {
  font-size: 18px;
  margin-bottom: 20px;
  color: #007bff;
  background-color: rgba(0, 123, 255, 0.1);
  padding: 10px;
  border-radius: 5px;
}
.price span {
  font-size: 12px;
  color: #999;
}
/* Datos de renta */
.rental-details {
  margin-bottom: 20px;
  text-align: right;
}
.rental-details h3 {
  font-size: 18px;
  margin-bottom: 10px;
  color: #000;
}
.rental-details strong {
  color: #007bff;
}
.rental-details div {
  font-size: 16px;
  color: #333;
  margin-bottom: 5px;
  background-color: rgba(0, 123, 255, 0.1);
  padding: 10px;
  border-radius: 5px;
}
.rental-details ul {
  list-style: none;
  padding-left: 0;
}
.rental-details ul li {
  font-size: 16px;
  color: #333;
  margin-bottom: 5px;
  background-color: rgba(0, 123, 255, 0.1);
  padding: 5px 10px;
  border-radius: 5px;
}
/* Botones */
.buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}
.buttons button {
  padding: 12px 20px;
  cursor: pointer;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 25px;
  font-size: 16px;
  transition: background-color 0.3s;
}
.buttons button:hover {
  background-color: #0056b3;
}
/* Estilos para pantallas pequeñas */
@media (max-width: 768px) {
  .container {
    flex-direction: column;
  }
  .image-container {
    width: 100%;
    height: 50vh;
  }
  .details {
    padding: 20px;
    align-items: center;
    text-align: center;
  }
  .car-image {
    height: auto;
    width: 100%;
  }
}
</style>

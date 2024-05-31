/*modelosautos*/
<template>
  <div>
    <div class="titulo">
      <h1>Autos Disponibles en: {{ selectedCountry }}</h1>
    </div>
    <div v-for="cityData in carsByCity" :key="cityData.city" class="city-section">
      <div class="titulo">
        <h2>Autos en {{ cityData.city }}</h2>
      </div>
      <div class="car-grid">
        <div v-for="car in cityData.cars" :key="car.name" class="car">
          <router-link :to="'/Auto_ordenar' + car.name">
            <img :src="car.image" :alt="car.name" class="hover-zoom">
          </router-link>
          <router-link :to="'/Auto_ordenar' + car.name">
            <button @click="selectCar(car)">{{ car.name }}</button>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, computed } from 'vue';
import { useCountryStore } from '../../store/country';
import { Car } from '../../data/data';

export default defineComponent({
  name: "ModelosAutos",
  setup() {
    const countryStore = useCountryStore();
    const selectedCountry = computed(() => countryStore.selectedCountry);
    const carsByCity = computed(() => {
      const cityCars = countryStore.selectedCountryData?.cityCars || [];
      return cityCars.map(cityData => ({
        city: cityData.city,
        cars: cityData.cars
      }));
    });

    const selectCar = (car: Car) => {
      countryStore.selectCar(car);
    };

    return {
      selectedCountry,
      carsByCity,
      selectCar,
    };
  }
});
</script>


<style scoped>
.car-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}
.car {
  flex: 1 1 calc(33.333% - 20px);
  box-sizing: border-box;
}
.hover-zoom {
  transition: transform 0.3s;
}
.hover-zoom:hover {
  transform: scale(1.1);
}
.titulo {
  margin-bottom: 20px;
}
button {
  margin-top: 10px;
  padding: 10px;
  background-color: #007BFF;
  color: white;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s;
}
button:hover {
  background-color: #0056b3;
}
</style>



<style>
/* Estilos generales para el cuerpo del documento */
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* Estilos para el encabezado que contiene la imagen grande y el texto */
.header {
  position: relative;
  text-align: center;
  color: white;
}

/* Estilos para la imagen grande del encabezado */
.header img {
  width: 100%;
  height: auto;
}

/* Estilos para el contenido superpuesto en la imagen del encabezado */
.header .content {
  position: absolute;
  top: 30%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.header .content h1 {
  font-size: 3em;
  margin: 0;
}

.header .content p {
  font-size: 1.5em;
}

/* Estilos para el botón en el encabezado */
.header .content .btn {
  background-color: #d81b60;
  color: white;
  padding: 1em 2em;
  text-decoration: none;
  border-radius: 5px;
  font-size: 1.2em;
}

/* Estilos para la cuadrícula de autos */
.car-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  padding: 20px;
}

/* Estilos para las imágenes de los autos */
.car-grid img {
  width: 100%;
  height: auto;
  display: block;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.car-grid img.hover-zoom:hover {
  transform: scale(1.1);
}

/* Estilos para cada elemento de la cuadrícula de autos */
.car-grid .car {
  text-align: center;
}

/* Estilos para los botones de los nombres de los autos */
.car-grid .car button {
  background-color: transparent;
  border: none;
  font-size: 1.1em;
  cursor: pointer;
  margin-top: 10px;
  color: #333;
}
</style>

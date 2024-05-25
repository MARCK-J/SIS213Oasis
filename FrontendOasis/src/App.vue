<template>
  <div id="app">
    <h1>Hoteles por País</h1>
    <label for="country-select">Selecciona un país:</label>
    <select id="country-select" v-model="selectedCountry">
      <option v-for="country in countries" :key="country" :value="country">
        {{ country }}
      </option>
    </select>
    <ul>
      <li v-for="hotel in filteredHotels" :key="hotel.name">
        {{ hotel.name }} - {{ hotel.city }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      countries: ['España', 'Francia', 'Italia', 'Alemania'],
      selectedCountry: '',
      hotels: [
        { name: 'Hotel A', city: 'Madrid', country: 'España' },
        { name: 'Hotel B', city: 'Barcelona', country: 'España' },
        { name: 'Hotel C', city: 'París', country: 'Francia' },
        { name: 'Hotel D', city: 'Lyon', country: 'Francia' },
        { name: 'Hotel E', city: 'Roma', country: 'Italia' },
        { name: 'Hotel F', city: 'Milán', country: 'Italia' },
        { name: 'Hotel G', city: 'Berlín', country: 'Alemania' },
        { name: 'Hotel H', city: 'Múnich', country: 'Alemania' },
      ],
    };
  },
  computed: {
    filteredHotels() {
      if (!this.selectedCountry) {
        return this.hotels;
      }
      return this.hotels.filter(hotel => hotel.country === this.selectedCountry);
    }
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
  margin-top: 60px;
}

label {
  display: block;
  margin-bottom: 10px;
}

select {
  margin-bottom: 20px;
}
</style>

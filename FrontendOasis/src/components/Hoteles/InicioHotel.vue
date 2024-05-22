<template>
    <div class="content">
      <div class="search">
        <input type="text" ref="searchInput" placeholder="Nombre del destino o hotel..." @focus="hideSearchElements">
        <input type="date" style="right: 100px; top: 6px;">
        <button style="right: 0px; top: 12px;">Buscar</button>
        <img ref="searchIcon" class="search-icon" src="src/assets/Hotel/lupa.png" alt="Icono Lupa" width="10" height="10" @click="hideSearchElements">
      </div>
      <div class="centered-text">Alojate en algún sitio Increíble</div>
    </div>
    <div class="second-image">
      <img src="src/assets/Hotel/imagen2.png" alt="Segunda Imagen">
      <div class="additional-text">Los mejores hoteles de toda <br>Latinoamérica </div>
      <div class="additional-text-small">Descubre los mejores hoteles, elegidos para ti</div>
    </div>
    <div class="footer">
      <p>¡Alíjate en un sitio increíble!</p>
    </div>
    <carrusel-hotel />
  </template>
  
  <script lang="ts">


  
  export default {
    components: {

    },
    data() {
      return {
        searchInput: ''
      };
    },
    methods: {
      hideSearchElements() {
        this.searchInput = '';
      }
    }
  };
  </script>
  
  

<style scoped>
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.header {
    background-color: black;
    height: 90px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 20px;
}

.logo img {
    height: 100px;
}

nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
}

nav ul li {
    margin-right: 20px;
}

nav ul li:last-child {
    margin-right: 0;
}

nav ul li a {
    color: white;
    text-decoration: none;
}

.content {
    background-image: url('src/assets/Hotel/hotel1.png');
    background-size: cover;
    background-position: center;
    height: calc(100vh - 100px);
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    text-align: center;
    color: white;
}

.search {
    position: relative;
    max-width: 620px;
    width: 50%;
}

.search input[type="text"] {
    width: calc(100% - 30px);
    height: 40px;
    border: 1px solid #ccc;
    border-radius: 100px;
    padding: 5px 30px 5px 10px;
    font-size: 16px;
    margin-right: 10px;
}

.search input[type="date"],
.search button {
    position: absolute;
    top: 50px;
    height: 30px;
    border: 1px solid #ccc;
    border-radius: 100px;
    padding: 4px;
    font-size: 16px;
    margin-bottom: 10px;
}

.search input[type="date"] {
    right: -200px;
}

.search button {
    right: -280px;
    background-color: rgb(82, 165, 82);
    color: white;
    cursor: pointer;
}

.search .search-icon {
    position: absolute;
    left: 10px;
    width: 20px;
    height: 20px;
    filter: grayscale(100%);
    transition: opacity 0.3s ease;
    top: 15px;
}

.footer {
    display: none;
}

.centered-text {
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 32px;
    font-weight: bold;
    text-align: center;
}

.second-image {
    margin-top: 30px; 
    text-align: center;
    position: relative;
}

.second-image img {
    width: 90%; 
    height: auto; 
    border-radius: 20px; 
}

.additional-text {
    position: absolute;
    top: 80px;
    left: 90px; 
    color: white;
    font-weight: bold;
    font-size: 40px;
    
}

.additional-text-small {
    position: absolute;
    top: 180px;
    left: 100px; 
    color: white;
    font-size: 14px;
    font-weight: lighter;
}

</style>

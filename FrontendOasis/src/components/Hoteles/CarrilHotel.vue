<template>
    <div class="contenedor-carriles">
      <!-- Primer conjunto de carriles -->
      <div class="carriles">
        <h1 class="titulo">{{ titulo }}</h1>
        <div class="fila-carriles">
          <div v-for="(carril, index) in carriles1" :key="index" class="carril-item" @click="mostrarDescripcion(carril)">
            <img :src="carril.imagen" :alt="carril.nombre" class="imagen-carril" />
            <div class="descripcion">
              <p>{{ carril.descripcion }}</p>
            </div>
          </div>
        </div>
      </div>
  
      <!-- Segundo conjunto de carriles -->
      <div class="carriles">
        <h1 class="titulo">{{ titulo2 }}</h1>
        <div class="fila-carriles">
          <div v-for="(carril, index) in carriles2" :key="'2_' + index" class="carril-item" @click="mostrarDescripcion(carril)">
            <img :src="carril.imagen" :alt="carril.nombre" class="imagen-carril" />
            <div class="descripcion">
              <p>{{ carril.descripcion }}</p>
            </div>
          </div>
        </div>
      </div>
        
      <!-- tercer conjunto de carriles -->
      <div class="carriles">
        <h1 class="titulo">{{ titulo3 }}</h1>
        <div class="fila-carriles">
          <div v-for="(carril, index) in carriles3" :key="'2_' + index" class="carril-item" @click="mostrarDescripcion(carril)">
            <img :src="carril.imagen" :alt="carril.nombre" class="imagen-carril" />
            <div class="descripcion">
              <p>{{ carril.descripcion }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        titulo: "Este es el primer carril",
        titulo2: "Esto es el segundo carril",
        titulo3: "Esto es el tercer carril",
        carriles1: [
          { nombre: "Carril 1", imagen: "src/assets/Hotel/hotel2.jpg", descripcion: "Descripción del Carril 1" },
          { nombre: "Carril 2", imagen: "src/assets/Hotel/hotel3.jpg", descripcion: "Descripción del Carril 2" },
          { nombre: "Carril 1", imagen: "src/assets/Hotel/hotel4.jpg", descripcion: "Descripción del Carril 1" },
          { nombre: "Carril 2", imagen: "src/assets/Hotel/hotel5.jpg", descripcion: "Descripción del Carril 2" },
          // Agregar más carriles según sea necesario
        ],
        carriles2: [
          { nombre: "Carril 1", imagen: "src/assets/Hotel/hotel2.jpg", descripcion: "Descripción del Carril 1" },
          { nombre: "Carril 2", imagen: "src/assets/Hotel/hotel3.jpg", descripcion: "Descripción del Carril 2" },
          { nombre: "Carril 1", imagen: "src/assets/Hotel/hotel4.jpg", descripcion: "Descripción del Carril 1" },
          { nombre: "Carril 2", imagen: "src/assets/Hotel/hotel5.jpg", descripcion: "Descripción del Carril 2" },
          // Agregar más carriles según sea necesario
        ],
        carriles3: [
          { nombre: "Carril 1", imagen: "src/assets/Hotel/hotel2.jpg", descripcion: "Descripción del Carril 1" },
          { nombre: "Carril 2", imagen: "src/assets/Hotel/hotel3.jpg", descripcion: "Descripción del Carril 2" },
          { nombre: "Carril 1", imagen: "src/assets/Hotel/hotel4.jpg", descripcion: "Descripción del Carril 1" },
          
          // Agregar más carriles según sea necesario
        ],
        descripcionVisible: false,
        descripcion: ""
      };
    },
    methods: {
      mostrarDescripcion(carril) {
        this.descripcion = carril.descripcion;
        this.descripcionVisible = true;
      }
    }
  };
  </script>
  
  <style scoped>
  /* Estilos para hacer la apariencia elegante y futurística */
  .contenedor-carriles {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
  }
  
  .carriles {
    text-align: left; /* Alinea el título a la izquierda */
    width: 100%; /* Ocupa todo el ancho disponible */
    padding: 20px; /* Añade un espacio alrededor de los carriles */
  }
  
  .titulo {
    margin-left: 20px; /* Añade margen izquierdo al título */
  }
  
  .fila-carriles {
    display: flex;
    justify-content: space-around; /* Espacio alrededor de los carriles */
    align-items: center;
  }
  
  .carril-item {
    flex: 1; /* Hace que los carriles ocupen igual espacio */
    text-align: center; /* Centra el texto */
  }
  
  .imagen-carril {
    width: 100%; /* Tamaño completo de la imagen */
    height: auto; /* Altura automática para mantener la proporción */
    cursor: pointer;
    transition: transform 0.3s ease; /* Efecto de transición */
  }
  
  .imagen-carril:hover {
    transform: scale(1.1); /* Efecto de agrandar al pasar el mouse */
  }
  
  .descripcion {
    margin-top: 10px; /* Espacio entre la imagen y la descripción */
    font-style: italic;
  }
  </style>
  
<template>
  <div>
    <!-- Sección del encabezado con la imagen grande y el texto -->


    </div>
       <div class="titulo">
         <h1>dsfa</h1>
       </div>
    <!-- Cuadrícula de autos -->
    <div class="car-grid">

      <!-- Iteración sobre cada auto usando Vue.js -->
      <div class="car" v-for="car in cars" :key="car.name">
        <!-- Cada imagen de auto es un enlace -->
        <router-link :to="car.link">
          <!-- Aquí puedes cambiar la URL de la imagen de cada auto -->
          <img :src="car.image" :alt="car.name">
        </router-link>
        <!-- Cada nombre de auto es un botón que también es un enlace -->
        <router-link :to="car.link">
          <button>{{ car.name }}</button>
        </router-link>
      </div>
    </div>

</template>


<script>
export default {
  data() {
    return {
      cars: [
        // Datos de los autos, incluyendo el nombre, la URL de la imagen y el enlace
        { name: 'Kicks', image: 'https://www.nissan-cdn.net/content/dam/Nissan/BO/vehicles/qashqai/my23/vap/Qashqai_cars.jpg.ximg.l_3_m.smart.jpg', link: 'https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MTS18,$PN01,$WS90,$IBE00&view=FRONT34&model=ms&size=1920&bkba_opt=2&crop=0,0,0,0&' },
        { name: 'Qashqai', image: 'https://www.nissan-cdn.net/content/dam/Nissan/BO/vehicles/kicks/NewKicksBolivia/Nuevo-Kicks-(packshot)-Exclusive.jpg.ximg.l_3_m.smart.jpg', link: '/Auto_ordenar' },
        { name: 'Nissan X-Trail', image: 'https://www.nissan-cdn.net/content/dam/Nissan/BO/vehicles/x-trail/my23/vap/xtrail.jpg.ximg.l_3_m.smart.jpg', link: 'https://example.com/xtrail' },
        { name: 'Murano', image: 'https://www.nissan-cdn.net/content/dam/Nissan/BO/vehicles/NuevaMurano/Nueva-Murano-Cars.jpg.ximg.l_3_m.smart.jpg', link: 'https://example.com/murano' },
        { name: 'Patrol', image: 'https://www.nissan-cdn.net/content/dam/Nissan/BO/vehicles/patrol-safari/product_code/product_version/Packshots/Patrol-Y61%20-%203Quarter%20View%20-%201536x864.png.ximg.l_3_m.smart.png', link: 'https://example.com/patrol' },
        { name: 'Patrol V8', image: 'https://www.nissan-cdn.net/content/dam/Nissan/BO/vehicles/patrol2021mc/NISSAN_PATROL_Front_3-4_White.jpg.ximg.l_3_m.smart.jpg', link: 'https://example.com/patrolv8' },
        { name: 'Pathfinder', image: 'https://www.nissan-cdn.net/content/dam/Nissan/BO/vehicles/pathfinder/my24/Pathfinder-(packshot)-Exclusive.jpg.ximg.l_3_m.smart.jpg', link: 'https://example.com/pathfinder' }
      ]
    };
  }
};
</script>


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
<template>
  <div class="carousel">
    <div class="list">
      <div class="item" v-for="(image, index) in images" :key="index">
        <img :src="image.src" :alt="image.alt">
        <div class="content">
          <div class="author">{{ image.author }}</div>
          <div class="title">{{ image.title }}</div>
          <div class="topic">{{ image.topic }}</div>
          <div class="des">{{ image.des }}</div>
          <div class="buttons">
            <button>EXPLORAR</button>

          </div>
        </div>
      </div>
    </div>



    <time class="time"></time>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';

const images = [
  { src: 'https://www.karvi.com.br/_next/image/?url=https%3A%2F%2Fdjdnloyvqzzd3.cloudfront.net%2Fstatic%2Fgallery%2Fbr%2Fdesktop%2Fchevrolet_tracker_2022_perfil_frente.jpg&w=1440&q=90', alt: 'Auto1', title: 'EMPRESA CHEVROLET', des:'Empresa corporacion  de autos de calidad para toda la familia'},
];


</script>


<style scoped>


.carousel {
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  position: relative;
  z-index: 1; /* Asegura que el carrusel esté detrás de la barra de navegación */
}

.carousel .list .item {
  position: absolute;
  inset: 0 0 0 0;
}

.carousel .list .item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.carousel .list .item .content {
  position: absolute;
  top: 10%; /* Ajusta este valor para mover todo el contenido más arriba o abajo */
  width: 80%;
  max-width: 1140px;
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
  color: white;
  text-shadow: 0 5px 10px #0004;
  font-family: 'Poppins', sans-serif;
}

.carousel .list .item .content .title,
.carousel .list .item .content .topic {
  font-weight: bold;
  font-size: 5em;
  line-height: 1.3em;
  display: block;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: 1px; /* Espacio entre el título y la descripción */
}

.carousel .list .item .content .des {
  color: #eee;
  margin-top: 1px; /* Añade espacio entre el título y la descripción */
  font-size: 1.2em;
  font-weight: 300;
}

.carousel .list .item .content .buttons {
  display: flex;
  justify-content: center;
  margin-top: 450px; /* Ajusta este valor para mover los botones más arriba o abajo */
}

.carousel .list .item .content button {
  border: none;
  padding: 10px 20px;
  margin: 0 10px;
  font-family: 'Poppins', sans-serif;
  font-weight: 500;
  letter-spacing: 3px;
  cursor: pointer;
  transition: background-color 0.3s, color 0.3s;
}

.carousel .list .item .content button:nth-child(1) {
  background-color: #eeee;
  color: #333;
}

.carousel .list .item .content button:nth-child(2) {
  background-color: transparent;
  color: #eee;
  border: 1px solid #eee;
}

.carousel .list .item .content button:hover {
  background-color: #f1683a;
  color: white;
}

.carousel .list .item:nth-child(1) {
  z-index: 1;
}

.carousel .list .item:nth-child(1) .author,
.carousel .list .item:nth-child(1) .title,
.carousel .list .item:nth-child(1) .topic,
.carousel .list .item:nth-child(1) .des,
.carousel .list .item:nth-child(1) .buttons {
  transform: translateY(50px);
  filter: blur(20px);
  opacity: 0;
  animation: showContent 0.5s 1s linear forwards;
}

@keyframes showContent {
  to {
    opacity: 1;
    filter: blur(0);
    transform: translateY(0);
  }
}

.carousel .list .item:nth-child(1) .title {
  animation-delay: 1.2s;
}

.carousel .list .item:nth-child(1) .topic {
  animation-delay: 1.4s;
}

.carousel .list .item:nth-child(1) .des {
  animation-delay: 1.6s;
}

.carousel .list .item:nth-child(1) .buttons {
  animation-delay: 1.8s;
}

.carousel.next .list .item:nth-child(1) img {
  width: 150px;
  height: 220px;
  position: absolute;
  left: 50%;
  bottom: 50px;
  border-radius: 20px;
  animation: showImage 0.5s linear 1 forwards;
}

@keyframes showImage {
  to {
    width: 100%;
    height: 100%;
    left: 0;
    bottom: 0;
    border-radius: 0;
  }
}

.carousel.next .thumbnail .item:nth-child(1) {
  width: 0;
  overflow: hidden;
  animation: showThumbnail 0.5s linear 1 forwards;
}

@keyframes showThumbnail {
  to {
    width: 150px;
  }
}

@keyframes contentOut {
  to {
    transform: translateY(-150px);
    filter: blur(20px);
    opacity: 0;
  }
}

.carousel.next .arrows button,
.carousel.prev .arrows button {
  pointer-events: none;
}

.time {
  width: 0%; /* Para mostrar la barra de tiempo arriba del navbar */
  height: 3px;
  background-color: #f1683a;
  position: absolute;
  z-index: 100;
  top: 0;
  left: 0;
}

.carousel.next .time,
.carousel.prev .time {
  width: 100%;
  animation: timeRunning 2s linear 1 forwards; /* Para mostrar la barra de tiempo arriba del navbar */
}

@keyframes timeRunning {
  to {
    width: 0;
  }
}

@media screen and (max-width: 670px) {
  .carousel .list .item .content {
    padding-right: 0;
  }

  .carousel .list .item .content .title {
    font-size: 30px;
  }

  .carousel .list .item .content .des {
    font-size: 1em;
  }

  .carousel .list .item .content .buttons {
    flex-direction: column;
    gap: 10px;
  }

  .carousel .list .item .content button {
    width: 100%;
  }
}
</style>

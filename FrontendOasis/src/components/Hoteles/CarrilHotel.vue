/*carrilhotel*/
<template>
  <div ref="carouselDom" class="carousel" v-if="carouselItems.length">
    <div ref="listItemDom" class="list">
      <div class="item" v-for="(item, index) in carouselItems" :key="index">
        <img :src="item.src" :alt="item.alt">
        <div class="content">
          <div class="author">{{ item.author }}</div>
          <div class="title">{{ item.title }}</div>
          <div class="topic">{{ item.topic }}</div>
          <div class="des">{{ item.des }}</div>
          <div class="buttons"></div>
        </div>
      </div>
    </div>

    <div ref="thumbnailDom" class="thumbnail">
      <div class="item" v-for="(thumbnail, index) in carouselItems" :key="index">
        <img :src="thumbnail.src" :alt="thumbnail.alt">
        <div class="content">
          <div class="title">{{ thumbnail.title }}</div>
          <div class="des">{{ thumbnail.des }}</div>
        </div>
      </div>
    </div>

    <div class="arrows">
      <button ref="prevDom" @click="showSlider('prev')">&lt;</button>
      <button ref="nextDom" @click="showSlider('next')">&gt;</button>
    </div>
    <time class="time"></time>
  </div>
  <div v-else>No hay datos disponibles</div>
</template>

<script setup lang="ts">
import { ref, watch, onMounted, onBeforeUnmount } from 'vue';
import { useCountryStore } from '../../store/country';

const store = useCountryStore();

const carouselItems = ref([]);

watch(
    () => store.hotelCarousel,
    (newData) => {
      carouselItems.value = newData || [];
      console.log('Datos del carrusel actualizados:', newData);
    },
    { immediate: true } // This ensures the watcher runs immediately and sets the initial value
);

const nextDom = ref<HTMLButtonElement | null>(null);
const prevDom = ref<HTMLButtonElement | null>(null);
const carouselDom = ref<HTMLDivElement | null>(null);
const listItemDom = ref<HTMLDivElement | null>(null);
const thumbnailDom = ref<HTMLDivElement | null>(null);

const timeRunning = 3000;
const timeAutoNext = 15000;
let runTimeOut: ReturnType<typeof setTimeout>;
let runAutoRun: ReturnType<typeof setTimeout>;

const showSlider = (type: 'next' | 'prev') => {
  if (!listItemDom.value || !thumbnailDom.value || !carouselDom.value) return;

  const itemSlider = Array.from(listItemDom.value.querySelectorAll('.item'));
  const itemThumbnail = Array.from(thumbnailDom.value.querySelectorAll('.item'));

  if (type === 'next') {
    if (itemSlider.length > 0 && itemSlider[0] instanceof Node) {
      listItemDom.value.appendChild(itemSlider[0]);
    }
    if (itemThumbnail.length > 0 && itemThumbnail[0] instanceof Node) {
      thumbnailDom.value.appendChild(itemThumbnail[0]);
    }
    carouselDom.value.classList.add('next');
  } else {
    const positionLastItem = itemSlider.length - 1;
    if (positionLastItem >= 0 && itemSlider[positionLastItem] instanceof Node) {
      listItemDom.value.prepend(itemSlider[positionLastItem]);
    }
    if (positionLastItem >= 0 && itemThumbnail[positionLastItem] instanceof Node) {
      thumbnailDom.value.prepend(itemThumbnail[positionLastItem]);
    }
    carouselDom.value.classList.add('prev');
  }

  clearTimeout(runTimeOut);
  runTimeOut = setTimeout(() => {
    if (carouselDom.value) {
      carouselDom.value.classList.remove('next', 'prev');
    }
  }, timeRunning);

  clearTimeout(runAutoRun);
  runAutoRun = setTimeout(() => {
    nextDom.value?.click();
  }, timeAutoNext);
};

onMounted(() => {
  runAutoRun = setTimeout(() => {
    nextDom.value?.click();
  }, timeAutoNext);
});

onBeforeUnmount(() => {
  clearTimeout(runAutoRun);
  clearTimeout(runTimeOut);
});
</script>




<style scoped>
.carousel {
  width: 98.9vw;
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
  top: 20%;
  width: 1140px;
  max-width: 80%;
  left: 50%;
  transform: translateX(-50%);
  padding-right: 30%;
  box-sizing: border-box;
  color: white;
  text-shadow: 0 5px 10px #0004;
}

.carousel .list .item .content .author {
  font-weight: bold;
  letter-spacing: 10px;
  margin-left: -100px;

}

.carousel .list .item .content .title,
.carousel .list .item .content .topic {
  font-weight: bold;
  font-size: 5em;
  line-height: 1.3em;
  margin-left: -100px;
}

.carousel .list .item .content .topic {
  color: orange;
}

.carousel .list .item .content .des {
  color: #eee;
  margin-left: -100px;
}

.carousel .list .item .content .buttons {
  display: grid;
  grid-template-columns: repeat(2, 180px);
  grid-template-rows: 40px;
  gap: 7px;
  margin-top: 30px;
  margin-left: -100px;
}



.thumbnail {
  position: absolute;
  bottom: 50px;
  left: 50%;
  width: max-content;
  z-index: 100;
  display: flex;
  gap: 20px;
}

.thumbnail .item {
  width: 150px;
  height: 220px;
  flex-shrink: 0;
  position: relative;
}

.thumbnail .item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 10px;
}

.thumbnail .item .content {
  position: absolute;
  bottom: 10px;
  left: 10px;
  right: 10px;
}

.thumbnail .item .content .title {
  font-weight: bold;
  color: white;
}
.thumbnail .item .content .des{
  color: white;
}

.arrows {
  position: absolute;
  top: 80%;
  right: 52%;
  width: 300px;
  max-width: 30%;
  display: flex;
  gap: 10px;
  align-items: center;
}

.arrows button {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background-color: #eee4;
  border: none;
  font-family: monospace;
  color: #fff;
  font-weight: bold;
  font-size: large;
  transition: .5s;
  z-index: 100;
}

.arrows button:hover {
  background-color: #eee;
  color: #555;
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

.carousel.next .thumbnail .item:nth-child(1){

  width: 0;
  overflow: hidden;
  animation: showThumbnail .5s linear 1 forwards;

}

@keyframes showThumbnail  {

  to{
    width: 150px;

  }

}

.carousel.next .thumbnail{
  transform:translateX(150px);
  animation: transformThumbnail .5s linear 1 forwards;
}

@keyframes transformThumbnail {

  to{
    transform: translateX(0);
  }

}

/* efecto al hacer prevv*/

.carousel.prev .list .item:nth-child(2){
  z-index: 2;

}

.carousel.prev .list .item:nth-child(2) img{

  position: absolute;
  bottom: 0;
  left: 0;
  animation: outImage 0.5s linear 1 forwards;

}
@keyframes outImage {
  to{
    width: 150px;
    height: 220px;
    border-radius: 20px;
    left: 50%;
    bottom: 50px;
  }
}

.carousel.prev .thumbnail .item:nth-child(1){

  width: 0;
  overflow: hidden;
  opacity: 0;
  animation: showThumbnail 0.5s linear 1 forwards;

}

.carousel.prev .list .item:nth-child(2) .author,
.carousel.prev .list .item:nth-child(2) .title,
.carousel.prev .list .item:nth-child(2) .topic,
.carousel.prev .list .item:nth-child(2) .des,
.carousel.prev .list .item:nth-child(2) .buttons{

  animation: contentOut 1.5s linear 1 forwards;

}

@keyframes contentOut {

  to{
    transform: translateY(-150px);
    filter: blur(20px);
    opacity: 0;
  }

}

.carousel.next .arrows button,
.carousel.prev .arrows button{
  pointer-events: none;

}

/*para el tiempo de transicion de imagenes con las letras*/

.time{
  width: 0%;/*oara mostral la barra e tiempo arriba del navbar*/
  height: 3px;
  background-color: #676360;
  position: absolute;
  z-index: 100;
  top:0;
  left: 0;
}

.carousel.next .time,
.carousel.prev .time{
  width: 100%;
  animation: timeRunning 2s linear 1 forwards;/*oara mostral la barra e tiempo arriba del navbar*/

}

@keyframes timeRunning {

  to{
    width: 0;

  }

}
.buttons .nav-link {
  border: none;
  background-color: white;
  letter-spacing: 3px;
  font-family: Poppins;
  font-weight: 500;
  color: black;
}/* Estilos responsivos para dispositivos móviles */
@media screen and (max-width: 480px) {



  .carousel .list .item .content {
    top: 15%;
    width: 90%;
    max-width: none;
    left: 50%;
    transform: translateX(-50%);
    padding-right: 10%;
    box-sizing: border-box;
    color: white;
    text-shadow: 0 5px 10px #0004;
  }

  .carousel .list .item .content .author {
    font-weight: bold;
    letter-spacing: 5px;
    margin-left: 10px;
    font-size: 0.8em;
  }

  .carousel .list .item .content .title,
  .carousel .list .item .content .topic {
    font-weight: bold;
    font-size: 2em;
    line-height: 1.2em;
    margin-left: 10px;
  }

  .carousel .list .item .content .topic {
    color: orange;
  }

  .carousel .list .item .content .des {
    color: #eee;
    margin-left: 10px;
    font-size: 0.8em;
  }

  .carousel .list .item .content .buttons {
    display: grid;
    grid-template-columns: repeat(2, 100px);
    grid-template-rows: 30px;
    gap: 5px;
    margin-top: 20px;
    margin-left: -50px;
    font-size: 0.7em;
  }

  .thumbnail {
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    width: 100%;
    max-width: 100%;
    display: flex;
    gap: 20px;
    justify-content: center;
    z-index: 100;
  }

  .thumbnail .item {
    width: 150px;
    height: auto;
    flex-shrink: 0;
    position: relative;
  }

  .thumbnail .item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 10px;
  }
}


/* Media query para pantallas medianas (tablet) */
@media screen and (min-width: 769px) and (max-width: 1024px) {
  .carousel .list .item .content .title {
    font-size: 4em; /* Tamaño de fuente para títulos en pantallas medianas */
    margin-left: -200px;
  }

  .carousel .list .item .content .topic {
    font-size: 3em; /* Tamaño de fuente para temas en pantallas medianas */
  }

  .carousel .list .item .content .des {
    font-size: 2em; /* Tamaño de fuente para descripciones en pantallas medianas */
  }

  .thumbnail .item {
    width: 140px; /* Ajustar el ancho de los thumbnails en pantallas medianas */
    height: 200px; /* Ajustar el alto de los thumbnails en pantallas medianas */
  }

  .thumbnail .item img {
    border-radius: 8px; /* Reducir el radio de borde de las imágenes en pantallas medianas */
  }
}

/* Media query para pantallas grandes (desktop) */
@media screen and (min-width: 1025px) {
  .carousel .list .item .content .title {
    font-size: 5em; /* Tamaño de fuente para títulos en pantallas grandes */
  }

  .carousel .list .item .content .topic {
    font-size: 4em; /* Tamaño de fuente para temas en pantallas grandes */
  }

  .carousel .list .item .content .des {
    font-size: 2.5em; /* Tamaño de fuente para descripciones en pantallas grandes */
  }

  .thumbnail .item {
    width: 160px; /* Ajustar el ancho de los thumbnails en pantallas grandes */
    height: 240px; /* Ajustar el alto de los thumbnails en pantallas grandes */
  }

  .thumbnail .item img {
    border-radius: 10px; /* Reducir el radio de borde de las imágenes en pantallas grandes */
  }
}
</style>

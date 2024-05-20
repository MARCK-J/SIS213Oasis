<template>
  <div class="caruosel">

    <div class="list">
      <div class="item">
        <img src="src/assets/Auto/carrusel/Auto1.png">
        <div class ="content">
          <div class ="author"> LUNDEV </div>
          <div class ="title"> DESING SLIDER </div>
          <div class ="topic"> AUTOS </div>
          <div clas ="des">
            Lorem
          </div>

          <div class ="buttons">
            <button> boton1</button>
            <button> boton2</button>

          </div>

        </div>

      </div>


      <div class="item">
        <img src="src/assets/Auto/carrusel/Auto2.jpeg">
        <div class ="content">
          <div class ="author"> LUNDEV </div>
          <div class ="title"> DESING SLIDER </div>
          <div class ="topic"> AUTOS </div>
          <div clas ="des">
            Lorem
          </div>

          <div class ="buttons">
            <button> boton1</button>
            <button> boton2</button>

          </div>

        </div>

      </div>


      <div class="item">
        <img src="src/assets/Auto/carrusel/Auto3.jpeg">
        <div class ="content">
          <div class ="author"> LUNDEV </div>
          <div class ="title"> DESING SLIDER </div>
          <div class ="topic"> AUTOS </div>
          <div clas ="des">
            Lorem
          </div>

          <div class ="buttons">
            <button> boton1</button>
            <button> boton2</button>

          </div>

        </div>

      </div>



      <div class="item">
        <img src="src/assets/Auto/carrusel/Auto4.jpeg">
        <div class ="content">
          <div class ="author"> OASIS</div>
          <div class ="title"> Autos para todo terreno</div>
          <div class ="topic"> Exclusivos</div>
          <div class ="des">
            Lorem esta es una descripcion para hacer en slider
          </div>

          <div class ="buttons">
            <button> boton1</button>
            <button> boton2</button>

          </div>

        </div>

      </div>

    </div>


  </div>






</template>

<script setup lang="ts">
</script>


<style scoped>


/* estilos del carrusel*/
.caruosel{
  width: 100vw;
  height: 100vw;
  overflow: hidden;
  margin-top: -50px;
  position: relative;

}

.caruosel  .list .item {

  position: absolute;
  inset: 0 0 0 0;


}

.caruosel .list .item img {
  width: 100%;
  height: 50%;
  display: block;
  object-fit: cover;
  margin: 50px auto 0; /* Ajusta el margen superior para bajar la imagen */
}


.caruosel  .list .item  .content{
  position: absolute;
  top: 20%;
  width: 1140px;
  max-width: 80%;
  left: 45%;
  transform: translateX(-50%);
  padding-right: 30%;
  box-sizing: border-box;
  color: #151111;
  text-shadow: 0 5px 10px  #0004;

}

.caruosel  .list .item  .content  .author{

  font-weight: bold;
  letter-spacing: 10px;
  margin:-80px auto 0;


}

.caruosel  .list .item  .content  .title,
.caruosel  .list .item  .content  .topic{

  font-weight: bold;
  font-size: 4em;
  line-height: 1.2em;
}

.caruosel  .list .item  .content  .topic{

  color: orange;
}

.caruosel  .list .item  .content  .des{
  color: #eee;
}
.caruosel  .list .item  .content .buttons {

  display: grid;
  grid-template-columns:repeat(2, 180px);
  grid-template-rows:40px ;
  gap: 7px;
  margin-top: 25px;

}

.caruosel  .list .item  .content button{

  border: none;
  background-color:#eeee ;
  letter-spacing: 3px;
  font-family: -apple-system,serif;
  font-weight: 500;
}
/*esto es para hacer transparente el boton*/
.caruosel  .list .item  .content button:nth-child(2){
  background-color: transparent;
  color: #eee;
  border: 1px solid #eee;

}






</style>
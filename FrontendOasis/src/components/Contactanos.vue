<template>
  <center>
    <div class="Contactanos-contenedor">
      <form action="#">
        <h2>Contactanos</h2>
        <p>
          Si tienes dudas, consultas o reclamos con nuestros servicio y/o
          promociones, no dudes en tomar contacto con nosotros. Una Ejecutiva te
          responderá a la brevedad. Solo completa el siguiente formulario.
        </p>
        <input type="text" placeholder="Nombre" /> <br>
        <input type="email" placeholder="Correo Electronico" /> <br>
        <input type="number" placeholder="Telefono" /> <br>
        <textarea placeholder="Mensaje" /> <br>
        <br />
        <button>Enviar</button>
      </form>
    </div>

  </center>

</template>

<style>
.Contactanos-contenedor{
    margin-left: 20px;
    width: 60%;
    display: flex;
    justify-content: center;
}
.Contactanos-contenedor input{
    width:85%;
    padding: 5px;
    margin: 10px 20px;
    background: #eeeeed;
    border: 1px solid black;
}
.Contactanos-contenedor textarea{
    width:85%;
    padding: 5px;
    margin: 5px 20px;
    background: #eeeeed;
    border: 1px solid black;
}
.Contactanos-contenedor button{
    margin: 10px 20px;
    border: 1px solid black;
    background: green;
    padding: 5px 25px;
    border-radius: 20px;
}
@media (max-width: 600px) {
  .Contactanos-contenedor{
    width: 90%;
    align-items: center;
    justify-content: center;
  }
}
</style>
<script setup lang="ts">
</script>
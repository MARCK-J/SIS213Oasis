<template>
  <div class="agencia-informacion-container">
    <div class="informacion-content">
      <div class="informacion-panel">
        <h2>Visión</h2>
        <p>Ser reconocidos como la principal agencia de viajes especializada en destinos latinoamericanos, ofreciendo experiencias únicas y memorables que conecten a nuestros clientes con la riqueza cultural, la belleza natural y la autenticidad de cada país de la región.</p>
      </div>
      <div class="informacion-panel">
        <h2>Misión</h2>
        <p>En OASIS, nos comprometemos a proporcionar a nuestros clientes experiencias de viaje excepcionales a través de un servicio personalizado, itinerarios cuidadosamente diseñados y asociaciones con proveedores locales de confianza. Nuestro objetivo es inspirar la exploración, el descubrimiento y el enriquecimiento cultural, creando recuerdos que perduren toda la vida.</p>
      </div>
      <div class="informacion-panel">
        <h2>Historia</h2>
        <p>OASIS nació de la pasión por explorar Latinoamérica, fundada por apasionados viajeros con profundos vínculos regionales. Iniciando modestamente en una pequeña oficina, nos hemos convertido en la principal agencia de viajes especializada en destinos latinoamericanos, comprometidos con ofrecer experiencias únicas y auténticas que conecten a nuestros clientes con la riqueza cultural y la belleza natural de la región.</p>
      </div>
    </div>
  </div>
</template>
<style>
.agencia-informacion-container {
  width: 100%;
  padding: 50px 0px;
  display: flex;
  justify-content: center;
}
.informacion-content {
  gap: 20px;
  width: 80%; /* Cambiado para que los paneles no estén tan juntos */
  display: flex;
  flex-wrap: wrap; /* Cambiado a wrap para que los paneles se ajusten automáticamente */
  justify-content: space-between;
}
.informacion-panel {
  flex: 1 1 calc(33.33% - 20px); /* Cada panel ocupará el 33.33% del espacio disponible con un margen de 20px */
  padding: 20px;
  border-radius: 10px;
  border: 1px solid #ccc; /* Añadido un borde para separar visualmente los paneles */
  background-color: #fff; /* Añadido un fondo blanco para cada panel */
}
.informacion-panel h2 {
  margin-top: 0; /* Eliminado el margen superior del título para una apariencia más compacta */
}
</style>

<template>
    <div class="TarjetaVerificacion">
      <img src="src/assets/logo_black.png" alt="Logo Oasis" />
      <br />
      <h3>Verificacion de dos pasos</h3>
      <p>Se le envio un codigo de verificacion a su correo</p>
      <p>por favor ingrese ese codigo en el siguiente campo para la validacion</p>
      <form @submit.prevent="" class="form">
        <div class="CustomInput">
          <p>Codigo de verificacion:</p>
        <input
          placeholder="Ingrese su codigo de verificacion"
          type="text"
          required
        />
        </div>
        <button type="submit">Continuar</button>
      </form>
    </div>
  </template>
  <style>
  .CustomInput {
      width: 85%;
      display: flex;
      justify-content: center;
      flex-direction: column;
      margin: 10px 0px;
  }
  .CustomInput p {
      padding: 0;
      margin: 0;
  }
  .CustomInput input {
      border: 2px solid black;
      border-radius: 25px;
      padding: 10px 20px;
  }
  .form {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }
  
  .TarjetaVerificacion {
    background: #d5f3fb;
    border: 3px solid black;
    width: 30%;
    height: fit-content;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 40px 8px;
    border-radius: 30px;
  }
  .TarjetaVerificacion p{
    width: 80%;
  }
  
  .TarjetaVerificacion img {
    width: 35%;
  }
  
  .enlace {
    margin: 10px 0px;
  }
  
  .TarjetaVerificacion button {
    width: 85%;
    border-radius: 25px;
    padding: 10px;
    background-color: blue;
    border: 2px solid black;
    color: #fff;
  }
  
  .registro-enlace-container {
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  @media (max-width: 860px) {
    .TarjetaVerificacion {
      width: 70%;
      padding: 10px 2px;
    }
  }
  </style>
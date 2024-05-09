<template>
  <div class="TarjetaRestablecerContra">
    <img src="src/assets/logo_black.png" alt="Logo Oasis" />
    <br />
    <h3>Reestablecimiento de contraseña</h3>
    <p>En el siguiente apartado puede crear una nueva contraseña</p>
    <form @submit.prevent="verificarPassword" class="form">
      <div class="CustomInput">
        <p>Nueva contraseña:</p>
        <input
          placeholder="Ingrese una nueva contraseña"
          type="password"
          v-model="password"
          required
        />
        <p>Confirmar contraseña:</p>
        <input
          placeholder="Repita la contraseña"
          type="password"
          v-model="confirmpassword"
          required
        />
      </div>
      <button type="submit">Continuar</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      password: "",
      confirmpassword: "",
    };
  },
  methods: {
    async restablecerContra() {
      try {
        //Aqui va el UPDATE
      } catch (error) {
        console.error("Error al actualizar contrasenia", error);
      }
    },
    verificarPassword(){
      if(this.password == this.confirmpassword){
        this.mostrarError('Las contraseñas son iguales','success');
        this.restablecerContra();
      }else{
        this.mostrarError('Las contraseñas deben ser iguales','error');
      }
    },
    mostrarError(message, icon) {
      this.$swal({
        icon: icon,
        title: "Oops...",
        text: message,
      });
    },
  },
};
</script>
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

.TarjetaRestablecerContra {
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
.TarjetaRestablecerContra p {
  width: 80%;
}

.TarjetaRestablecerContra img {
  width: 35%;
}

.TarjetaRestablecerContra h3 {
  width: 80%;
}

.enlace {
  margin: 10px 0px;
}

.TarjetaRestablecerContra button {
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
  .TarjetaRestablecerContra {
    width: 70%;
    padding: 10px 2px;
  }
}
</style>

<template>
  <div class="TarjetaLogin">
    <img src="src/assets/logo_black.png" alt="Logo Oasis" />
    <br />
    <h3>Bienvenido</h3>
    <p>Inicie su sesión para continuar en Oasis</p>
    <form @submit.prevent="loginPersona" class="form">
      <CustomInput
        label="Nombre de Usuario:"
        placeholder="Ingrese su nombre de usuario"
        inputType="text"
        v-model="nombre"
      />
      <CustomInput
        label="Contraseña:"
        placeholder="Ingrese su contraseña"
        inputType="password"
        v-model="password"
      />
      <router-link to="" class="enlace">¿Olvidaste tu contraseña?</router-link>
      <button type="submit">Continuar</button>
    </form>
    <div class="registro-enlace-container">
      <span>¿No tienes una cuenta?</span>
      <router-link to="/RegistroPersona" class="enlace">Regístrate</router-link>
    </div>
    <GoogleLogin :callback="callback" prompt auto-login />
  </div>
</template>

<script>
import { defineComponent } from 'vue';
import { useStore } from 'vuex';
import { useRouter } from "vue-router";
import axios from 'axios'; // Importa axios para hacer solicitudes HTTP

import CustomInput from "./CustomInput.vue";

export default defineComponent({
  name: "TarjetaLogin",
  components: {
    CustomInput,
  },
  setup() {
    const store = useStore();
    const router = useRouter();

    const loginPersona = async () => {
      try {
        // Realiza una solicitud POST al endpoint de inicio de sesión
        const response = await axios.post('/api/v1/cliente/login', {
          correo: nombre, // Usa el valor del nombre de usuario del input
          password: password // Usa el valor de la contraseña del input
        });

        // Si la solicitud es exitosa, actualiza el estado de autenticación y redirige al usuario
        store.commit('setLoggedIn', true);
        store.commit('setUser', response.data);
        router.push("/");

      } catch (error) {
        // Si hay un error en la solicitud, muestra un mensaje de error
        console.error("Error al iniciar sesión:", error.response.data.message);
        // Aquí puedes mostrar el mensaje de error en tu aplicación, por ejemplo, en un componente de alerta
      }
    };

    const continuar = () => {
      // Validar los campos, por ejemplo, si están llenos
      if (nombre && password) {
        // Si los campos son válidos, llamar a loginPersona para iniciar sesión
        loginPersona();
      } else {
        // Si los campos no son válidos, puedes mostrar un mensaje de error o realizar otra acción
        console.error("Los campos no pueden estar vacíos");
      }
    };

    const callback = (response) => {
      console.log("Inicio de sesión con éxito");
      const user = decodeCredential(response.credential);
      store.commit('setLoggedIn', true);
      store.commit('setUser', user);
      router.push("/");
    };

    return {
      continuar,
      callback
    };
  },
});
</script>

<style>
.form {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.TarjetaLogin {
  background: #d5f3fb;
  border: 3px solid black;
  width: 25%;
  height: fit-content;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 20px 8px;
  border-radius: 30px;
}

.TarjetaLogin img {
  width: 35%;
}

.enlace {
  margin: 10px 0px;
}

.TarjetaLogin button {
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
  .TarjetaLogin {
    width: 70%;
    padding: 10px 2px;
  }
}
</style>

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
import { decodeCredential } from "vue3-google-login";
import CustomInput from "./CustomInput.vue";
import { useRouter } from "vue-router";

export default defineComponent({
  name: "TarjetaLogin",
  components: {
    CustomInput,
  },
  setup() {
    const store = useStore();
    const router = useRouter();

    const callback = (response) => {
      console.log("Inicio de sesión con éxito");
      const user = decodeCredential(response.credential);
      store.commit('setLoggedIn', true);
      store.commit('setUser', user);
      router.push("/");
    };

    return {
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

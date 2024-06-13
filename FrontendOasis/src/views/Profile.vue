<template>
  <div>
    <template v-if="isAuthenticated">
      <div class="container">
        <div class="row align-items-center profile-header">
          <div class="col-md-2 mb-3">
            <img
              :src="user.picture ? user.picture : ('/src/assets/deafult_profile.png')"
              alt="User's profile picture"
              class="rounded-circle img-fluid profile-picture"
            />
          </div>
          <div class="col-md text-center text-md-left">
            <h2>{{ user?.name }}</h2>
            <p class="lead text-muted">{{ user?.email }}</p>
          </div>
        </div>
        <div class="row">
          <highlightjs language="json" :code="JSON.stringify(user, null, 2)" />
        </div>
      </div>
    </template>
    <template v-else>
      <div class="container">
        <h2>¡Bienvenido a nuestra aplicación!</h2>
        <p>Inicia sesión para ver tu perfil.</p>
      </div>
    </template>
  </div>
</template>

<script lang="ts">
import NavBar from '../components/NavBar.vue';
import { useStore } from 'vuex';

export default {
  name: "profile-view",
  components:{
    NavBar
  },
  setup() {
    const store = useStore();
    
    return {
      isAuthenticated: store.state.loggedIn,
      user: store.state.user,
    }
  }
};
</script>

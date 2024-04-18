<template>
  <div id="app" class="d-flex flex-column h-100">
    <nav-bar/>
    <div >
      <error />
      <div >
        <router-view />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Error from "./components/Error.vue";
import NavBar from "./components/NavBar.vue";

export default {

};
</script>

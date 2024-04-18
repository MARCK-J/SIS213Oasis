<template>
  <div>
    <nav-bar />
    <hero />
    <hr />
    <home-content />
  </div>
</template>

<script lang="ts">
import Hero from "../components/Hero.vue";
import HomeContent from "../components/HomeContent.vue";
import NavBar from "../components/NavBar.vue";
import Error from "../components/Error.vue";

export default {
  name: "home-view",
  components: {
    Hero,
    HomeContent,
    NavBar,
    Error
  },
};
</script>

<style lang="css" scoped>
.next-steps .fa-link {
    margin-right: 5px;
}
</style>

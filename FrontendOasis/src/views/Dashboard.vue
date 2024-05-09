<template>
  <div>
    <nav-bar/>
    <TableAudit/>
  </div>
</template>

<script>
import NavBar from "../components/NavBar.vue";
import TableAudit from "../components/Dashboard/TableAudit.vue";

export default {
  name: "home-view",
  components: {
    NavBar,
    TableAudit

  },
};
</script>


<style scoped>

</style>
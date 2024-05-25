<template>
  <div>
    <nav-bar/>
    <TableResHotel/>
  </div>
</template>

<script>
import NavBar from "../components/NavBar.vue";
//import TableAudit from "../components/Dashboard/TableAudit.vue";
import TableResHotel from "../components/Dashboard/CRUD_Hoteles/TableResHotel.vue";

export default {
  name: "home-view",
  components: {
    NavBar,
    //TableAudit
    TableResHotel

  },
};
</script>


<style scoped>

</style>
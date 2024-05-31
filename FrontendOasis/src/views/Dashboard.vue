<template>
  <nav-bar/>
    <div class="DashboardContainer">
      <side-bar class="barralateral" @optionSelected="optionSelected"/>
      <div class="content">
        <component :is="currentComponent" />
      </div>
    </div>
</template>

<script>
import NavBar from "../components/NavBar.vue";
//import TableAudit from "../components/Dashboard/TableAudit.vue";
import TableResHotel from "../components/Dashboard/CRUD_ResHoteles/TableResHotel.vue";
import SideBar from "../components/Admin/SideBar.vue";
import TableAudit from "../components/Dashboard/TableAudit.vue";
import TableVuelo from "../components/Dashboard/CRUD_Vuelos/TableVuelo.vue";
import TableAlquilerAu from "../components/Dashboard/CRUD_AlquilerAutos/TableAlquilerAu.vue";
import FormRegisterVue from "../components/Dashboard/ReservaViaje/FormRegisterVue.vue";
import TableViaje from "../components/Dashboard/ReservaViaje/TableViaje.vue";

export default {
  components: {
    NavBar,
    SideBar,
    TableAudit,
    TableResHotel,
    TableVuelo,
    TableAlquilerAu,
    FormRegisterVue,
    TableViaje,

  },
  data() {
    return {
      currentComponent: 'TableAudit'
    }
  },
  methods: {
    optionSelected(option) {
      switch (option) {
        case 'admin':
          this.currentComponent = 'TableAudit';
          break;
        case 'flights':
          this.currentComponent = 'TableVuelo';
          break;
        case 'hotels':
          this.currentComponent = 'TableResHotel';
          break;
        case 'cars':
          this.currentComponent = 'TableAlquilerAu';
          break;
        case 'register_flight':
          this.currentComponent = 'FormRegisterVue';
          break;
        case 'registers_flights':
          this.currentComponent = 'TableViaje';
          break;
        case 'configurations':
          this.currentComponent = 'configurations';
          break;
        default:
          this.currentComponent = 'TableAudit';
      }
    }
  }
}
</script>

<style scoped>

.DashboardContainer {
  display: flex;
  flex-direction: row;
}

.barralateral{
  width: 12%;
  color: black;
}
.content{
  width: 85%;
}

</style>

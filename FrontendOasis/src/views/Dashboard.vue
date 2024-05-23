<template>
  <nav-bar/>
    <div class="DashboardContainer">
      <SideBar class="barralateral" @optionSelected="optionSelected"/>
      <div class="content">
        <component :is="currentComponent" />
      </div>
    </div>
</template>

<script>
import NavBar from "../components/NavBar.vue";
import SideBar from "../components/Admin/SideBar.vue";
import TableAudit from "../components/Dashboard/TableAudit.vue";


export default {
  components: {
    NavBar,
    SideBar,
    TableAudit,
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
          this.currentComponent = 'Flights';
          break;
        case 'hotels':
          this.currentComponent = 'Hotels';
          break;
        case 'cars':
          this.currentComponent = 'Cars';
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
  width: 15%;
}
.content{
  width: 85%;
}

</style>

<template>
  <div class="perfil">
    <template v-if="isAuthenticated">
      <div class="container">
        <br>
        <h2>Perfil del Cliente</h2>
        <div class="row align-items-center profile-header">
          <div class="col-md-2 mb-3">
            <img
              :src="user.picture ? user.picture : ('/src/assets/deafult_profile.png')"
              alt="User's profile picture"
              class="rounded-circle img-fluid profile-picture"
            />
          </div>
          <div class="col-md text-center text-md-left ">
            <h4>Nombre: {{ clienteData.nombre }}</h4>
            <h4>Apellido Paterno: {{ clienteData.apellidoP }}</h4>
            <h4>Apellido Materno: {{ clienteData.apellidoM }}</h4>
            <h4>Telefono: {{ clienteData.telefono }}</h4>
            <h4>Correo Electronico: {{ user?.result.correo }}</h4>
          </div>
        </div>
      </div>
    </template>
    <template v-else>
      <div class="administrador">
        <div class="tarjeta">
          <h1>Debe ingresar a su perfil</h1>
          <p>Puede volver a la pagina principal</p>
          <router-link to="/" class="ruteo">Home</router-link>
        </div>
      </div>
    </template>
  </div>
</template>

<script lang="ts">
import axios from "axios";
import NavBar from '../components/NavBar.vue';
import { useStore } from 'vuex';
import { useRouter } from "vue-router";
import Swal from "sweetalert2";

export default {
  name: "profile-view",
  components:{
    NavBar
  },
  data(){
    return{
      clienteData:{}
    }
  },
  setup() {
    const store = useStore();
    const router = useRouter();
    return {
      isAuthenticated: store.state.loggedIn,
      isAdmin: store.state.admin,
      user: store.state.user,
    }
  },
  mounted(){
    console.log("imprimir el usuario: ",this.user);
    if(this.user!=null){
      if(this.isAdmin == true){
        this.fetchAdminData();
      }else{
        this.fetchClienteData();
      }
    }else{
      console.log("nada");
    }
  },
  methods:{
    fetchClienteData() {
      const idPersona = this.$store.state.user.result.idPersona;
      axios
        .get(`http://localhost:9999/api/v1/persona/${idPersona}`)
        .then((response) => {
          this.clienteData = response.data.result;
          console.log("informacion acerca del cliente:   ",this.clienteData);
        })
        .catch((error) => {
          console.error("Hubo un error al obtener los datos del cliente:", error);
        });
    },
    fetchAdminData() {
      const idPersona = this.$store.state.user.result.idPersona;
      axios
        .get(`http://localhost:9999/api/v1/admin/${idPersona}`)
        .then((response) => {
          this.clienteData = response.data.result;
          console.log("informacion acerca del cliente:   ",this.clienteData);
        })
        .catch((error) => {
          console.error("Hubo un error al obtener los datos del cliente:", error);
        });
    },
    eliminarmicuenta(){
      this.fetchEliminarCliente();
      this.fetchEliminarPersona();
      const router = useRouter();
      this.$router.push("/");
      window.location.reload();
    },
    fetchEliminarCliente() {
      const idPersona = this.$store.state.user.result.idPersona;
      axios
        .delete(`http://localhost:9999/api/v1/cliente/delete/${idPersona}`)
        .then((response) => {
          console.log("Cliente eliminado con exito");
          Swal.fire({
          icon: "success",
          title: "Cuenta eliminada correctamente",
          });
        })
        .catch((error) => {
          console.log("Hubo un error al eliminar su cuenta");
          Swal.fire({
          icon: "error",
          title: "Hubo un error al eliminar su cuenta",
          });
        });
    },
    fetchEliminarPersona() {
      const idPersona = this.$store.state.user.result.idPersona;
      axios
        .delete(`http://localhost:9999/api/v1/persona/delete/${idPersona}`)
        .then((response) => {
          console.log("Cliente eliminado con exito");
          Swal.fire({
          icon: "success",
          title: "Cuenta eliminada correctamente",
          });
        })
        .catch((error) => {
          console.log("Hubo un error al eliminar su cuenta");
          Swal.fire({
          icon: "error",
          title: "Hubo un error al eliminar su cuenta",
          });
        });
    },
  }
};
</script>
<style>
.eliminar button{
  border: 1px solid black;
  border-radius: 15px;
  padding: 5px 11px;
  color: white;
  background-color: rgb(210, 51, 30);
}
.eliminar{
  display: flex;
  justify-content: center;
}
.perfil{
  background-color: white;
  height: 100vh;
}
.profile-header{
  border: 1px solid black;
  border-radius: 20px;
  background-color: antiquewhite;
  padding: 20px;
  height: auto;
}
.administrador {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 100vh;
  background-color: white;
}
.tarjeta {
  width: 80%;
  border: 1px solid black;
  border-radius: 15px;
  background-color:#FCEEDA;
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.ruteo{
  background-color: #ff9800;
  color: white;
  padding: 10px;
  border: 1px solid black;
  border-radius: 10px;
  text-align: center;
  width: 30%;
}
</style>

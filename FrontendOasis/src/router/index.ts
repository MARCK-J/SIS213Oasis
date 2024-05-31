import { createRouter as createVueRouter, createWebHashHistory, Router } from "vue-router";
import Home from "../views/Home.vue";
import Profile from "../views/Profile.vue";
import { createAuthGuard } from "@auth0/auth0-vue";
import { App } from 'vue';
import RegistroPersona from "../components/RegistroPersona.vue";
import RegistroAdmin from "../components/RegistroAdmin.vue";

import Login from "../views/Login.vue";
import Dashboard from "../views/Dashboard.vue";
import Hotel from "../views/Hotel/Hotel.vue";
import Verificacion from "../views/Verificacion.vue";
import TokenOlvido from "../views/TokenOlvido.vue";
import RestablecerContrasenia from "../views/RestablecerContrasenia.vue";
import Autos from "../views/Auto/Autos.vue";
import PantallaOrdenar from "../views/Auto/PantallaOrdenar.vue";

import ordenarHotel from "../views/Hotel/OrdenarHotel.vue";


export function createRouter(app: App): Router {
  return createVueRouter({
    routes: [
      {
        path: "/",
        name: "home",
        component: Home
      },
      {
        path: "/profile",
        name: "profile",
        component: Profile,
      },
      {
        path: "/RegistroPersona",
        name: "registroPersona",
        component: RegistroPersona
      },
      {
        path: "/RegistroAdmin",
        name: "registroAdmin",
        component: RegistroAdmin
      },
      { 
        path: "/Login",
        name: "Login",
        component: Login
      },
      {
        path: "/Dashboard",
        name: "dashboard",
        component: Dashboard
      },
      {
        path: "/Hotel",
        name: "hotel",
        component: Hotel
      },
      {
        path: "/Verificacion",
        name: "verificacion",
        component: Verificacion
      },
      {
        path: "/TokenOlvido",
        name: "tokenOlvido",
        component: TokenOlvido
      },
      {
        path: "/RestablecerContrasenia",
        name: "restablecerContrasenia",
        component: RestablecerContrasenia
      },

      {
        path: "/Autos",
        name: "Autos",
        component: Autos
      },
      {
        path: "/Auto_Ordenar",
        name: "AutoOrdenar",
        component:PantallaOrdenar
      },
      {
        path: "/Hotel_Ordenar",
        name: "HotelOrdenar",
        component:ordenarHotel
      },



    ],
    history: createWebHashHistory()
  })
}

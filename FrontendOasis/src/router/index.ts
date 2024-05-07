import { createRouter as createVueRouter, createWebHashHistory, Router } from "vue-router";
import Home from "../views/Home.vue";
import Profile from "../views/Profile.vue";
import { createAuthGuard } from "@auth0/auth0-vue";
import { App } from 'vue';
import RegistroPersona from "../components/RegistroPersona.vue";
import RegistroAdmin from "../components/RegistroAdmin.vue";

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
        beforeEnter: createAuthGuard(app)
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
    ],
    history: createWebHashHistory()
  })
}

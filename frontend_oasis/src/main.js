import './assets/main.css'

import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import App from './App.vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
//import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import '@fortawesome/fontawesome-free/css/all.css';
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
import RegistroPersona from "@/components/RegistroPersona.vue";
import RegistroCuenta from "@/components/RegistroCuenta.vue";




const routes = [
    {
        name: 'RegistroPersona',
        path: '/',
        component: RegistroPersona
    },
    {
        name: 'RegistroCuenta',
        path: '/registroCuenta',
        component: RegistroCuenta
    },
]

const router = createRouter({
    history: createWebHistory(),
    routes
});


createApp(App).use(router).component('font-awesome-icon', FontAwesomeIcon).use(VueSweetalert2).mount('#app')

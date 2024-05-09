import App from "./App.vue";
import { createApp } from "vue";
import { createRouter } from "./router";
import { library } from "@fortawesome/fontawesome-svg-core";
import { faLink, faUser, faPowerOff } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import hljs from 'highlight.js/lib/core';
import json from 'highlight.js/lib/languages/json';
import hljsVuePlugin from "@highlightjs/vue-plugin";
import "highlight.js/styles/github.css";
import vue3GoogleLogin from "vue3-google-login";
import store from "./functions/store";
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

hljs.registerLanguage('json', json);

const app = createApp(App);

library.add(faLink, faUser, faPowerOff);

app
  .use(hljsVuePlugin)
  .use(VueSweetalert2)
  .use(createRouter(app))
  .use(store)
  .use(vue3GoogleLogin, {
    clientId: '373256834880-m25tqbs62fuguij99hlhc4rv6qbv3ne9.apps.googleusercontent.com'
  })
  .component("font-awesome-icon", FontAwesomeIcon)
  .mount("#app");

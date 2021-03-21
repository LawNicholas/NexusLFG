import Vue from "vue";
import VueRouter from "vue-router";
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";
import Vuetify from 'vuetify';
import AsyncComputed from "vue-async-computed";

import App from "./App.vue";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Logout from "./pages/Logout";
import Register from "./pages/Register";
import Game from "./pages/Game";
import GameProfiles from "./pages/GameProfiles";
import Home2 from "./pages/Home2";

Vue.config.productionTip = false;

import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
import 'material-design-icons-iconfont/dist/material-design-icons.css';
import { getJwtToken } from "./auth";

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);
Vue.use(VueRouter);
Vue.use(Vuetify);
Vue.use(AsyncComputed);

const checkAuth = function(to, _, next) {
  const token = getJwtToken();
  if (token === undefined || token === "undefined" || token === null) {
    // redirect to login because we don't have token yet
    next({
      path: "/login",
      params: { nextUrl: to.fullPath },
    });
  } else {
    next();
  }
};

const router = new VueRouter({
  routes: [
    { path: "/", component: Home },
    { path: "/login", component: Login },
    { path: "/logout", component: Logout },
    { path: "/register", component: Register },
    { path: "/home2", component: Home2 },
    {
      path: "/game",
      component: Game,
      beforeEnter: checkAuth
    },
    {
      path: "/GameProfiles",
      component: GameProfiles,
      beforeEnter: checkAuth
    }
  ],
});

new Vue({
  router,
  render: (h) => h(App),
}).$mount("#app");
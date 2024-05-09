import { createStore } from 'vuex';

interface State {
  loggedIn: boolean;
  user: any;
  rol: any;
  id: any;
}

const store = createStore<State>({
  state: {
    loggedIn: false,
    user: null,
    rol: false,
    id: null
  },
  mutations: {
    setLoggedIn(state, value: boolean) {
      state.loggedIn = value;
    },
    setUser(state, user: any) {
      state.user = user;
    },
    setRol(state, rol: any) {
      state.rol = rol;
    },
    setId(state, id: any) {
      state.id = id;
    },
    getUser(state) {
        return state.user;
    },
    getRol(state) {
        return state.rol;
    },
    getId(state) {
        return state.id;
    }


  }
});

export default store;

import { createStore } from 'vuex';

interface State {
  loggedIn: boolean;
  user: any;
  rol: any;
  id: any;
  randomCode: string;
  selectedCity: string;
}

const store = createStore<State>({
  state: {
    loggedIn: false,
    user: null,
    randomCode: '',
    rol: false,
    id: null,
    selectedCity:'all',
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
    },
    setRandomCode(state, code: string) {
      state.randomCode = code;
    },
    setSelectedCity(state, city) {
      state.selectedCity = city;
    }
  },
  actions: {
    updateSelectedCity({ commit }, city) {
      commit('setSelectedCity', city);
    }
  },
  getters: {
    selectedCity: state => state.selectedCity
  }
});

export default store;

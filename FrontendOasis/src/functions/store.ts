import { createStore } from 'vuex';

interface State {
  loggedIn: boolean;
  user: any; 
}

const store = createStore<State>({
  state: {
    loggedIn: false,
    user: null
  },
  mutations: {
    setLoggedIn(state, value: boolean) {
      state.loggedIn = value;
    },
    setUser(state, user: any) {
      state.user = user;
    }
  }
});

export default store;

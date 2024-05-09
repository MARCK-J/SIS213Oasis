import { createStore } from 'vuex';

interface State {
  loggedIn: boolean;
  user: any;
  randomCode: string;
}

const store = createStore<State>({
  state: {
    loggedIn: false,
    user: null,
    randomCode: ''
  },
  mutations: {
    setLoggedIn(state, value: boolean) {
      state.loggedIn = value;
    },
    setUser(state, user: any) {
      state.user = user;
    },
    setRandomCode(state, code: string) {
      state.randomCode = code;
    }
  }
});

export default store;

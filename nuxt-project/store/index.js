import Vuex from 'vuex'
// import MODULE_AUTH from './modules/auth'
import MODULE_USER from './modules/user'
const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      counter: 0
    }),
    mutations: {
      
    },
    modules:{
      // MODULE_AUTH,
      MODULE_USER
    }
  })
}


export default createStore

// export const getters = {
//   isAuthenticated(state) {
//     return state.auth.loggedIn
//   },

//   loggedInUser(state) {
//     return state.auth.user
//   }
// }
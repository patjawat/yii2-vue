export default {
    state:{
        login:false,
        username:''
    },
    mutations: {
        GET_ME(state,data){
        state.username = data
        }
    },
    actions: {
        ACTION_GET_ME({commit},data){
            return new Promise((resolve, reject) =>{
                commit('GET_ME','aaaaa')
                setTimeout(() =>{
                    resolve(true)
                },1000)
            })
        }

    },getters: {
        
    }
}
export default {
    namespaced: true,
    state:{
        login:false,
        username:''
    },
    mutations: {
        GET_ME(state,data){
        state.username = data
        console.log(data)
        }
    },
    actions: {
        ACTION_GET_ME({commit},data){
            return new Promise((resolve, reject) =>{
                commit('GET_ME','aaaaa')
                setTimeout(() =>{
                    resolve(true)
                },100)
            })
            // console.log('get ME')
        }

    },getters: {
        
    }
}
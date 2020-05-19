<template>
  <div class="container">
    hello
  {{$store.state.MODULE_AUTH}}
    <button @click="loadData">Load Data</button>
    {{JSON.stringify(this.user)}}
    <img src="~assets/img/AdminLTELogo.png"/>
             <a class="navbar-item" @click="logout">Logout</a>

  </div>
</template>

<script>
import Logo from '~/components/Logo.vue'

export default {
   layout: 'adminLte',
   mounted() {
     console.log('State',$nuxt.$store.state);
   },
  components: {
    Logo
  },
    data() {
        return {
            user: []
        }
    },
  methods: {
    async loadData() {
       try {
       let res = await this.$axios.get('user/me');
       this.user = res.data;
      console.log(res.data.status)
       }catch(e) {
          this.error = e.res;
          this.user = e.message;
       }
    },
      async logout() {
    await this.$auth.logout();
  },
  }
}
</script>

<style>

</style>

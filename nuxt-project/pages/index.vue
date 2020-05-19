<template>
  <div class="container">
    hello
  {{$store.state.MODULE_AUTH}}
    <button @click="loadData">Load Data</button>
    <button @click="loadSuccess">loadSuccess</button>
    <br>
    {{JSON.stringify(this.user)}}
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
  async loadSuccess(){
    // this.$toast.success('Hello!');
    this.$toast.error("Toasted !!",
        {
          position: "top-right",
          duration: 2000,
          message: 'Oops...Something went wrong',
        }
      );
  }
  }
}
</script>

<style>

</style>

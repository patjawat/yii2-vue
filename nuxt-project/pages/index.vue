<template>
  <div class="container">
    hello
  
    <button @click="loadData">Load Data</button>
    {{JSON.stringify(this.user)}}
  </div>
</template>

<script>
import Logo from '~/components/Logo.vue'

export default {
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
    }
  }
}
</script>

<style>

</style>

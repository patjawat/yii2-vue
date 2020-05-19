<template>
  <div class="container">
  </div>
</template>

<script>
import { mapGetters, mapState, mapActions } from "vuex";
import Logo from "~/components/Logo.vue";

export default {
  mounted() {
    console.log("State", $nuxt.$store.state);
  },
  computed: {
    ...mapGetters({
      GET_LIST_USER: "MODULE_USER/GET_LIST_USER"
    }),
    ...mapState({
      stateListUser: state => state.MODULE_USER.listuser
    })
  },
  components: {
    Logo
  },
  data() {
    return {
      user: []
    };
  },
  methods: {
    ...mapActions({
      ACTION_GET_ME: "MODULE_AUTH/ACTION_GET_ME",
      ACTION_SET_FORM_EDIT: "MODULE_USER/ACTION_SET_FORM_EDIT"
    }),
    async loadData() {
      try {
        let res = await this.$axios.get("user/me");
        this.user = res.data;
        // console.log(res.data.status);
        // $store.state.auth.user = res.data;
        this.ACTION_GET_ME(88)

      } catch (e) {
        this.error = e.res;
        this.user = e.message;
      }
    },
    async logout() {
      await this.$auth.logout();
    },
    async loadSuccess() {
      this.$toast.error("Toasted !!", {
        position: "top-right",
        duration: 2000,
        message: "Oops...Something went wrong"
      });
    }
  }
};
</script>

<style>
</style>

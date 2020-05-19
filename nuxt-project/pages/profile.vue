<template>
  <section class="section">
    <div class="container">
      <h2 class="title">My Profile {{$store.state.MODULE_AUTH}}</h2>
      <div class="content">
        <button @click="onDelete('888')">get me</button>
        <p>
          <strong>Username:</strong>
          <!-- {{ loggedInUser.username }} -->
        </p>
        <p>
          <strong>Email:</strong>
          <!-- {{ loggedInUser.email }} -->
        </p>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters, mapState, mapActions } from "vuex";

export default {
  computed: {
    ...mapGetters({
      GET_LIST_USER: "MODULE_USER/GET_LIST_USER"
    }),
    ...mapState({
      stateListUser: state => state.MODULE_USER.listuser
    })
  },
  mounted() {
    this.listUser = this.stateListUser;
    this.$nextTick(() => {
      this.$nuxt.$loading.start();
      setTimeout(() => this.$nuxt.$loading.finish(), 1000);
    });
  },
  methods: {
    ...mapActions({
      ACTION_DELETE_USER: "MODULE_USER/ACTION_DELETE_USER",
      ACTION_SET_FORM_EDIT: "MODULE_USER/ACTION_SET_FORM_EDIT"
    }),
    onDelete(param) {
      this.ACTION_DELETE_USER(param);
    },
    getMe() {
      this.$store.dispatch("MODULE_AUTH/GET_ME", "aaa");
    }
  }
};
</script>
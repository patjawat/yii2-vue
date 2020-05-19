<template>
  <section class="section">
<div class="row mt-5">
<div class="col-6 offset-md-3">
    <div class="card bg-dark shadow-lg">
      <div class="card-header">
        Authentication
      </div>
      <div class="card-body">
          <h2 class="title has-text-centered">Welcome back!</h2>
          <Notification :message="error" v-if="error"/>
          <form method="post" @submit.prevent="login">
            <div class="field">
              <label class="label">username</label>
              <div class="control">
                <input
                  type="username"
                  class="form-control"
                  name="username"
                  v-model="username"
                >
              </div>
            </div>
            <div class="field">
              <label class="label">Password</label>
              <div class="control">
                <input
                  type="password"
                  class="form-control"
                  name="password"
                  v-model="password"
                >
              </div>
            </div>
            <div class="control">
              <button type="submit" class="btn btn-primary">Log In</button>
            </div>
          </form>
          <div class="has-text-centered" style="margin-top: 20px">
            <p>
              Don't have an account? <nuxt-link to="/register">Register</nuxt-link>
            </p>
    </div>
      </div>
      <div class="card-footer text-muted">
        Footer
      </div>
    </div>
        </div>
    </div>
  </section>
</template>

<script>
import Notification from '~/components/Notification'
export default {
  layout:'blank',
   middleware: 'guest',
  components: {
    Notification,
  },

  data() {
    return {
      username: '',
      password: '',
      error: null
    }
  },

  methods: {
    async login() {
      try {
        await this.$auth.loginWith('local', {
          data: {
            username: this.username,
            password: this.password
          }
        }) 
      } catch (e) {
        this.error = e.response.data.message
        this.$toast.error(e.response.data.message)
      }
    }
  }
}
</script>
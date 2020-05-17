<template>
  <div>
    <form @submit.prevent="userLogin">
      <div>
        <label>Username</label>
        <input type="text" v-model="form.username" />
      </div>
      <div>
        <label>Password</label>
        <input type="text" v-model="form.password" />
      </div>
      <div>
        <button type="submit">Submit</button>
      </div>
    </form>
    {{JSON.stringify(form)}}
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        username: '',
        password: ''
      }
    }
  },
  methods: {
    async userLogin() {
      try {
        // let response = await this.$auth.loginWith('local',JSON.stringify(this.login))
        // console.log(response)
        let response = await this.$auth.loginWith('local', {
        data: {
          username : this.form.username,
          password : this.form.password
        }
      })
      } catch (err) {
        console.log(err)
      }
    }
  }
}
</script>
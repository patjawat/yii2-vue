<template>
  <div class="wrapper">
    <Navbar/>
    <Sidebar />
    <div class="content-wrapper" style="min-height: 1589.56px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Blank Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Blank Page</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
<nuxt/>
    </section>
    <!-- /.content -->
  </div>
    

  </div>
</template>

<script>
import Navbar from '~/components/adminlte/Navbar'
import Sidebar from '~/components/adminlte/Sidebar'
import Loading from '~/components/Loading'

export default {
    components: {
    Navbar,Sidebar,Loading
  },
  mounted () {
    console.log('loading Layout')
  },
    data: () => ({
    loading: false
  }),
    methods: {
    start () {
      this.loading = true
    },
    finish () {
      this.loading = false
    }
  }
}
</script>
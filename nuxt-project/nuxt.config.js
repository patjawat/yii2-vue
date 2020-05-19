export default {
  mode: "universal",
  /*
   ** Headers of the page
   */
  head: {
    title: process.env.npm_package_name || "",
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      {
        hid: "description",
        name: "description",
        content: process.env.npm_package_description || ""
      }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
      { rel: 'stylesheet', href: '/plugins/fontawesome-free/css/all.min.css' },
      { rel: 'stylesheet', href: '/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css' },
      { rel: 'stylesheet', href: '/plugins/icheck-bootstrap/icheck-bootstrap.min.css' },
      { rel: 'stylesheet', href: '/plugins/jqvmap/jqvmap.min.css' },
      { rel: 'stylesheet', href: '/dist/css/adminlte.min.css' },
      { rel: 'stylesheet', href: '/plugins/overlayScrollbars/css/OverlayScrollbars.min.css' },
      { rel: 'stylesheet', href: '/plugins/daterangepicker/daterangepicker.css' },
      { rel: 'stylesheet', href: '/plugins/summernote/summernote-bs4.css' },
      { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700' }
    ],
    script: [
      { src: '/plugins/jquery/jquery.min.js', body: true },
      { src: '/plugins/jquery-ui/jquery-ui.min.js', body: true },
      { src: '/plugins/bootstrap/js/bootstrap.bundle.min.js', body: true },
      { src: '/plugins/chart.js/Chart.min.js', body: true },
      { src: '/plugins/sparklines/sparkline.js', body: true },
      { src: '/plugins/jqvmap/jquery.vmap.min.js', body: true },
      { src: '/plugins/jqvmap/maps/jquery.vmap.usa.js', body: true },
      { src: '/plugins/jquery-knob/jquery.knob.min.js', body: true },
      { src: '/plugins/moment/moment.min.js', body: true },
      { src: '/plugins/daterangepicker/daterangepicker.js', body: true },
      { src: '/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js', body: true },
      { src: '/plugins/summernote/summernote-bs4.min.js', body: true },
      { src: '/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js', body: true },
      { src: '/dist/js/adminlte.js', body: true }
    ],
    bodyAttrs: {
      class: 'hold-transition sidebar-mini layout-fixed'
    },
    },
  /*
   ** Customize the progress-bar color
   */
  // loading: { color: "#009688" },
  loading: '~/components/loading.vue',
  /*
   ** Global CSS
   */
  css: [],
  /*
   ** Plugins to load before mounting the App
   */
  plugins: [],
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: [],
  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://bootstrap-vue.js.org
    "bootstrap-vue/nuxt",
    // Doc: https://axios.nuxtjs.org/usage
    "@nuxt/http",
    "@nuxtjs/axios",
    "@nuxtjs/auth",
    "@nuxtjs/pwa",
    // Doc: https://github.com/nuxt-community/dotenv-module
    "@nuxtjs/dotenv",
    '@nuxtjs/toast',
    // '@nuxtjs/browserconfig',
    ['@nuxtjs/browserconfig', { TileColor: '#f44336' }],
  ],
  /*
   ** Axios module configuration
   ** See https://axios.nuxtjs.org/options
   */
  axios: {
    baseURL: 'http://127.0.0.1:81/api'
  },
  /*
   ** Build configuration
   */
  router: {
    middleware: ['auth']
  },
  auth: {
    redirect: {
      login: '/login',
      logout: '/login',
      callback: '/login',
      home: '/'
    },
    strategies: {
      local: {
        endpoints: {
          login: { url: 'user/login', method: 'post', propertyName: 'token' },
          user: { url: "/user/me", method: "post", propertyName: 'data' },
          user:false,
          logout: false
        },
        tokenRequired: true,
        tokenType:'Bearer'
      }
    }
  },
  toast: {
    position: 'top-right',
    register: [ // Register custom toasts
      {
        name: 'my-error',
        message: 'Oops...Something went wrong',
        options: {
          type: 'error'
        }
      }
    ]
},
  build: {
    /*
     ** You can extend webpack config here
     */
    extend(config, ctx) {}
  }
};

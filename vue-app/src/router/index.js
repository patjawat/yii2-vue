import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import DefaultLayout from '../layouts/DefaultLayout.vue'
import AuthLayout from '../layouts/AuthLayout.vue'
import Login from '../views/Login'
import Register from '../views/Register'
Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Default',
    redirect: '/home',
    component: DefaultLayout,
    children : [{
      path:'/home',
      name:'home',
      component: Home
    }]
  },
  {
    path: '/auth',
    name: 'Auth',
    component: AuthLayout,
    children: [
      {
        path: 'login',
        name: 'login',
        component: Login
      },
      {
        path: 'register',
        name: 'register',
        component: Register
      }
    ]
  },
  {
    path: '/login',
    redirect: '/auth/login'
  },
  {
    path: '/register',
    redirect: '/auth/register'
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/note',
    name: 'Note',
    component: () => import('../views/Note.vue')
  },
  {
    path: '/register',
    name: 'Note',
    component: () => import('../views/Register.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

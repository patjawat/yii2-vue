<template>
    <div>
        <Nabvar />
        <h1>DefaultLayout</h1>
 <router-view/>
    </div>
</template>

<script>
import Nabvar from "./Nabvar"
    export default {
        components:{
            Nabvar
        }
    }
</script>

<style lang="scss" scoped>

</style>
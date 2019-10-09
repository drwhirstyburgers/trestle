<template>
    <div class="container-fluid">
        <div class='row'>
            <div class='col-xl'>
                <courseform />
            </div>
        </div>
    </div>
</template>

<script>
import courseform from './courseform'

export default {
    data () {
        return {

        }
    },
    components: { courseform }
}
</script>

<style scoped>
.container-fluid {
    margin-top: 40px;
}
</style>
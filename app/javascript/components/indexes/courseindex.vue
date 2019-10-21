<template>
<div class="container-fluid">
    <div class="row">
        <div v-if="courses.length > 0" v-for="course in courses" v-bind:course="course" v-bind:key="course.key" class="col-md-4">
            <coursecard :ic="course" />
        </div>
        <div v-else>
            <h4>There are currently no courses! Come back soon!</h4>
        </div>
    </div>
</div>
</template>

<script>
import coursecard from './coursecard'

export default {
    data () {
        return {
            courses: this.c
        }
    },
    props: ['c'],
    components: {coursecard}
}
</script>

<style scoped>
.container-fluid {
    margin-top: 40px;
}
</style>
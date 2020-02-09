<template>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div v-if="courses.length > 0" class="col-lg-10">
            <div class="row">
                <div v-for="course in courses" v-bind:course="course" v-bind:key="course.key" class="col-md-4 d-flex align-items-stretch">
                    <coursecard :ic="course"/>
                </div>
            </div>
        </div>
        <div v-else cclass="col-lg-10">
        <div>
            <h4>There are currently no courses! Come back soon!</h4>
        </div>
        </div>
        <div class="col-lg-1">
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
.col-md-4 {
    max-width: 100%;
}
</style>
<template>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div v-if="courses.length > 0" class="col-lg-10">
            <div class="row">
                <coursecard v-on:archived="removeCourse" v-for="ic in courses" v-bind:ic="ic" v-bind:key="ic.key" />
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
    components: {coursecard},
    methods: {
        removeCourse(id){
            console.log("HERE")
            var index = this.courses.indexOf(this.courses.filter(c => c.id == id)[0])
            this.courses.splice(index, 1)
        }
    }
}
</script>

<style scoped>
.container-fluid {
    margin-top: 40px;
}
</style>
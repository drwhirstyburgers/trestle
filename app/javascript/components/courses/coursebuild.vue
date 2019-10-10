<template>
    <div class="container-fluid">
        <div class='row'>
            <div class='col-xl'>
                <courseform v-if="created" v-on:courseCreated="hideCourseForm" />
                <courseoverview v-if="!created" :course="course" />
            </div>
        </div>
    </div>
</template>

<script>
import courseform from './courseform'
import  courseoverview from './courseoverview'

export default {
    data () {
        return {
            created: true,
            course: {}
        }
    },
    methods: {
        hideCourseForm(data) {
            this.created = false
            this.course = data
        },
    },
    components: { courseform, courseoverview },
}
</script>

<style scoped>
.container-fluid {
    margin-top: 40px;
}
</style>
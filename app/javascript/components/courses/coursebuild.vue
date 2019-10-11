<template>
    <div class="container-fluid">
        <div class='row'>
            <div class='col-xl'>
                <courseform v-if="created" v-on:courseCreated="hideCourseForm" />
                <courseoverview v-if="courseOverviewShow" :course="course" />
                <sectionform v-on:showSection="showSectionForm" v-if='newSection' :course="course" />
            </div>
        </div>
    </div>
</template>

<script>
import courseform from './courseform'
import  courseoverview from './courseoverview'
import sectionform from './sectionform'

export default {
    data () {
        return {
            created: true,
            newSection: false,
            courseOverviewShow: false,
            course: {}
        }
    },
    methods: {
        hideCourseForm(data) {
            this.created = false
            this.courseOverviewShow = true
            this.course = data
        },
        showSectionForm() {
            console.log('show')
            this.courseOverviewShow = false
            this.newSection = true
        }
    },
    components: { courseform, courseoverview, sectionform },
}
</script>

<style scoped>
.container-fluid {
    margin-top: 40px;
}
</style>
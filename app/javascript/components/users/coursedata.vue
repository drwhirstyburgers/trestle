<template>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <ul class="nav nav-tabs">
                                <li v-for="course in courses" v-bind:section="course" v-bind:key="course.key" class="nav-item">
                                    <a v-on:click="setActiveCourse(course)" v-bind:class="'nav-link ' + ifActive(course)">{{ course.title }}</a>
                               </li>
                            </ul>
                            <div class="progress-bar" role="progressbar" v-bind:style="{ width: progress.wysb + '%'}" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                Where they should be {{ progress.wysb }}%
                            </div>
                            <br>
                            <div class="progress-bar" role="progressbar" v-bind:style="{ width: progress.wya + '%'}" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                Where they are {{ progress.wya }}%
                            </div>
                            <hr>
                            <ul class="nav nav-tabs">
                                <li v-for="section in sections" v-bind:section="section" v-bind:key="section.key" class="nav-item">
                                    <a v-on:click="setActiveSection(section)" v-bind:class="'nav-link ' + ifActiveSection(section)">{{ section.section.name }}</a>
                               </li>
                            </ul>
                            <br>
                            <progressgraphs :section="this.activeSection" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import progressgraphs from '../clientfacing/dash/progressgraphs'

export default {
    data(){
        return{
            courses: null,
            userCourses: null,
            activeCourse: {},
            progress: {},
            sections: [],
            activeSection: {}
        }
    },
    props: ['user'],
    components: {
        progressgraphs
    },
    mounted(){
        this.getCourseData()
    },
    methods: {
        getCourseData(){
            $.ajax({
                type: 'get',
                url: '/get_user_show_data',
                data: { id: this.user.id },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.userCourses = data.user_courses
                    this.courses = data.courses
                    this.activeCourse = data.courses[0]
                    this.getCourseProgress()
                    this.getSectionsAndCheckpoints()
                }
            })
        },
        setActiveCourse(course) {
            this.activeCourse = course
            this.getCourseProgress()
            this.getSectionsAndCheckpoints()
        },
        setActiveSection(section){
            this.activeSection = section
        },
        ifActive(course){
            if(course == this.activeCourse){
                return 'active'
            }
        },
        ifActiveSection(section){
            if(section == this.activeSection){
                return 'active'
            }
        },
        getCourseProgress(){
            $.ajax({
                type: "GET",
                url: '/get_course_progress_users',
                data: { id: this.activeCourse.id, user_id: this.user.id },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.progress = data
                }
            })
        },
        getSectionsAndCheckpoints(){
            $.ajax({
                type: 'GET',
                url: '/sections_and_checkpoints',
                data: { course_id: this.activeCourse.id, user_id: this.user.id },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.sections = data
                    this.activeSection = data[0]
                }
            })
        }
    }
}
</script>
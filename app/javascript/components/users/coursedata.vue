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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            courses: null,
            userCourses: null,
            activeCourse: {},
            progress: {}
        }
    },
    props: ['user'],
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
                }
            })
        },
        setActiveCourse(course) {
            this.activeCourse = course
            this.getCourseProgress()
        },
        ifActive(course){
            if(course == this.activeCourse){
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
        }
    }
}
</script>
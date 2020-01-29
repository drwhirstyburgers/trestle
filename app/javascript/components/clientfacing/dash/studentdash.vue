<template>
    <div>
        <div class="container-fluid">
            <div class="row header-row" id="cf-lcosd">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <div class="align-bottom">
                        <h1 class="display-3 preview">{{ user.first_name }} {{ user.last_name }}</h1>
                    </div>
                </div>
                <div class="col-md-2">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <div class="row content">
                    <div class="col-lg-3">
                        <div class="card course-panel">
                            <img src="https://i.imgur.com/6Bc2k5I.jpg" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">Courses</h5>
                                <ul class="list-group list-group-flush" v-for="course in allCourses" v-bind:course="course" v-bind:key="course.key">
                                    <li class="list-group-item">
                                        <a class="coursesLink" v-bind:href="'/courses/' + course.id">{{ course.title }}</a>
                                        <i v-on:click="makeActiveCourse(course)" class="material-icons float-right" id="activeStar" v-bind:style="isItActive(course)">star</i>
                                        <div class="mdl-tooltip" data-mdl-for="activeStar">
                                            Make this your active course
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col">
                                <h4>{{ activeCourse.title }}</h4>
                                <div class="progress-bar" role="progressbar" v-bind:style="{ width: whereYouAre + '%'}" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                    {{ whereYouAre }}%
                                </div>
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <ul class="nav nav-tabs">
                                    <li v-for="section in sections" v-bind:section="section" v-bind:key="section.key" class="nav-item">
                                        <a v-on:click="setActiveSection(section)" v-bind:class="'nav-link ' + ifActive(section)">{{ section.section.name }}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <progressgraphs v-if="onReady" :section="activeSection" />
                    </div>
                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
</template>

<script>
import progressgraphs from './progressgraphs'

export default {
    data() {
        return {
            allCourses: this.courses,
            allUserCourses: this.userCourses,
            learner: this.user,
            activeCourse: {},
            whereYouAre: 0,
            sections: [],
            activeSection: {},
            onReady: false
        }
    },
    props: ['courses', 'user', 'userCourses'],
    components: {
        progressgraphs
    },
    mounted(){
        this.getWhereYouAre()
        this.$nextTick(() => this.setActiveCourse());
    },
    updated(){
        //this.$nextTick(() => this.setActiveCourse());
    },
    methods: {
        setActiveSection(section){
            this.activeSection = section
        },
        ifActive(section) {
            if(this.activeSection == section){
                return 'active'
            }
        },
        setActiveCourse(){
            const active = this.allUserCourses.filter(c => c.active_course == true)[0]
            this.activeCourse = this.allCourses.filter(c => c.id == active.course_id)[0]
            this.getSectionsAndCheckpoints()
        },
        isItActive(course){
            let userCourse = this.allUserCourses.filter(uc => uc.course_id == course.id)
            if(userCourse[0].active_course == true){
                return "color: 	#CCCC00"
            }
        },
        makeActiveCourse(course){
            console.log("hello")
            var userCourse = this.allUserCourses.filter(uc => uc.course_id == course.id)
            if(userCourse[0].active_course == false){
                $.ajax({
                    type: "POST",
                    url: '/uc_active',
                    data: { id: userCourse[0].id },
                    error: (err) => {
                        console.log(err)
                    },
                    success: (data) => {
                        this.activeCourse = data.course
                        this.allUserCourses = data.user_course
                    }
                })
            }
        },
        getSectionsAndCheckpoints(){
            $.ajax({
                type: 'GET',
                url: '/sections_and_checkpoints',
                data: { course_id: this.activeCourse.id },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.sections = data
                    this.activeSection = data[0]
                    this.onReady = true
                }
            })
        },
        getWhereYouAre(){
            var user_id = this.allUserCourses.filter(c => c.active_course == true)[0].user_id
            $.ajax({
                type: "GET",
                url: '/where_you_are',
                data: { user_id: user_id },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.whereYouAre = data
                }
            })
        }
    }
}
</script>

<style scoped>
#cf-lcosd {
    background: rgb(34,193,195);
    background: linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(45,84,253,1) 100%);
    color: white;
    padding-left: 0px !important;
    padding-right: 0px !important;
    padding-bottom: 0 !important;
    min-height: 20vh;
    overflow: hidden;
}

.preview {
    margin-bottom: 0 !important;
    padding-bottom: 0 !important;
    margin-top: 10vh;
}
.content {
    min-height: 80vh;
}
.course-panel {
    min-height: 85%;
}
#activeStar:hover {
    cursor: pointer;
    color: #CCCC00;
}
#activeCourseTitle {
    margin-left: 25px;
    position: absolute;
}
.list-group-item{
    border-right: 0 !important;
    border-left: 0 !important;
}
</style>
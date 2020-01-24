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
                                        {{ course.title }}
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
                                <h4>{{ activeCourse.title }} - {{ whereYouAre }}% Complete</h4>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            allCourses: this.courses,
            allUserCourses: this.userCourses,
            learner: this.user,
            activeCourse: null,
            whereYouAre: 0
        }
    },
    props: ['courses', 'user', 'userCourses'],
    components: {

    },
    mounted(){
        this.setActiveCourse()
        this.getWhereYouAre()
    },
    methods: {
        setActiveCourse(){
            const active = this.allUserCourses.filter(c => c.active_course == true)[0]
            this.activeCourse = this.allCourses.filter(c => c.id == active.course_id)[0]
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
    min-height: 60%;
}
#activeStar:hover {
    cursor: pointer;
    color: #CCCC00;
}
#activeCourseTitle {
    margin-left: 25px;
    position: absolute;
}
</style>
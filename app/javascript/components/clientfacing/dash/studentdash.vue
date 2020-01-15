<template>
    <div>
        <div class="container-fluid" id="cf-lcosd">
            <div class="row header-row">
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
        <div class="container-fluid body-content">
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <div class="row content">
                        <div class="col-md-4 course-panel">
                            <div class="demo-card-square mdl-card mdl-shadow--2dp">
                                <div class="mdl-card__title mdl-card--expand">
                                    <h2 class="mdl-card__title-text">Courses</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    <div v-for="course in allCourses" v-bind:course="course" v-bind:key="course.key" class="demo-list-action mdl-list">
                                        <div class="mdl-list__item">
                                            <span class="mdl-list__item-primary-content">
                                                <i class="material-icons mdl-list__item-avatar">bookmark_border</i>
                                                <span>{{ course.title }}</span>
                                            </span>
                                            <i v-on:click="makeActiveCourse(course)" class="material-icons" id="activeStar" v-bind:style="isItActive(course)">star</i>
                                            <div class="mdl-tooltip" data-mdl-for="activeStar">
                                                Make this your active course
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                </div>
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
            activeCourse: null
        }
    },
    props: ['courses', 'user', 'userCourses'],
    components: {

    },
    methods: {
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

.align-bottom {
    height: 100%;
}

.demo-card-square.mdl-card {
    margin-top: 5%;
    width: 320px;
    min-height: 100%;
}
.demo-card-square > .mdl-card__title {
    color: #fff;
    background: linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(45,84,253,1) 100%) bottom right 15% no-repeat #46B6AC;
}
.mdl-card__title.mdl-card--expand {
    max-height: 200px !important;
}
.demo-list-action {
    width: auto;
}
.body-content{
    min-height: 80vh !important;
}
.row.content {
    min-height: 80vh !important;
}
#activeStar:hover {
    cursor: pointer;
    color: #CCCC00;
}
</style>
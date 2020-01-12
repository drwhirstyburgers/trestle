<template>
<div>
    <div class="container-fluid content-row" id="cf-lco">
        <div class="row">
            <div class="col-lg-2">
            </div>
            <div class="col-lg-8">
                <div class="row" id="info-row">
                    <div class="col-md-8">
                        <h1 class="display-4">{{ course.title }}</h1>
                        <p class="lead">{{ course.description }}</p>
                    </div>
                    <div class="col-md-4">
                        <div class="card h-100" id="course-card">
                            <div class="card-body">
                                <h6 class="card-title">{{ user.first_name }} {{ user.last_name }}</h6>
                                <p class="card-subtitle mb-2 text-muted">Accreditation: {{course.accreditation}} | Duration: {{ course.duration }} months</p>
                                <p class="card-text" id="ct"><small class="text-muted">Where you should be</small></p>
                                <div class="progress" id="pb">
                                    <div class="progress-bar" role="progressbar" v-bind:style="{ width: progress.wysb + '%'}" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                        {{ progress.wysb }}%
                                    </div>
                                </div>
                                <p class="card-text" id="ct"><small class="text-muted">Where you are</small></p>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" v-bind:style="{ width: progress.wya + '%'}" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                        {{ progress.wya }}%
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid content-row">
        <usersectionshow v-for="section in sections" v-bind:section="section" v-bind:key="section.key" />
    </div>
</div>
</template>

<script>
import usersectionshow from '../sections/usersectionshow'

export default {
    data() {
        return {
            course: this.lcourse,
            sections: this.lsections,
            user: this.learner,
            progress: null
        }
    },
    props: ['lcourse', 'lsections', 'learner'],
    components: { usersectionshow },
    mounted(){
        this.getCourseProgress()
    },
    methods: {
        getCourseProgress(){
            $.ajax({
                type: "GET",
                url: '/get_course_progress',
                data: { id: this.course.id },
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

<style scoped>
#cf-lco {
    background: rgb(34,193,195);
    background: linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(45,84,253,1) 100%);
    color: white;
    padding-left: 0px !important;
    padding-right: 0px !important;
}

.main .container-fluid {
    padding: 0 !important;
    margin: 0px 0px 0px 0px;
}

.display-4 {
    font-size: 4.5rem;
    font-weight: 300;
    line-height: 1.2;
    padding-top: 50px;
    margin-bottom: 5px !important;
}

#course-card {
    color: black;
}
#ct {
    margin-bottom: 2px;
}
#info-row {
    padding-top: 6px;
    padding-bottom: 6px;
}
#pb {
    margin-bottom: 10px;
}
</style>
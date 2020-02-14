<template>
<div class="container-fluid">
        <div class='row'>
            <div class='col-xl' id="course-over-card">
                <div class="card">
                    <div class="card-header">
                        {{newCourse.title}}
                        <div class="dropdown pull-right">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Course Menu
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <a href='/sections/new'><button class="dropdown-item" type="button">New Course Section</button></a>
                                <a v-bind:href="'/courses/'+ newCourse.id +'/edit/'"><button class="dropdown-item" type="button">Edit course</button></a>
                                <a v-if="!preview" href='/previews/new'><button class="dropdown-item" type="button">New Course Preview</button></a>
                                <a v-if="preview" v-bind:href="'/previews/' + preview.id + '/edit'" ><button class="dropdown-item" type="button">Edit Preview</button></a>
                                <a v-if="preview" v-bind:href="'/previews/' + preview.id" ><button class="dropdown-item" type="button">Show Preview</button></a>
                                <button v-if="newCourse.active == false" @click="activateCourse(course.id)" type="button" class="dropdown-item">Activate</button>
                                <button v-if="newCourse.active == true" @click="activateCourse(course.id)" type="button" class="dropdown-item">Deactivate</button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Description</h5>
                                        {{newCourse.description}}
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="card">
                                    <div class="card-body">
                                        Price: ${{newCourse.price}} <br />
                                        Duration: {{newCourse.duration}} months <br />
                                        Accreditation: {{newCourse.accreditation}} <br />
                                        Active: {{newCourse.active}} <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div v-for="section in allSections" v-bind:section="section" v-bind:key="section.key" class='row'>
                            <sectionshow :section="section" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</template>

<script>
import sectionshow from './sectionshow'

export default {
    data () {
        return {
            newCourse: this.course,
            allSections: this.sections,
            preview: null
        }
    },
    components: { sectionshow },
    props: ['course', 'sections'],
    mounted(){
        this.getCoursePreviewData()
    },
    methods: {
        showSectionForm() {
            console.log("hello")
            this.$emit('showSection')
        },
        activateCourse(id){
            $.ajax({
                method: 'POST',
                url: '/activate',
                data: { id: this.newCourse.id },
                success: (data) =>  {
                    console.log('Course (de)activated')
                    this.newCourse = data
                }
            })
        },
        getCoursePreviewData(){
            $.ajax({
                type: 'GET',
                url: '/preview_info',
                data: { id: this.course.id },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.preview = data
                }
            })
        }
    }
}
</script>

<style scoped>
.container-fluid {
    margin-top: 40px;
}

.card-header {
    background-color: #3b3a39;
    color: whitesmoke;
}
.card {
    height: 90%;
}
#course-over-card {
    margin-right: 5%;
    margin-left: 5%;
}
</style>
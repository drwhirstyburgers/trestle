<template>
<div class="container-fluid">
        <div class='row'>
            <div class='col-xl'>
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
        }
    },
    components: { sectionshow },
    props: ['course', 'sections'],
    methods: {
        showSectionForm() {
            console.log("hello")
            this.$emit('showSection')
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
</style>
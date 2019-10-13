<template>
<div class="container-fluid">
        <div class='row'>
            <div class='col-xl'>
                <div class="card">
                    <div class="card-header">
                        {{newCourse.title}}
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
                    </div>
                    <ul class="list-group list-group-flush">
                        <div class="col text-center">
                            <li class="list-group-item">
                                <a href='/sections/new'>
                                    <button type="button" class="btn btn-outline-primary">Create a new section</button>
                                </a>        
                            </li>
                        </div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
export default {
    data () {
        return {
            newCourse: this.course
        }
    },
    props: ['course'],
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
</style>
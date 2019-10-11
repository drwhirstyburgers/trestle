<template>
<div>
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
                            Price: ${{newCourse.price}}
                            Duration: {{newCourse.duration}} months
                            Accreditation: {{newCourse.accreditation}}
                            Active: {{newCourse.active}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item"><button v-on:click="showSectionForm" type="button" class="btn btn-outline-primary">Create a new course section</button></li>
        </ul>
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
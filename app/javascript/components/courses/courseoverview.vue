<template>
<div>
    <div class="card">
        <div class="card-header">
            {{newCourse.title}}
        </div>
        <div class="card-body">
            <h6 class="card-subtitle mb-2 text-muted">Price: ${{newCourse.price}}</h6>
            <h6 class="card-subtitle mb-2 text-muted">Duration: {{newCourse.duration}} months</h6>
            <h6 class="card-subtitle mb-2 text-muted">Accreditation: {{newCourse.accreditation}}</h6>
            <h6 class="card-subtitle mb-2 text-muted">Active: {{newCourse.active}}</h6>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Description</h5>
                    {{newCourse.description}}
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
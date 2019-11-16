<template>
<div class="container-fluid">
        <div class='row'>
            <div class='col-xl'>
                <div class="card">
                    <div class="card-header">
                        New Course
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="form-group">
                                <label for="title">Course Title</label>
                                <input v-model="title" type="text" class="form-control" placeholder="Title">
                            </div>
                            <div class="form-group">
                                <label for="title">Accreditation name</label>
                                <input v-model="accreditation" type="text" class="form-control" placeholder="Accreditation">
                            </div>
                            <div class="form-group">
                                <label for="price">Course price</label>
                                <input v-model="price" type="number" class="form-control" placeholder="Price">
                            </div>
                            <div class="form-group">
                                <label for="price">Course duration</label>
                                <input v-model="duration" type="number" class="form-control" placeholder="Duration">
                                <small class="form-text text-muted">
                                    In months and whole numbers.
                                </small>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Course Description</label>
                                <textarea v-model="description" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-check">
                                <input v-model="active" class="form-check-input" type="checkbox">
                                <label class="form-check-label" for="active">
                                    Course active
                                </label>
                                <small class="form-text text-muted">
                                    Makes course publicly available
                                </small>
                            </div>
                            <button v-if="!editing" v-on:click="submitCourse" type="button" class="btn btn-outline-success pull-right">Submit</button>
                            <button v-if="editing" v-on:click="updateCourse" type="button" class="btn btn-outline-success pull-right">Update</button>
                        </form>
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
            editing: false,
            title: '',
            description: '',
            price: 0,
            duration: 0,
            accreditation: '',
            active: false,
        }
    },
    props: ['course'],
    mounted() {
        this.setCourseData();
    },
    methods: {
        setCourseData(){
            if(this.course != "new"){
                this.title = this.course.title
                this.description = this.course.description
                this.price = this.course.price
                this.duration = this.course.duration
                this.accreditation = this.course.accreditation
                this.active = this.course.active
                this.editing = true
            }
        },
        submitCourse() {
            const title = this.title
            const description = this.description
            const price = this.price
            const duration = this.duration
            const accreditation = this.accreditation
            const active = this.active
            $.ajax({
                method: 'POST',
                url: '/courses',
                data: { course: { title: title, description: description, price: price, duration: duration, accreditation: accreditation, active: active } },
                success: (data) => {
                    console.log('Course created')
                }
            })
        },
        updateCourse() {
            const title = this.title
            const description = this.description
            const price = this.price
            const duration = this.duration
            const accreditation = this.accreditation
            const active = this.active
            $.ajax({
                method: 'PATCH',
                url: '/courses/'+ this.course.id,
                data: { course: { title: title, description: description, price: price, duration: duration, accreditation: accreditation, active: active } },
                success: (data) => {
                    console.log('Course created')
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
</style>
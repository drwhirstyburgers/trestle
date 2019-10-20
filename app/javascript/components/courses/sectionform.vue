<template>
<div class="container-fluid">
    <div class='row'>
        <div class='col-xl'>
            <div class="card">
                <div class="card-header">
                    Section
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group" v-if="!editing">
                            <label for="course">Section Course</label>
                            <select @change="selectCourse" class="form-control">
                                <option v-for="course in allCourses" v-bind:course="course" v-bind:key="course.key" :value="JSON.stringify(course)" >{{course.title}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="title">Section Title</label>
                            <input v-model="title" type="text" class="form-control" placeholder="Title">
                        </div>
                        <div class="form-group">
                            <label for="order-number">Order Number</label>
                            <input v-model="orderNumber" type="number" class="form-control" placeholder="order number">
                            <small class="form-text text-muted">
                                The order in which this section falls within a course
                            </small>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Estimated time to complete as percent</label>
                            <input v-model="timeToComplete" type="number" class="form-control" placeholder="Time to complete">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Section Description</label>
                            <textarea v-model="description" class="form-control" rows="3"></textarea>
                        </div>
                        <button v-if="!editing" v-on:click="submitSection" type="button" class="btn btn-outline-success pull-right">Submit</button>
                        <button v-if="editing" v-on:click="updateSection" type="button" class="btn btn-outline-success pull-right">Update</button>
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
            allCourses: this.courses,
            selectedCourse: {},
            title: '',
            orderNumber: 0,
            timeToComplete: 0,
            description: '',
        }
    },
    props: ['courses', 'section'],
    mounted() {
        this.setSectionOnEdit()
        this.setDefaultCourse()
    },
    methods: {
        setSectionOnEdit(){
            if(this.section !== undefined){
                this.title = this.section.name
                this.description = this.section.description
                this.orderNumber = this.section.order_number
                this.timeToComplete = this.section.time_to_complete
                this.selectedCourse = this.allCourses.filter(course => {
                    return course.id === this.section.course_id
                })[0]
                this.editing = true
            }
        },
        setDefaultCourse(){
            this.selectedCourse = this.allCourses[0]
        },
        selectCourse(evt){
            this.selectedCourse = JSON.parse(evt.target.value)
        },
        submitSection() {
            $.ajax({
                method: 'POST',
                url: '/sections',
                data: { section: { course_id: this.selectedCourse.id, description: this.description, name: this.title, time_to_complete: this.timeToComplete, order_number: this.orderNumber } },
                success: (data) => {
                    console.log(data)
                }
            })
        },
        updateSection() {
            $.ajax({
                method: 'PATCH',
                url: '/sections/'+ this.section.id,
                data: { section: { course_id: this.selectedCourse.id, description: this.description, name: this.title, time_to_complete: this.timeToComplete, order_number: this.orderNumber } },
                success: (data) => {
                    console.log(data)
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
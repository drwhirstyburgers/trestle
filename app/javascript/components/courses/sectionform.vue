<template>
<div class="container-fluid">
    <div class='row'>
        <div class='col-xl'>
            <div class="card">
                <div class="card-header">
                    New Section
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
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
                        <button v-on:click="submitSection" type="button" class="btn btn-outline-success pull-right">Submit</button>
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
            allCourses: this.courses,
            selectedCourse: {},
            title: '',
            orderNumber: 0,
            timeToComplete: 0,
        }
    },
    props: ['courses'],
    methods: {
        selectCourse(evt){
            this.selectedCourse = JSON.parse(evt.target.value)
        },
        submitSection() {
            $.ajax({
                method: 'POST',
                url: '/sections',
                data: { section: { course_id: this.selectedCourse.id, name: this.title, time_to_complete: this.timeToComplete, order_number: this.orderNumber } },
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
</style>
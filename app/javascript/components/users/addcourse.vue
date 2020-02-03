<template>
    <div class="row">
        <div class="col-lg-9">
            <v-select v-model="selectedCourse" :options="courses.map(c => `${c.id} - ${c.title}`)" placeholder="Add a course to a user"></v-select>
        </div>
        <div class="col-lg-3">
            <button v-on:click="addCourse" type="button" class="btn btn-outline-success">Add Course</button>
            <makeadmin v-on:useradmin="passToParent" :user="user" />
        </div>
    </div>
</template>

<script>
import makeadmin from './makeadmin'

export default {
    data(){
        return{
            courses: [],
            selectedCourse: null
        }
    },
    props: ['user'],
    components: {
        makeadmin
    },
    mounted(){
        this.getCourses()
    },
    methods: {
        getCourses(){
            $.ajax({
                type: 'GET',
                url: '/get_courses',
                error: (error) => {
                    console.log(err)
                },
                success: (data) => {
                    this.courses = data
                }
            })
        },
        ajaxNewUserCourse(){
            var course_id = this.selectedCourse.split(' ')[0]
            $.ajax({
                type: "POST",
                url: '/admin_add_course',
                data: { id: course_id, user_id: this.user.id },
                error: (err) => {
                    this.$swal({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Something went wrong!',
                        showConfirmButton: true,
                        footer: 'The user is likely already enrolled in this course!'
                    })
                },
                success: (data) => {
                    console.log(data)
                }
            })
        },
        addCourse(){
            if(this.selectedCourse){
                this.$swal({
                    icon: 'warning',
                    title: 'Are you sure?',
                    text: 'The user will not pay for the course!',
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, add it!',
                    showCancelButton: true
                }).then((result) => {
                    if(result.value) {
                        this.ajaxNewUserCourse()
                    }
                })
            }
        },
        passToParent(){
            this.$emit('madeadmin')
        }
    }
}
</script>
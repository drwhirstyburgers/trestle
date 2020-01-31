<template>
    <div class="row">
        <div class="col">
            <v-select v-model="selectedCourse" :options="courses.map(c => `${c.id} - ${c.title}`)" placeholder="Add a course to a user"></v-select>
            <br>
            <button v-on:click="addCourse" type="button" class="btn btn-outline-success float-right">Add</button>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            courses: [],
            selectedCourse: null
        }
    },
    props: ['user'],
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
                    console.log(err)
                },
                success: (data) => {
                    this.$swal({
                        icon: 'success',
                        title: 'The course has been added',
                        showConfirmButton: true,
                    })
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
        }
    }
}
</script>
<template>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="bar">
        <a class="navbar-brand" href="/">
            Trestle
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" v-on:click="signOut">Log out</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Courses
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a v-for="course in courses" v-bind:course="course" v-bind:key="course.key" class="dropdown-item" v-bind:href='"/courses/" + course.id'>{{ course.title }}</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/courses">Enroll in a new course</a>
                </div>
            </li>
            </ul>
        </div>
        <span class="navbar-text">
            <a href="/users/edit">{{ user.first_name }} {{ user.last_name }}</a>
        </span>
    </nav>
</template>

<script>
export default {
    data(){
        return {
            courses: this.user_courses,
            user: this.current_user
        }
    },
    props: ['user_courses', 'current_user'],
    methods: {
        signOut(){
            $.ajax({
                type: "DELETE",
                url: '/sign_out_user',
            })
        }
    }
}
</script>

<style scoped>
#bar {

}
</style>
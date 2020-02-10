<template>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top" id="bar">
        <a class="navbar-brand" href="/">
            <img src="https://trestleapp.s3.us-east-2.amazonaws.com/Trestle+LOGO.png" width="30" height="30" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li v-if="course" class="nav-item">
                    <a class="nav-link" href="/"><font-awesome-icon :icon="['fas', 'tachometer-alt']" size="lg" /> Dashboard<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/courses"><font-awesome-icon :icon="['fas', 'cannabis']" size="lg" /> Course Catalogue</a>
                </li>
                <li v-if="course" class="nav-item">
                    <a class="nav-link" v-bind:href="'/courses/' + course.id"><font-awesome-icon :icon="['fas', 'book']" size="lg" /> {{course.title}}</a>
                </li>
            </ul>
        </div>
        <span class="navbar-text">
            <a href="/users/edit"><font-awesome-icon :icon="['fas', 'user-edit']" size="md" /> {{ user.first_name }} {{ user.last_name }}</a>&nbsp;&nbsp;
            <a v-on:click="signOut"><font-awesome-icon :icon="['fas', 'sign-out-alt']" size="lg" /> Log Out</a>
        </span>
    </nav>
</template>

<script>
export default {
    data(){
        return {
            course: this.user_courses,
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
</style>
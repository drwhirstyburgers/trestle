<template>
    <h1>{{course.title}}</h1>
</template>

<script>
export default {
    data () {
        return {
            course: this.course
        }
    },
    props: ['course'],
    methods: {

    }
}
</script>
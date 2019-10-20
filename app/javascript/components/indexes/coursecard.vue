<template>
        <div class="card">
            <a v-bind:href="'/courses/'+ course.id">
                <img class="card-img-top" src="https://video-images.vice.com/articles/5bfda70e1fc55d0007818422/lede/1543350846130-shutterstock_514414240.jpeg?crop=1xw:0.8427xh;0xw,0.0514xh&resize=700:*" alt="Card image cap">
            </a>
            <div class="card-body">
                <h5 class="card-title">{{ course.title }}</h5>
                Accreditation: {{ course.accreditation }}
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Price: {{ course.price }}</li>
                <li class="list-group-item">Duration: {{ course.duration }} months</li>
                <li class="list-group-item">Course Active: {{ course.active }}</li>
            </ul>
            <div class="card-body">
                <a v-bind:href="'/courses/'+ course.id" class="card-link">Go to course</a>
                <a v-bind:href="'/courses/'+ course.id + '/edit/'" class="card-link">Edit Course</a>
            </div>
        </div>
</template>

<script>
export default {
    data () {
        return {
            course: this.ic
        }
    },
    props: ['ic']
}
</script>
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
                <li class="list-group-item">Price: ${{ course.price }}</li>
                <li class="list-group-item">Duration: {{ course.duration }} months</li>
                <li class="list-group-item">Course Active: {{ course.active }}</li>
            </ul>
            <div class="card-body">
                <div class="btn-group d-flex justify-content-center">
                    <a v-bind:href="'/courses/'+ course.id" type="button" class="btn btn-secondary">View Course</a>
                    <a v-bind:href="'/courses/'+ course.id + '/edit/'" class="btn btn-secondary">Edit Course</a>
                    <button v-if="course.active == false" @click="activateCourse(course.id)" type="button" class="btn btn-secondary">Activate</button>
                    <button v-if="course.active == true" @click="activateCourse(course.id)" type="button" class="btn btn-secondary">Deactivate</button>
                </div>
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
    props: ['ic'],
    methods: {
        activateCourse(id){
            $.ajax({
                method: 'POST',
                url: '/activate',
                data: { id: id },
                success: (data) =>  {
                    console.log('Course (de)activated')
                    this.course = data
                }
            })
        }
    }
}
</script>

<style scoped>
.card {
    background-color: #3b3a39;
    color: whitesmoke;
}

.list-group-item {
    background-color: #3b3a39;
    color: whitesmoke;
}
</style>
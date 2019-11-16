<template>
    <div class="card mb-3" id="indexcard">
        <div class="row no-gutters">
            <div class="col-md-3">
                <img src="https://video-images.vice.com/articles/5bfda70e1fc55d0007818422/lede/1543350846130-shutterstock_514414240.jpeg?crop=1xw:0.8427xh;0xw,0.0514xh&resize=700:*" class="card-img" alt="...">
            </div>
            <div class="col-md-9">
                <div class="card-body">
                    <h4 class="card-title">{{ course.title }}</h4>
                    <p class="card-text" id="indexcardtext">
                        {{ course.description }} <br />
                    </p>
                    <h6>Accreditation: {{ course.accreditation }} || Duration: {{ course.duration }} months || Price: ${{ course.price }}</h6>
                    <button type="button" class="btn btn-outline-success float-right">Enroll</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            course: this.tcourse
        }
    },
    props: ['tcourse']
}
</script>

<style scoped>
#indexcard {
    margin-top: 30px;
}
#indexcardtext {
    font-size: 15px
}
</style>
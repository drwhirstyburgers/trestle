<template>
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <img v-bind:src="img" class="card-img-top">
                <div class="card-body">
                    <p class="card-text">{{ preview.blurb }}</p>
                    <a v-bind:href="'/previews/' + preview.id" class="btn btn-primary">More Info</a>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title display-4"><font-awesome-icon :icon="['fas', 'cannabis']" size="md" /> {{ course.title }}</h2>
                    <p class="lead">{{ course.description }}</p>
                    <hr>
                    <div class='row'>
                        <div class='col-md-1'>
                            <h3><font-awesome-icon :icon="['fas', 'book']" size="lg" /></h3>
                        </div>
                        <div class="col-md-11">
                            <h4 class="card-title">
                                Sections
                            </h4>
                            <ol v-for="section in sects" v-bind:section="section" v-bind:key="section.key">
                                <li>
                                    <h5>
                                        {{section.name}}
                                    </h5>
                                    <p>
                                        {{section.description}}
                                    </p>
                                </li>
                                <hr>
                            </ol>
                        </div>
                    </div>
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
    props: ['tcourse', 'preview', 'img', 'sects'],
    methods: {
        addCourse(id){
            var id = { course_id: id }
            $.ajax({
                type: "POST",
                url: '/add_course',
                data: id,
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    console.log(data)
                }
            })
        }
    }
}
</script>

<style scoped>
.row {
    margin-top: 3%;
}

.display-4 {
    font-size:3rem;
    font-weight: 300;
    line-height: 1.2;
}
</style>
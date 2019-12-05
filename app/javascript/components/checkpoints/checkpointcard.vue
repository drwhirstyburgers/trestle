<template>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-8" v-on:click="changerShowRest">
                    <h5 class="card-title">{{ checkpoint.order_number }}. {{ checkpoint.title }}</h5>
                    <p v-if="showRest" class="card-text">
                        Description:<br />{{ checkpoint.description }}<br /><br />
                        Time to complete: {{ checkpoint.time_to_complete }}%
                    </p>
                </div>
                <div class="col-md-4">
                    <div class="dropdown float-right">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Options
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a v-if="checkpoint.type == 'checkpoint'" class="dropdown-item" v-bind:href="'/checkpoints/' + checkpoint.id">Show</a>
                            <a v-if="checkpoint.type == 'checkpoint'" class="dropdown-item" v-bind:href="'/checkpoints/' + checkpoint.id + '/edit'">Edit</a>
                            <a v-if="checkpoint.type == 'quiz'" class="dropdown-item" v-bind:href="'/quizzes/' + checkpoint.id">Show</a>
                            <a v-if="checkpoint.type == 'quiz'" class="dropdown-item" v-bind:href="'/quizzes/' + checkpoint.id + '/edit'">Edit</a>
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
            checkpoint: this.check,
            showRest: false
        }
    },
    props: ['check'],
    methods: {
        changerShowRest(){
            if(this.showRest == false){
                this.showRest = true
            } else {
                this.showRest = false
            }
        }
    }
}
</script>

<style scoped>
.card {
    color: black;
}
.card{
    height: 80%;
    text-decoration: none;
}
.card:hover {
    background-color: lightgray;
    text-decoration: none;
    cursor: pointer;
}
</style>
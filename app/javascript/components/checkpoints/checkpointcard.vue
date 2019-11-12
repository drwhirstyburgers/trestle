<template>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    <a v-bind:href="'/checkpoints/' + checkpoint.id">
                        <h5 class="card-title">{{ checkpoint.order_number }}: {{ checkpoint.title }}</h5>
                        <p class="card-text">{{ checkpoint.description }}</p>
                    </a>
                </div>
                <div class="col-md-4">
                    <div class="dropdown float-right">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Options
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" v-bind:href="'/checkpoints/' + checkpoint.id">Show</a>
                            <a class="dropdown-item" v-bind:href="'/checkpoints/' + checkpoint.id + '/edit'">Edit</a>
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
            checkpoint: this.check
        }
    },
    props: ['check'],
    methods: {
    }
}
</script>

<style scoped>
a {
    color: black;
}
.card{
    height: 80%;
    text-decoration: none;
}
.card:hover {
    background-color: lightgray;
    text-decoration: none;
}
</style>
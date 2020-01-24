<template>
    <div class="card">
        <a v-if="check.type == 'checkpoint'" v-bind:href="'/checkpoints/' + check.id">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <h5 class="card-title">{{ check.order_number }}. {{ check.title }}<font-awesome-icon class="float-right" v-if="check.completed == true" :icon="['fas', 'check-square']" size="md"/></h5>
                        <p class="card-text">{{ check.description }}</p>
                    </div>
                </div>
            </div>
        </a>
        <a v-if="check.type == 'quiz'" v-bind:href="'/quizzes/' + checkpoint.id">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <h5 class="card-title">{{ check.order_number }}. {{ check.title }} - Quiz <font-awesome-icon class="float-right" v-if="check.completed == true" :icon="['fas', 'check-square']" size="md"/></h5>
                        <p v-if="check.score" class="card-text">Score: {{ check.score }}%</p>
                        <p class="card-text">{{ check.description }}</p>
                    </div>
                </div>
            </div>
        </a>
    </div>
</template>

<script>
export default {
    data() {
        return {
            check: this.checkpoint
        }
    },
    props: ['checkpoint']
}
</script>

<style scoped>
.card {
    margin-top: 0px !important;
    margin-bottom: 0px !important;
    text-decoration: none !important;
    height: 175px;
    overflow-y: scroll;
}

.card::-webkit-scrollbar {
  display: none;
}

.card:hover {
    background-color: lightgray;
    text-decoration: none !important;
    cursor: pointer;
}
.card-body {
    color: black !important;
}
p {
    font-size: 12px;
}
</style>
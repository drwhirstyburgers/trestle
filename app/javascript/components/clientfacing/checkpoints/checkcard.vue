<template>
    <div class="card">
        <a v-bind:href="'/checkpoints/' + checkpoint.id">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-10">
                        <h5 class="card-title">{{ check.title }}</h5>
                        <p class="card-text">{{ check.description }}</p>
                    </div>
                    <div class="col-md-2">
                        <font-awesome-icon v-if="checkpoint.order_number != 4" :icon="['fas', 'check-square']" size="lg"/>
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
}
.card:hover {
    background-color: lightgray;
    text-decoration: none !important;
    cursor: pointer;
}
.card-body {
    color: black !important;
}
</style>
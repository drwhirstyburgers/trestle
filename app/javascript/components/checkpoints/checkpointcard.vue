<template>
    <div class="card">
      <div class="card-body">
        <div class="row">
            <div class="col-sm-6">
                <h5 class="card-title">{{ checkpoint.order_number }}: {{ checkpoint.title }}</h5>
                <p class="card-text">{{ checkpoint.description}}</p>
            </div>
            <div class="col-sm-6">
                <a href="#" class="btn btn-primary float-right">Show</a>
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
    props: ['check']
}
</script>
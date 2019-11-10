<template>
<div class='col-xl'>
    <div class="card">
        <div class="card-header" style="background-color: #3b3a39;">
            {{sec.name}}
            <div class="dropdown pull-right">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Section Menu
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <a href='/modules/new'><button class="dropdown-item" type="button">New Section Module</button></a>
                    <a v-bind:href="'/sections/'+ sec.id +'/edit/'"><button class="dropdown-item" type="button">Edit Section</button></a>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Description</h5>
                            {{ sec.description }}
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            Order number: {{ sec.order_number }}<br />
                            Time to complete: {{ sec.time_to_complete }}%<br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
export default {
    data () {
        return {
            sec: this.section
        }
    },
    props: ['section']
}
</script>

<style scoped>
.card-header {
    background-color: #3b3a39;
    color: whitesmoke;
}
</style>
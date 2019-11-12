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
                    <a href='/checkpoints/new'><button class="dropdown-item" type="button">New Section Checkpoint</button></a>
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
            <h5 class="card-title">Checkpoints</h5>
            <div class="row">
                <div v-if="checkpoints.length > 0" v-for="checkpoint in checkpoints" v-bind:course="checkpoint" v-bind:key="checkpoint.key" class="col-md-4">
                    <checkpointcard :check="checkpoint" />
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import checkpointcard from '../checkpoints/checkpointcard'

export default {
    data () {
        return {
            sec: this.section,
            checkpoints: [],
        }
    },
    props: ['section'],
    components: { checkpointcard },
    mounted(){
        this.getSectionCheckpoints()
    },
    methods: {
        getSectionCheckpoints(){
            $.ajax({
                type: "GET",
                url: '/get_checkpoints',
                data: { section_id: this.section.id },
                success: (data) => {
                    this.checkpoints = data
                }
            })
        },
    }
}
</script>

<style scoped>
.card-header {
    background-color: #3b3a39;
    color: whitesmoke;
}
</style>
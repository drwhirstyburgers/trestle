<template>
    <div class="row">
        <div class="col-lg-2">
        </div>
        <div class="col-lg-8" id="ti-box">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-9 justify-content-center" id="titlebox">
                        <h1 class="display-4">{{ sect.order_number }}. {{ sect.name }}</h1>
                        <p class="lead">{{ sect.description }}</p>
                    </div>
                    <div class="col-md-3 justify-content-center" id="infobox">
                        <h1 class="display-4">Checkpoints complete: {{ numberOfCompleted }}/{{ checkpoints.length }}</h1>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">75%</div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <checkcard v-for="checkpoint in checkpoints" v-bind:checkpoint="checkpoint" v-bind:key="checkpoint.key" class="col-md-4" />
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import checkcard from '../checkpoints/checkcard'

export default {
    data() {
        return {
            sect: this.section,
            checkpoints: [],
            numberOfCompleted: 0
        }
    },
    props: ['section'],
    components: { checkcard },
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
                    this.numberOfCompleted = this.getCompletedNumber(this.checkpoints)
                }
            })
        },
        getCompletedNumber(checkpoints){
            return checkpoints.filter((c) => c.completed).length
        }
    }
}
</script>

<style scoped>
#titlebox{
    background-color: #343a40 !important;
    color: white;
}
#ti-box {
    margin-top: 30px;
}
.display-4 {
    font-size:1.5rem;
    font-weight: 300;
    line-height: 1.2;
    color: white;
}
.lead {
    font-size: 1rem;
    margin-bottom: 30px;
}
.progress {
    margin-bottom: 20%;
}
#infobox {
    background-color: darkgray;
}
.card-text {
    color: white;
}

.row.section-show {
    margin-bottom: 30px;
}
</style>
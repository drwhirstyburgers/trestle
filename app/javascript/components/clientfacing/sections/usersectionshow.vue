<template>
<div class="row">
    <div class="col-lg-2">
    </div>
    <div class="col-lg-8" id="ti-box">
        <div class="row">
            <div class="col-md-9" id="titlebox">
                <h1 class="display-4">{{ sect.order_number }}. {{ sect.name }}</h1>
                <p class="lead">{{ sect.description }}</p>
            </div>
            <div class="col-md-3" id="infobox">
                <h1 class="display-4">Checkpoints complete: 3/{{ checkpoints.length }}</h1>
                <div class="progress" id="pb">
                    <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">75%</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-2">
    </div>
</div>
</template>

<script>
export default {
    data() {
        return {
            sect: this.section,
            checkpoints: []
        }
    },
    props: ['section'],
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
#titlebox{
    background-color: #343a40 !important;
    color: white;
}
#ti-box {
    margin-top: 30px;
    height: 100px;
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
#infobox {
    background-color: darkgray;
}
.card-text {
    color: white;
}
#pb {
    margin-bottom: 20px;
}
</style>
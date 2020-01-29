<template>
    <div class="row">
        <div class="col">
            <apexchart width="80%" type="donut" :options="options" :series="series"></apexchart>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            activeSection: this.section,
            series: [],
            options: {
                labels: ["Completed Quizzes", "All Quizzes", "Completed Checkpoints", "All Checkpoints",]
            }
        }
    },
    props: ['section'],
    mounted(){
        this.setSeries();
    },
    watch: {
        section: function(){
            this.activeSection = this.section
            this.series = []
            this.setSeries()
        }
    },
    methods: {
        setSeries(){
            this.pushToSeries(this.activeSection.content.filter(q => q.completed == true && q.type == "quiz").length)
            this.pushToSeries(this.activeSection.content.filter(q => q.type == "quiz").length)
            this.pushToSeries(this.activeSection.content.filter(q => q.completed == true && q.type == "checkpoint").length)
            this.pushToSeries(this.activeSection.content.filter(q => q.type == "checkpoint").length)
        },
        pushToSeries(value){
            this.series.push(value)
        }
    }
}
</script>
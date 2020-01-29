<template>
    <div>
        <div class="row">
            <div class="col-md-10">
                <apexchart width="100%" type="donut" :options="options" :series="series"></apexchart>
            </div>
            <div class="col-md-2">
                <div class="row">
                    <div class="col" style="text-align:center;">
                        <h4 style="margin-bottom:0;">{{calculateGradeAverage()}}%</h4>
                        <h5 style="margin-top:0;">Score</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col" style="text-align:center;">
                        <h4 style="margin-bottom:0;">{{checkpointsCompleted()}}</h4>
                        <h5 style="margin-top:0;">Checkpoints Complete</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col" style="text-align:center;">
                        <h4 style="margin-bottom:0;">{{percentDone()}}%</h4>
                        <h5 style="margin-top:0;">Percent Done</h5>
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
        },
        calculateGradeAverage(){
            let total = this.activeSection.content.filter(q => q.completed == true && q.type == "quiz").length
            let sumOfScores = this.activeSection.content.filter(q => q.completed == true && q.type == "quiz").map(x => x.score).reduce((a,b) => a + b, 0)
            console.log(sumOfScores)
            return Math.round(sumOfScores / total)
        },
        checkpointsCompleted(){
            let completed = this.activeSection.content.filter(c => c.completed == true).length
            let all = this.activeSection.content.length
            return `${completed} / ${all}`
        },
        percentDone(){
            let completed = this.activeSection.content.filter(c => c.completed == true).length
            let all = this.activeSection.content.length
            return Math.round((completed / all) * 100)
        }
    }
}
</script>
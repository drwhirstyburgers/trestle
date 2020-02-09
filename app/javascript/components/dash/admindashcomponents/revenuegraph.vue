<template>
    <div id="chart">
        <apexchart type="line" height="500" :options="chartOptions" :series="series"></apexchart>
    </div>
</template>

<script>
export default {
    data(){
        return{
            series: [
            {
              name: "Guests",
              data: this.graphs.guests
            },
            {
              name: "Students",
              data: this.graphs.students
            }
          ],
          chartOptions: {
            chart: {
              height: 350,
              type: 'line',
              dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
              },
              toolbar: {
                show: false
              }
            },
            colors: ['#77B6EA', '#545454'],
            dataLabels: {
              enabled: true,
            },
            stroke: {
              curve: 'smooth'
            },
            title: {
              text: 'Users over time',
              align: 'left'
            },
            grid: {
              borderColor: '#e7e7e7',
              row: {
                colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                opacity: 0.5
              },
            },
            markers: {
              size: 1
            },
            xaxis: {
              categories: this.graphs.months,
              title: {
                text: 'Month'
              }
            },
            yaxis: {
              title: {
                text: 'New Users'
              },
              min: 0,
              max: 20
            },
            legend: {
              position: 'top',
              horizontalAlign: 'right',
              floating: true,
              offsetY: -25,
              offsetX: -5
            }
          },
        }
    },
    props: ['graphs'],
    mounted(){
        // this.getGraphData()
        // this.setMinMax()
    },
    methods: {
        getGraphData(){
            $.ajax({
                type: 'GET',
                url: '/get_admin_dash_graph_data',
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.series[0] = data.guests
                    this.series[1] = data.students
                    this.chartOptions.xaxis.categories = data.months
                }
            })
        },
        setMinMax(){

        }
    }
}
</script>
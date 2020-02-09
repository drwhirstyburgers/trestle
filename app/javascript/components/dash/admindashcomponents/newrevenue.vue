<template>
    <div class="card text-center">
        <div class="card-body">
            <h4 class="card-title">
                ${{ newRevenue }}
            </h4>
            <p class="card-text">New Revenue This Month</p>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return {
            newRevenue: 0
        }
    },
    mounted(){
        this.getMonthlyRevenue()
    },
    methods: {
        getMonthlyRevenue(){
            $.ajax({
                type: 'GET',
                url: '/get_monthly_revenue',
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.newRevenue = data
                }
            })
        }
    }
}
</script>
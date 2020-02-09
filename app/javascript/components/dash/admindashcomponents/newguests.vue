<template>
    <div class="card text-center">
        <div class="card-body">
            <h3 class="card-title">
                {{ newGuestsCount }}
            </h3>
            <p class="card-text">New Guests This Month</p>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            newGuestsCount: 0
        }
    },
    mounted(){
        this.getNewGuestsCount()
    },
    methods: {
        getNewGuestsCount(){
            $.ajax({
                type: "GET",
                url: '/get_new_guests',
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.newGuestsCount = data
                }
            })
        }
    }
}
</script>
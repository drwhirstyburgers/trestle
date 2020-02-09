<template>
    <div class="card text-center">
        <div class="card-body">
            <h3 class="card-title">
                {{ newStudentsCount }}
            </h3>
            <p class="card-text">New Students This Month</p>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return {
            newStudentsCount: 0
        }
    },
    mounted(){
        this.getNewStudents()
    },
    methods: {
        getNewStudents(){
            $.ajax({
                type: 'GET',
                url: '/new_students',
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.newStudentsCount = data
                }
            })
        }
    }
}
</script>
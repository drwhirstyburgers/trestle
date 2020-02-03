<template>
    <button v-on:click="makeAdmin" type="button" class="btn btn-outline-danger">Make Admin</button>
</template>

<script>
export default {
    data(){
        return {
            learner: this.user
        }
    },
    props: ['user'],
    methods: {
        makeAdmin(){
            if(this.learner.role == 'admin'){
                this.$swal({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'This user is already an admin',
                    showConfirmButton: true,
                })
            } else {
                this.$swal({
                    icon: 'warning',
                    title: 'Are you sure?',
                    text: 'The user will lose access to all student related views and priveleges?',
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, do it!',
                    showCancelButton: true
                }).then((result) => {
                    if(result.value) {
                        this.adminAjax()
                    }
                })
            }
        },
        adminAjax(){
            $.ajax({
                type: "POST",
                url: '/make_admin',
                data: { id: this.learner.id },
                error: (err) => {
                    this.$swal({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Something went wrong!',
                        showConfirmButton: true,
                    })
                },
                success: (data) => {
                    this.learner.role = data
                    this.$emit('useradmin')
                    this.$swal({
                        icon: 'success',
                        title: 'This user is now an admin!',
                        showConfirmButton: true,
                    })
                }
            })
        }
    }
}
</script>
<template>
    <button v-if="!markedComplete" v-on:click="updateCheckpointComplete" type="button" class="btn btn-outline-success pull-right"><font-awesome-icon :icon="['fas', 'check-double']" size="md" /> Mark Checkpoint Complete</button>
    <button v-else v-on:click="updateCheckpointComplete" type="button" class="btn btn-outline-success pull-right disabled"><font-awesome-icon :icon="['fas', 'check-double']" size="md" /> Checkpoint Completed</button>
</template>

<script>
export default {
    data() {
        return {
            markedComplete: false
        }
    },
    props: ['user', 'checkpoint'],
    mounted() {
        this.checkIfComplete()
    },
    methods: {
        updateCheckpointComplete(){
            if(this.user.role == "student"){
                $.ajax({
                    type: "POST",
                    url: '/mark_checkpoint_complete',
                    data: { user_id: this.user.id, checkpoint_id: this.checkpoint.id },
                    error: (err) => {
                        console.log(err)
                    },
                    success: (data) => {
                        this.markedComplete = true
                    }
                })
            } else {
                alert("admins cannot perform this operation")
            }
        },
        checkIfComplete(){
            $.ajax({
                type: "GET",
                url: '/check_if_complete',
                data: { user_id: this.user.id, checkpoint_id: this.checkpoint.id },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    if(data == true) {
                        this.markedComplete = true
                    }
                }
            })
        }
    }
}
</script>
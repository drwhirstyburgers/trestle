<template>
    <div class="row">
        <div class="col">
            <addcourse v-on:madeadmin="userAdmin" :user='learner' />
            <coursedata :user='learner' />
        </div>
    </div>
</template>

<script>
import addcourse from './addcourse'
import coursedata from './coursedata'

export default {
    data(){
        return {
            learner: this.user
        }
    },
    props: ['user'],
    components: {
        addcourse,
        coursedata,
    },
    methods: {
        userAdmin(){
            this.learner.role = 'admin'
        }
    }
}
</script>
<template>
    <div class="row">
        <div class="col">
            <addcourse :user='learner' />
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
        coursedata
    }
}
</script>
<template>
    <div class="row">
        <div class="col">
            <addcourse :user='learner' />
        </div>
    </div>
</template>

<script>
import addcourse from './addcourse'

export default {
    data(){
        return {
            learner: this.user
        }
    },
    props: ['user'],
    components: {
        addcourse
    }
}
</script>
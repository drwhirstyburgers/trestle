<template>
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <br>
                <newstudents />
                <br>
                <newguests />
            </div>
            <div class="col-md-10">
            </div>
        </div>
    </div>
</template>

<script>
import newstudents from './admindashcomponents/newstudents'
import newguests from './admindashcomponents/newguests'

export default {
    data() {
        return {

        }
    },
    components: {
        newstudents,
        newguests
    },
    methods: {

    }
}
</script>
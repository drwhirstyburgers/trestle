<template>
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <br>
                <newstudents />
                <br>
                <newguests />
                <br>
                <newrevenue />
            </div>
            <div class="col-md-10">
            </div>
        </div>
    </div>
</template>

<script>
import newstudents from './admindashcomponents/newstudents'
import newguests from './admindashcomponents/newguests'
import newrevenue from './admindashcomponents/newrevenue'

export default {
    data() {
        return {

        }
    },
    components: {
        newstudents,
        newguests,
        newrevenue
    },
    methods: {

    }
}
</script>
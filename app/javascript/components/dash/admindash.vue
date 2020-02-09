<template>
    <div class="container-fluid admin-dash">
        <div class="row">
            <div class='col-md-1'>
            </div>
            <div class="col-md-2">
                <br>
                <newstudents />
                <br>
                <newguests />
                <br>
                <newrevenue />
            </div>
            <div class="col-md-7">
                <br>
                <revenuegraph :graphs="graphs" />
            </div>
            <div class='col-md-1'>
            </div>
        </div>
    </div>
</template>

<script>
import newstudents from './admindashcomponents/newstudents'
import newguests from './admindashcomponents/newguests'
import newrevenue from './admindashcomponents/newrevenue'
import revenuegraph from './admindashcomponents/revenuegraph'

export default {
    data() {
        return {

        }
    },
    props: ['graphs'],
    components: {
        newstudents,
        newguests,
        newrevenue,
        revenuegraph
    },
    methods: {

    }
}
</script>

<style scoped>
.admin-dash{
    margin-top: 13vh;
}

</style>
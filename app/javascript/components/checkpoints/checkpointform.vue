<template>
<div class="container-fluid">
    <div class='row'>
        <div class='col-xl'>
            <div v-if="!checkpointCreated" class="card">
                <div class="card-header">
                    Checkpoint
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group" v-if="!editing">
                            <label for="course">Checkpoint Section</label>
                            <select @change="selectSection" class="form-control">
                                <option v-for="section in sections" v-bind:section="section" v-bind:key="section.key" :value="JSON.stringify(section)" placeholder="Pick the section that the checkpoint is associated with">{{section.name}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="title">Checkpoint Name</label>
                            <input v-model="name" type="text" class="form-control" placeholder="Title">
                        </div>
                        <div class="form-group">
                            <label for="order-number">Order Number</label>
                            <input v-model="orderNumber" type="number" class="form-control" placeholder="order number">
                            <small class="form-text text-muted">
                                The order in which this section falls within a course
                            </small>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Estimated time to complete as percent</label>
                            <input v-model="timeToComplete" type="number" class="form-control" placeholder="Time to complete">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Section Description</label>
                            <textarea v-model="description" class="form-control" rows="3"></textarea>
                        </div>
                        <button v-if="!editing" v-on:click="submitCheckpoint" type="button" class="btn btn-outline-success pull-right">Submit</button>
                        <button v-if="editing" v-on:click="updateCheckpoint" type="button" class="btn btn-outline-success pull-right">Update</button>
                    </form>
                </div>
            </div>
            <div v-if="queryModal" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import checkpointcontentform from './checkpointcontentform'

export default {
    data() {
        return {
            sections: this.sec,
            checkpoint: this.check,
            estSection: this.estSect,
            editing: false,
            section: {},
            checkpointCreated: false,
            name: '',
            orderNumber: 0,
            timeToComplete: 0,
            description: '',
            queryModal: false,
            checkpointId: null,
        }
    },
    props: ['sec', 'check'],
    components: {checkpointcontentform},
    mounted() {
        this.setCheckpoint()
        this.setDefaultSection()
    },
    methods: {
        setCheckpoint(){
            if(this.checkpoint){
                this.editing = true
                this.section = this.sections.filter((sec) => {
                    this.checkpoint.section_id === sec.id
                })[0]
                this.name = this.checkpoint.name
                this.orderNumber = this.checkpoint.order_number
                this.timeToComplete = this.checkpoint.time_to_complete
                this.description = this.checkpoint.description
            }
        },
    submitCheckpoint(){
        $.ajax({
                method: 'POST',
                url: '/checkpoints',
                data: { checkpoint: { name: this.name, description: this.description, section_id: this.section.id, order_number: this.orderNumber, time_to_complete: this.timeToComplete } },
                success: (data) => {
                    console.log('Checkpoint Created')
                    this.queryModal = true
                    this.checkpointId = data.id
                }
        })
    },
    updateCheckpoint(){

    },
    selectSection(evt){
        console.log("hello")
        this.section = JSON.parse(evt.target.value)
    },
    setDefaultSection(){
        this.section = this.sections[0]
    }
    }
}
</script>

<style scoped>
.container-fluid {
    margin-top: 40px;
}

.card-header {
    background-color: #3b3a39;
    color: whitesmoke;
}
</style>
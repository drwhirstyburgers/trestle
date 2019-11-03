<template>
<div class="container-fluid">
    <div class='row'>
        <div class='col-xl'>
            <div v-if="!checkpointCreated" v-on:contentChoice="afterChoiceMade(choice)" class="card">
                <div class="card-header">
                    Checkpoint
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group" v-if="!editing">
                            <label for="course">Checkpoint Section</label>
                            <select @change="selectSection" class="form-control">
                                <option value="" selected disabled>Please Select</option>
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
                            <label for="exampleFormControlTextarea1">Checkpoint Description</label>
                            <textarea v-model="description" class="form-control" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Content</label>
                            <input id="contentTrix" type="hidden" name="content">
                            <trix-editor input="contentTrix"></trix-editor>
                        </div>
                        <button v-if="!editing" v-on:click="submitCheckpoint" type="button" class="btn btn-outline-success pull-right">Submit</button>
                        <button v-if="editing" v-on:click="updateCheckpoint" type="button" class="btn btn-outline-success pull-right">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import textcontentform from './textcontentform'
import checkpointmodal from './checkpointmodal'

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
            content: null,
        }
    },
    props: ['sec', 'check'],
    components: {textcontentform, checkpointmodal},
    mounted() {
        this.setCheckpoint()
    },
    methods: {
        setCheckpoint(){
            if(this.checkpoint.id != null){
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
            var element = document.querySelector("trix-editor")
            var trixContent = element.value
            this.content = trixContent
            $.ajax({
                    method: 'POST',
                    url: '/checkpoints',
                    data: { checkpoint: { title: this.name, description: this.description, section_id: this.section.id, order_number: this.orderNumber, time_to_complete: this.timeToComplete, content: this.content } },
                    success: (data) => {
                        console.log('Checkpoint Created')
                        this.queryModal = true
                        this.checkpointId = data.id
                    }
            })
        },
        updateCheckpoint(){
            $.ajax({
                method: 'PATCH',
                url: '/checkpoints/'+ this.checkpoint.id,
                data: { checkpoint: { name: this.name, description: this.description, section_id: this.section.id, order_number: this.orderNumber, time_to_complete: this.timeToComplete } },
                success: (data) => {
                    console.log('Checkpoint updated')
                    this.checkpointId = data.id
                }
            })
        },
        selectSection(evt){
            console.log("hello")
            this.section = JSON.parse(evt.target.value)
        },
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

trix-editor {
    min-height: 500px;
}
</style>
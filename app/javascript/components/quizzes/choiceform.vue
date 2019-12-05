<template>
<div class="container-fluid">
    <div class='row'>
        <div class='col-xl'>
            <div class="card section form">
                <div class="card-header">
                    Choices
                </div>
                <div class="card-body">
                    <form>
                        <label for="course">Question</label>
                        <select @change="selectQuestion" class="form-control">
                            <option value="" selected disabled>Please Select</option>
                            <option v-for="question in questions" v-bind:question="question" v-bind:key="question.key" :value="JSON.stringify(question)" >{{ question.question }}</option>
                        </select>
                        <hr>
                        <div v-if="choices.length > 0" class="card">
                            <div class="card-body">
                                <div v-for="choice in choices" v-bind:choice="choice" v-bind:key="choice.key">
                                    <h5 class="card-title" v-on:click="isEditing = true">
                                        {{ choice.order_number }}. {{ choice.option }} || 
                                        <font-awesome-icon v-if="choice.correct_choice == true" :icon="['fas', 'check-square']" :size="md" />
                                        <font-awesome-icon v-else :icon="['fa', 'times']" size="md"/>
                                    </h5>
                                    <form v-if="isEditing">
                                        <div class="form-group">
                                            <label for="choice">Choice</label>
                                            <input v-model="choice.option" type="text" class="form-control" placeholder="Title">
                                        </div>
                                        <div class="form-group">
                                            <label for="title">Order number</label>
                                            <input v-model="choice.order_number" type="number" class="form-control" placeholder="Order number">
                                        </div>
                                        <div v-if="!choiceMade" class="form-check">
                                            <input v-model="choice.correct_choice" class="form-check-input" type="checkbox" value="">
                                            <label class="form-check-label">
                                                Correct choice?
                                            </label>
                                        </div>
                                        <button v-on:click="editChoice(choice)" type="button" class="btn btn-outline-success">Save</button>
                                    </form>
                                </div>
                                <button v-on:click="submitChoices" type="button" class="btn btn-outline-success pull-right">Submit Choices</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="choice">Choice</label>
                            <input v-model="option" type="text" class="form-control" placeholder="Title">
                        </div>
                        <div class="form-group">
                            <label for="title">Order number</label>
                            <input v-model="order_number" type="number" class="form-control" placeholder="Order number">
                        </div>
                        <div v-if="!choiceMade" class="form-check">
                            <input v-model="correct_choice" class="form-check-input" type="checkbox" value="">
                            <label class="form-check-label">
                                Correct choice?
                            </label>
                        </div>
                        <button v-on:click="addChoice" type="button" class="btn btn-outline-success pull-right">Add</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
export default {
    data() {
        return {
            questions: this.quests,
            question: {},
            choices: [],
            option: '',
            order_number: 0,
            correct_choice: false,
            choiceMade: false,
            isEditing: false
        }
    },
    props: ['quests'],
    methods: {
        selectQuestion(evt){
            this.question = JSON.parse(evt.target.value)
        },
        addChoice(){
            var choice = {
                option: this.option,
                order_number: this.order_number,
                correct_choice: this.correct_choice
            }
            if(choice.correct_choice == true){
                this.choiceMade = true
            }
            if(choice.option != '' && choice.order_number != 0){
                this.choices.push(choice)
                this.option = ''
                this.order_number = 0
                this.correct_choice = false
            }
        },
        editChoice(choice){
            if(choice.correct_choice == true){
                this.choiceMade = true
            }
            this.isEditing = false
        },
        submitChoices(){
            console.log('clicked')
        }
    }
}
</script>

<style scoped>
.card.section.form {
    margin-left: 30px;
    margin-right: 30px;
}
.container-fluid {
    margin-top: 40px;
}
.card-header {
    background-color: #3b3a39;
    color: whitesmoke;
}
</style>
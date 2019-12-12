<template>
<div class="container-fluid">
    <div class='row'>
        <div class='col-xl'>
            <div class="card section form">
                <div class="card-header">
                    Choices
                </div>
                <div class="card-body">
                    <form
                        <label for="course">Question</label>
                        <select @change="selectQuestion" class="form-control">
                            <option value="" selected disabled>Please Select</option>
                            <option v-for="question in questions" v-bind:question="question" v-bind:key="question.key" :value="JSON.stringify(question)" >{{ question.question }}</option>
                        </select>
                    </form>
                        <hr>
                        <div v-if="choices.length > 0" class="card">
                            <div class="card-body">
                                <div v-for="(choice, index) in choices" v-bind:choice="choice" v-bind:key="choice.key">
                                    <h5 class="card-title" v-on:click="updateEditing(index)">
                                        {{ choice.order_number }}. {{ choice.option }} || 
                                        <font-awesome-icon v-if="choice.correct_choice == true" :icon="['fas', 'check-square']" />
                                        <font-awesome-icon v-else :icon="['fa', 'times']" />
                                    </h5>
                                    <font-awesome-icon v-if="isEditing.editing == true && index == isEditing.index" v-on:click="editChoice(choice)" :icon="['fas', 'check-square']" size='lg' class="done float-right" />
                                    <form v-if="isEditing.editing == true && index == isEditing.index">
                                        <div class="form-group">
                                            <label for="choice">Choice </label>
                                            <input v-model="choice.option" type="text" class="form-control" placeholder="Title">
                                        </div>
                                        <div class="form-group">
                                            <label for="title">Order number</label>
                                            <input v-model="choice.order_number" type="number" class="form-control" placeholder="Order number">
                                        </div>
                                        <div class="form-check">
                                            <input v-model="choice.correct_choice" class="form-check-input" type="checkbox" value="">
                                            <label class="form-check-label">
                                                Correct choice?
                                            </label>
                                        </div>
                                        <br>
                                    </form>
                                </div>
                                <button v-on:click="submitChoices" type="button" class="btn btn-outline-success pull-right">Submit Choices</button>
                            </div>
                        </div>
                    <form>
                        <div v-on:submit="addChoice"class="form-group">
                            <label for="choice">Choice</label>
                            <input v-model="option" type="text" class="form-control" placeholder="Title">
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
            isEditing: { editing: false, index: -1 }
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
                order_number: this.choices.length + 1,
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
            this.isEditing.editing = false
            this.isEditing.index = -1
            this.choices.sort((a,b) => Number(a.order_number) - Number(b.order_number))
        },
        updateEditing(index) {
            this.isEditing.editing = true
            this.isEditing.index = index
        },
        submitChoices(){
            if(this.choices.length != 0 && this.question != {} && this.question != null && this.question != undefined){
                var allChoices = JSON.stringify(this.choices)
                $.ajax({
                    type: "POST",
                    url: '/submit_choices',
                    data: { question_id: this.question.id, choices: allChoices },
                    error: (err) => {
                        console.log(err)
                    },
                    success: (data) => {
                        console.log(data)
                    }
                })
            }
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
h5:hover {
    cursor: pointer;
}
.done:hover{
    cursor: pointer;
}
</style>
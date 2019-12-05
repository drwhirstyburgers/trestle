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
                        <div v-if="choices.length > 0" v-for="choice in choices" v-bind:choice="choice" v-bind:key="choice.key" class="card">
                            <div class="card-body">
                                <h5 class="card-title">{{ choice.order_number }}. {{ choice.option }} || <font-awesome-icon v-if="choice.correct_choice == true" :icon="['fas', 'check-square']" size="lg"/></h5>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label for="choice">Choice</label>
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
                        <button v-on:click="addChoice(choice)" type="button" class="btn btn-outline-success pull-right">Add</button>
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
            choice: {
                option: '',
                order_number: 1,
                correct_choice: false
            }

        }
    },
    props: ['quests'],
    methods: {
        selectQuestion(evt){
            this.question = JSON.parse(evt.target.value)
        },
        addChoice(choice){
            this.choices.push(choice)
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
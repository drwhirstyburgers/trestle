<template>
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10" id="middle">
            <div class="row" id="button-row">
                <div class="col-md-6">
                    <a v-bind:src="'/courses/' + course.id"><< {{course.title}}</a>
                </div>
                <div class="col-md-6">
                    <div class="float-right">
                        <% if @next_checkpoint.present? %>
                            <%= link_to "Next Checkpoint >>", checkpoint_path(@next_checkpoint) %>
                        <% else %>
                            Last Checkpoint of section
                        <% end %>
                    </div>
                </div>
            </div>
            <div class="jumbotron">
                <h1 class="display-4">{{ quiz.title }}</h1>
                <p class="lead">{{ section.name }}</p>
                <hr class="my-4">
                <p>{{ quiz.description }}</p>
            </div>
            <div v-for="question in questions" v-bind:question="question" v-bind:key="question.key" class="card" id="show-card">
                <div class="card-body">
                    <h5 class="card-title">{{ question.number }}. {{ question.question }}</h5>
                    <div class="quiz-card">
                        <img v-if="question.image != '' || question.image != null" v-bind:src="question.image">
                    </div>
                    <ul class="list-group list-group-flush">
                        <li v-for="choice in question.choices" v-bind:choice="choice" v-bind:key="choice.key" class="list-group-item">
                            <div class="form-check">
                                <input v-on:click="addSelection(choice, question)" class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                <label class="form-check-label" for="exampleRadios1">
                                    {{ choice.choice_number }}. {{ choice.choice }}
                                </label>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-1">
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            quiz: this.comp_quiz.quiz,
            questions: this.comp_quiz.questions,
            selections: []
        }
    },
    props: ['comp_quiz', 'course', 'section'],
    methods: {
        addSelection(choice, question){
            if(this.checkSelections(question.number)){
                this.selections.forEach(s => {
                    if(s.question == question.number){
                        s.selection = choice.choice_number
                    }
                })
            } else {
                let newSelection = {
                    selection: choice.choice_number,
                    question: question.number
                }
                this.selections.push(newSelection)
            }
        },
        checkSelections(question){
            if(this.selections.filter(s => s.question == question).length == 1){
                return true
            } else {
                return false
            }
        }
    }
}
</script>

<style scoped>
.quiz-card {
    text-align: center;
}
img {
    width: 500px;
}
.list-group-item {
    font-size: 15px;
}
</style>
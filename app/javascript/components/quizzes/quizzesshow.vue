<template>
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10" id="middle">
            <div class="row" id="button-row">
                <div class="col-md-6">
                    <a v-bind:href="'/courses/' + course.id"><< {{course.title}}</a>
                </div>
            </div>
            <div class="jumbotron">
                <h1 class="display-4">{{ quiz.title }}</h1>
                <p class="lead">{{ section.name }}</p>
                <hr class="my-4">
                <p>{{ quiz.description }}</p>
                <a v-if="user.role == 'admin'" v-bind:href="quiz.id + '/edit'" class="btn btn-primary">Edit Quiz</a>
            </div>
            <div v-for="question in questions" v-bind:question="question" v-bind:key="question.key" class="card" id="show-card">
                <div class="card-body">
                    <h5 class="card-title">{{ question.number }}. {{ question.question }}</h5>
                    <a v-if="user.role == 'admin'" v-bind:href="'/questions/' + question.id + '/edit'" class="btn btn-primary">Edit Question</a>
                    <div class="quiz-card">
                        <img v-if="question.image != '' || question.image != null" v-bind:src="question.image">
                    </div>
                    <ul class="list-group list-group-flush">
                        <li v-for="(choice, index) in question.choices" v-bind:choice="choice" v-bind:key="choice.key" class="list-group-item">
                            <div v-if="isEditing != index" class="form-check">
                                <input v-on:click="addSelection(choice, question)" class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                <label class="form-check-label" for="exampleRadios1">
                                    {{ choice.choice_number }}. {{ choice.choice }}
                                </label>
                                <font-awesome-icon v-if="question.correct_choice == choice.choice_number && user.role == 'admin'" :icon="['fas', 'check-square']" />
                            </div>
                            <div v-if="isEditing == index" class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">{{ choice.choice_number }}.</span>
                                </div>
                                <input v-model="choice.choice" type="text" class="form-control">
                            </div>
                            <font-awesome-icon v-on:click="editing(choice, index)" v-if="user.role == 'admin' && isEditing == index || isEditing == -1" :icon="['fa', 'edit']" class="float-right" />
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
            selections: [],
            isEditing: -1
        }
    },
    props: ['comp_quiz', 'course', 'section', 'user'],
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
        },
        editing(choice, index){
            if(this.isEditing == -1){
                this.isEditing = index
            } else {
                this.updateChoice(choice, index)
            }
        },
        updateChoice(choice, index){
            var choice = choice
            var index = index
            $.ajax({
                type: "POST",
                url: '/update_choice',
                data: { id: choice.id, choice: choice.choice },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    if(this.isEditing == index){
                        this.isEditing = -1
                    } else {
                        this.isEditing = index
                    }
                }
            })
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
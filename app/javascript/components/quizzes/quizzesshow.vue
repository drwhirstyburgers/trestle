<template>
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10" id="middle">
            <div class="row" id="button-row">
                <div class="col-sm-6">
                    <a v-bind:href="'/courses/' + course.id"><< {{course.title}}</a>
                </div>
                <div v-if="checkpoint != 'last'" class="col-sm-6">
                    <a v-if="checkpoint.is_a = 'checkpoint'" v-bind:href="'/checkpoints/' + checkpoint.id" class="float-right">Next Checkpoint >></a>
                    <a v-else v-bind:href="checkpoint.id" class="float-right">Next Checkpoint >></a>
                </div>
            </div>
            <div class="jumbotron" id="top">
                <h1 class="display-4">{{ quiz.title }}</h1>
                <p class="lead">{{ section.name }}</p><p v-if="score != null && submitted == true" class="lead">Score: {{ score }}%</p>
                <hr class="my-4">
                <p>{{ quiz.description }}</p>
                <a v-if="user.role == 'admin'" v-bind:href="quiz.id + '/edit'" class="btn btn-primary">Edit Quiz</a>
                <a v-if="user.role == 'admin'" href="/questions/new" class="btn btn-primary">New Question</a>
            </div>
            <div v-if="!submitted">
                <div v-for="question in questions" v-bind:question="question" v-bind:key="question.key" class="card" id="show-card">
                    <div class="card-body">
                        <h5 class="card-title">{{ question.number }}. {{ question.question }}</h5>
                        <a v-if="user.role == 'admin'" v-bind:href="'/questions/' + question.id + '/edit'" class="btn btn-primary">Edit Question</a>
                        <div class="quiz-card">
                            <img v-if="question.image" v-bind:src="question.image">
                            <div v-if="question.video">
                                <iframe v-bind:src="'https://www.youtube.com/embed/' + question.video"
                                width="560" height="315" frameborder="0" allowfullscreen></iframe>
                            </div>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li v-for="(choice, index) in question.choices" v-bind:choice="choice" v-bind:key="choice.key" class="list-group-item">
                                <div v-if="isEditing != index && !submitted" class="form-check">
                                    <input v-on:click="addSelection(choice, question)" class="form-check-input" type="radio">
                                    <label class="form-check-label" for="exampleRadios1">
                                        {{ choice.choice_number }}. {{ choice.choice }}
                                    </label>
                                    <font-awesome-icon v-if="question.correct_choice == choice.choice_number && user.role == 'admin'" :icon="['fas', 'check-square']" />
                                </div>
                                <div v-if="submitted">
                                    {{ choice.choice_number }}. {{ choice.choice }}
                                    <font-awesome-icon v-if="choice.choice_number == question.correct_choice" :icon="['fas', 'check-square']" class="float-right" />
                                </div> 
                                <div v-if="isEditing == index" class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">{{ choice.choice_number }}.</span>
                                    </div>
                                    <input v-model="choice.choice" type="text" class="form-control">
                                </div>
                                <font-awesome-icon v-on:click="editing(choice, index)" v-if="(user.role == 'admin' && isEditing == index) || (user.role == 'admin' && isEditing == -1)" :icon="['fa', 'edit']" class="float-right" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div v-if="submitted">
                <div v-for="question in userQuestions" v-bind:question="question" v-bind:key="question.key" class="card" id="show-card">
                    <div class="card-body">
                        <h5 class="card-title">{{ question.number }}. {{ question.question }}</h5>
                        <a v-if="user.role == 'admin'" v-bind:href="'/questions/' + question.id + '/edit'" class="btn btn-primary">Edit Question</a>
                        <div class="quiz-card">
                            <img v-if="question.image" v-bind:src="question.image">
                            <div v-if="question.video">
                                <iframe v-bind:src="'https://www.youtube.com/embed/' + question.video"
                                width="560" height="315" frameborder="0" allowfullscreen></iframe>
                            </div>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li v-for="(choice, index) in question.choices" v-bind:choice="choice" v-bind:key="choice.key" class="list-group-item">
                                <div v-if="submitted">
                                    {{ choice.choice_number }}. {{ choice.choice }}
                                    <font-awesome-icon v-if="choice.selection == true && choice.choice_number == question.correct_choice" :icon="['fas', 'check-square']" size="lg" class="float-right" />
                                    <font-awesome-icon v-if="choice.selection == true && choice.choice_number != question.correct_choice" :icon="['fa', 'times']" size="lg" class="float-right" />
                                </div> 
                                <div v-if="isEditing == index" class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">{{ choice.choice_number }}.</span>
                                    </div>
                                    <input v-model="choice.choice" type="text" class="form-control">
                                </div>
                                <font-awesome-icon v-on:click="editing(choice, index)" v-if="(user.role == 'admin' && isEditing == index) || (user.role == 'admin' && isEditing == -1)" :icon="['fa', 'edit']" class="float-right" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <button v-if="!submitted" v-scroll-to="{
                el: '#top',
                container: 'body',
                duration: 500,
                easing: 'linear',
                offset: -200,
                force: true,
                cancelable: true,
                x: false,
                y: true
                }" v-on:click="submitQuiz" type="button" id="submit-button" class="btn btn-outline-success float-right">Submit</button>
            <button v-if="submitted" v-scroll-to="{
                el: '#top',
                container: 'body',
                duration: 500,
                easing: 'linear',
                offset: -200,
                force: true,
                cancelable: true,
                x: false,
                y: true
                }" v-on:click="submitted = false" type="button" id="submit-button" class="btn btn-outline-success float-right">Retake</button>
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
            userQuiz: [],
            selections: [],
            isEditing: -1,
            score: null,
            submitted: false,
            userQuestions: [],
            userAnswers: []
        }
    },
    props: ['comp_quiz', 'course', 'section', 'user', 'checkpoint'],
    created(){
        this.checkQuizDone()
    },
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
                    question: question.number,
                    question_id: question.id
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
        },
        nextCheckpoint($event){
            $event.preventDefault()
            $.ajax({
                type: "GET",
                url: '/next_checkpoint',
                data: { checkpoint: null, section: this.section.id, quiz: this.quiz.id },
                error: (err) => {
                    console.log(err)
                }
            })
        },
        submitQuiz(){
            if(this.selections.length == this.questions.length) {
                this.quizSubmitAjax()
            } else {
                alert("Please answer all questions before submitting the quiz.")
            }
        },
        checkQuizDone(){
            $.ajax({
                type: "GET",
                url: '/check_user_quiz',
                data: { user_id: this.user.id, quiz_id: this.quiz.id },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.score = data.user_quiz.score
                    this.userQuestions = data.questions
                    this.submitted = true
                }
            })
        },
        quizSubmitAjax(){
            const payload = {
                quiz: this.quiz.id,
                answers: JSON.stringify(this.selections)
            }
            $.ajax({
                type: "POST",
                url: '/quiz_submission',
                data: payload,
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.score = data.user_quiz.score
                    this.userQuestions = data.questions
                    this.submitted = true
                    this.$refs.scrollToTop()
                }
            })
        },
    }
}
</script>

<style scoped>
.quiz-card {
    text-align: center;
}
img {
    max-width: 600px;
}
.list-group-item {
    font-size: 15px;
}
#submit-button {
    margin-bottom: 30px;
}
</style>
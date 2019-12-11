<template>
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10" id="middle">
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
                    <div v-for="choice in question.choices" v-bind:choice="choice" v-bind:key="choice.key" class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                        <label class="form-check-label" for="defaultCheck1">
                            {{ choice.choice_number }}. {{ choice.choice }}
                        </label>
                    </div>
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
            questions: this.comp_quiz.questions
        }
    },
    props: ['comp_quiz', 'course', 'section']
}
</script>

<style scoped>
.quiz-card {
    text-align: center;
}
img {
    height: 50%;
}
</style>
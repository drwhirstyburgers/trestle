<template>
    <div class="card">
        <div class="card-header">
            New Course
        </div>
        <div class="card-body">
            <form>
                <div class="form-group">
                    <label for="title">Course Title</label>
                    <input v-model="title" type="text" class="form-control" placeholder="Title">
                </div>
                <div class="form-group">
                    <label for="title">Accreditation name</label>
                    <input v-model="accreditation" type="text" class="form-control" placeholder="Accreditation">
                </div>
                <div class="form-group">
                    <label for="price">Course price</label>
                    <input v-model="price" type="number" class="form-control" placeholder="Price">
                </div>
                <div class="form-group">
                    <label for="price">Course duration</label>
                    <input v-model="duration" type="number" class="form-control" placeholder="Duration">
                    <small class="form-text text-muted">
                        In months and whole numbers.
                    </small>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Course Description</label>
                    <textarea v-model="description" class="form-control" rows="3"></textarea>
                </div>
                <button v-on:click="submitCourse" type="button" class="btn btn-outline-success pull-right">Submit</button>
            </form>
        </div>
    </div>
</template>

<script>

export default {
    data () {
        return {
            title: '',
            description: '',
            price: 0,
            duration: 0,
            accreditation: '',
        }
    },
    methods: {
        submitCourse() {
            const title = this.title
            const description = this.description
            const price = this.price
            const duration = this.duration
            const accreditation = this.accreditation
            $.ajax({
                method: 'POST',
                url: '/courses',
                data: { course: { title: title, description: description, price: price, duration: duration, accreditation: accreditation } },
                success: (data) => {
                    console.log(data)
                }
            })
        }
    }
}

</script>
<template>
    <div class="card">
        <div class="card-header">
            New Section
        </div>
        <div class="card-body">
            <form>
                <div class="form-group">
                    <label for="title">Section Title</label>
                    <input v-model="title" type="text" class="form-control" placeholder="Title">
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
                    <input v-model="timeToComplete" type="number" class="form-control" placeholder="Title">
                </div>
                <button v-on:click="submitSection" type="button" class="btn btn-outline-success pull-right">Submit</button>
            </form>
        </div>
    </div>
</template>

<script>

export default {
    data () {
        return {
            newCourse: this.course,
            title: '',
            orderNumber: 0,
            timeToComplete: 0,
        }
    },
    props: ['course'],
    methods: {
        submitSection() {
            $.ajax({
                method: 'POST',
                url: '/courses',
                data: { course: { title: title, description: description, price: price, duration: duration, accreditation: accreditation, active: active } },
                success: (data) => {
                    console.log(data)
                    this.$emit('courseCreated', data) 
                }
            })
        }
    }
}

</script>
<template>
    <div class="card" id="show-card">
        <div v-html="content" class="card-body"> 
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {

        }
    },
    props: ['content']
}
</script>
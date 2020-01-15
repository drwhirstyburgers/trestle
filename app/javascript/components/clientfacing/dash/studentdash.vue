<template>
    <div>
        <div class="container-fluid" id="cf-lcosd">
            <div class="row header-row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <div class="align-bottom">
                        <h1 class="display-3 preview">{{ user.first_name }} {{ user.last_name }}</h1>
                    </div>
                </div>
                <div class="col-md-2">
                </div>
            </div>
        </div>
        <div class="container-fluid body-content">
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <div class="row content">
                        <div class="col-md-4 course-panel">
                            <div class="demo-card-square mdl-card mdl-shadow--2dp">
                                <div class="mdl-card__title mdl-card--expand">
                                    <h2 class="mdl-card__title-text">Courses</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    <div class="demo-list-action mdl-list">
                                        <div class="mdl-list__item">
                                            <span class="mdl-list__item-primary-content">
                                            <i class="material-icons mdl-list__item-avatar">person</i>
                                            <span>Bryan Cranston</span>
                                            </span>
                                            <a class="mdl-list__item-secondary-action" href="#"><i class="material-icons">star</i></a>
                                        </div>
                                        <div class="mdl-list__item">
                                            <span class="mdl-list__item-primary-content">
                                            <i class="material-icons mdl-list__item-avatar">person</i>
                                            <span>Aaron Paul</span>
                                            </span>
                                            <a class="mdl-list__item-secondary-action" href="#"><i class="material-icons">star</i></a>
                                        </div>
                                        <div class="mdl-list__item">
                                            <span class="mdl-list__item-primary-content">
                                            <i class="material-icons mdl-list__item-avatar">person</i>
                                            <span>Bob Odenkirk</span>
                                            </span>
                                            <span class="mdl-list__item-secondary-content">
                                            <a class="mdl-list__item-secondary-action" href="#"><i class="material-icons">star</i></a>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                    View Updates
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {

        }
    },
    props: ['courses', 'user', 'userCourses'],
    components: {

    },
    methods: {

    }
}
</script>

<style scoped>
#cf-lcosd {
    background: rgb(34,193,195);
    background: linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(45,84,253,1) 100%);
    color: white;
    padding-left: 0px !important;
    padding-right: 0px !important;
    padding-bottom: 0 !important;
    min-height: 20vh;
}

.preview {
    margin-bottom: 0 !important;
    padding-bottom: 0 !important;
    margin-top: 10vh;
}

.align-bottom {
    height: 100%;
}

.demo-card-square.mdl-card {
    margin-top: 5%;
    width: 320px;
    min-height: 100%;
}
.demo-card-square > .mdl-card__title {
  color: #fff;
  background: 
    linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(45,84,253,1) 100%) bottom right 15% no-repeat #46B6AC;
}
.demo-list-action {
  width: auto;
}
.body-content{
    min-height: 80vh !important;
}
.row.content {
    min-height: 80vh !important;
}
</style>
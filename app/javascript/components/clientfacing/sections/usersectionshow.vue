<template>
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10" id="ti-box">
            <div class="container-fluid">
                <div class="row" id="row-contain">
                    <div class="col-md-9 align-bottom drop-shadow" id="titlebox">
                        <div id="title-description">
                            <h1 class="display-4">{{ sect.order_number }}. {{ sect.name }}</h1>
                            <p class="lead">{{ sect.description }}</p>
                        </div>
                    </div>
                    <div class="col-md-3 drop-shadow" id="infobox">
                        <div class="card section">
                            <div class="card-body">
                                <h1 class="display-4">Checkpoints complete: {{ numberOfCompleted }}/{{ checkpoints.length }}</h1>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" v-bind:style="{width: progress + '%'}" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                        {{ progress }}%
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <checkcard v-for="checkpoint in checkpoints" v-bind:checkpoint="checkpoint" v-bind:key="checkpoint.key" class="col-md-4" />
                </div>
                <br>
            </div>
        </div>
    </div>
</template>

<script>
import checkcard from '../checkpoints/checkcard'

export default {
    data() {
        return {
            sect: this.section,
            checkpoints: [],
            numberOfCompleted: 0,
            progress: null,
            mobile: false
        }
    },
    props: ['section'],
    components: { checkcard },
    mounted(){
        this.getSectionCheckpoints()
        this.getSectionProgress()
        this.isMobile()
    },
    methods: {
        getSectionCheckpoints(){
            $.ajax({
                type: "GET",
                url: '/get_checkpoints',
                data: { section_id: this.section.id },
                success: (data) => {
                    this.checkpoints = data
                    this.numberOfCompleted = this.getCompletedNumber(this.checkpoints)
                }
            })
        },
        getSectionProgress(){
            $.ajax({
                type: 'GET',
                url: '/get_section_progress',
                data: { section_id: this.sect.id },
                error: (err) => {
                    console.log(err)
                },
                success: (data) => {
                    this.progress = data
                }
            })
        },
        getCompletedNumber(checkpoints){
            return checkpoints.filter((c) => c.completed).length
        },
        isMobile(){
            if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
            || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) { 
                this.mobile = true;
            }
        }
    }
}
</script>

<style scoped>
#titlebox{
    padding-top: 2%;
    background-color: #343a40 !important;
    color: white;
}
#ti-box {
    margin-top: 30px;
}
#titlebox .display-4 {
    font-size:2rem;
    font-weight: 300;
    line-height: 1.2;
    color: white;
    margin-bottom: 5px !important;
}
#infobox .display-4 {
    font-size:1.5rem;
    font-weight: 300;
    line-height: 1.2;
    color: black;
    margin-bottom: 5px !important;
}
.lead {
    font-size: 1rem;
}
#titlebox {
    position: relative;
}
#title-description{
    margin-left: 3%;
    position: absolute;
    bottom: 8%;
}
#infobox {
    background-color: #343a40;
    font: black
}
#infoItems {
    margin-right: 5%;
}
.drop-shadow{
    box-shadow: 2px 2px 2px 2px #888888;
    z-index:999;
}
.section {
    margin-top: 7%;
    margin-right: 5%;
    margin-left: 5%;
}
.card-text {
    color: white;
}
.row.section-show {
    margin-bottom: 30px;
}
@media only screen and (max-width: 767px) {
    #titlebox  {
      position: absolute;
    }
}
</style>
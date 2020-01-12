// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('perfect-scrollbar')
require("trix")
require("@rails/actiontext")
require("assets/videoswitching")
require("assets/loadscripts")

// some code to help with the viewport resizing issue on mobile
window.mobilecheck = function() {
  var check = false;
  (function(a){if(/(android|bb\d+|meego).+mobile|android|ipad|playbook|silk|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
  return check;
 }

 if (window.mobilecheck() == true) {
  var newHeight = $(window).height() + 70;
  $("#background").css("height", newHeight);
 }


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import '../stylesheets/application'
import 'bootstrap'
import '@coreui/coreui'
import 'material-design-lite'
import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import courseform from '../components/courses/courseform'
import courseoverview from '../components/courses/courseoverview'
import sectionform from '../components/courses/sectionform'
import courseindex from '../components/courses/courseindex'
import topbar from '../components/dash/topbar'
import usercourseindex from '../components/clientfacing/course/usercourseindex'
import learnercourseoverview from '../components/clientfacing/course/learnercourseoverview'
import choiceform from '../components/quizzes/choiceform'
import quizzesshow from '../components/quizzes/quizzesshow'
import completebutton from '../components/checkpoints/completebutton'
import { inflateRaw } from 'zlib'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faCheckSquare } from '@fortawesome/free-solid-svg-icons'
import { faTimes } from '@fortawesome/free-solid-svg-icons'
import { faEdit } from '@fortawesome/free-solid-svg-icons'
import { faHome } from '@fortawesome/free-solid-svg-icons'
import { faBook } from '@fortawesome/free-solid-svg-icons'
import { faCannabis } from '@fortawesome/free-solid-svg-icons'
import { faUserEdit } from '@fortawesome/free-solid-svg-icons'
import { faSignOutAlt } from '@fortawesome/free-solid-svg-icons'
import { faCheckDouble } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import VueScrollTo from 'vue-scrollto'

library.add(faCheckSquare, faTimes, faEdit, faHome, faSignOutAlt, faBook, faUserEdit, faCannabis, faCheckDouble)
Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.use(TurbolinksAdapter)
Vue.use(VueScrollTo)

document.addEventListener('turbolinks:load', () => {
  var cf = document.getElementById('courseForm')
  if (cf != null){
    const app = new Vue({
      el: cf,
      data: () => {
        return {
          course: JSON.parse(cf.dataset.course)
        }
      },
      template: '<courseform :course="course"/>',
      components: { courseform }
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  var sectionForm = document.getElementById('sectionForm')
  if (sectionForm != null){
    const app = new Vue({
      el: sectionForm,
      data: () => {
        return {
          courses: JSON.parse(sectionForm.dataset.ac),
          theSection: JSON.parse(sectionForm.dataset.section)
        }
      },
      template: '<sectionform :courses="courses" :section="theSection" />',
      components: { sectionform },
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  var co = document.getElementById('courseOverview')
  if (co != null){
    const app = new Vue({
      el: co,
      data: () => {
        return {
          course: JSON.parse(co.dataset.c),
          sections: JSON.parse(co.dataset.s)
        }
      },
      template: '<courseoverview :course="course" :sections="sections" />',
      components: { courseoverview }
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  var ci = document.getElementById('courseIndex')
  if (ci != null){
    const app = new Vue({
      el: ci,
      data: () => {
        return {
          courses: JSON.parse(ci.dataset.cs),
        }
      },
      template: '<courseindex :c="courses" />',
      components: { courseindex }
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  var tb = document.getElementById('topBar')
  if (tb != null){
    const app = new Vue({
      el: tb,
      data: () => {
        return {
          courses: JSON.parse(tb.dataset.cs),
          user: JSON.parse(tb.dataset.cu)
        }
      },
      template: '<topbar :user_courses="courses" :current_user="user" />',
      components: { topbar }
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  var sci = document.getElementById('scourseIndex')
  if (sci != null){
    const app = new Vue({
      el: sci,
      data: () => {
        return {
          courses: JSON.parse(sci.dataset.acs),
        }
      },
      template: '<usercourseindex :tcourse="courses" />',
      components: { usercourseindex }
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  var lco = document.getElementById('learnerCourseOverview')
  if (lco != null){
    const app = new Vue({
      el: lco,
      data: () => {
        return {
          course: JSON.parse(lco.dataset.c),
          sections: JSON.parse(lco.dataset.s),
          user: JSON.parse(lco.dataset.u)
        }
      },
      template: '<learnercourseoverview :lcourse="course" :lsections="sections" :learner="user" />',
      components: { learnercourseoverview }
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementById('choiceForm')
  if (element != null){
    const app = new Vue({
      el: element,
      data: () => {
        return {
          quest: JSON.parse(element.dataset.qu)
        }
      },
      template: '<choiceform :quests="quest"/>',
      components: { choiceform }
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementById('quizzesShow')
  if (element != null){
    const app = new Vue({
      el: element,
      data: () => {
        return {
          compQuiz: JSON.parse(element.dataset.quiz),
          section: JSON.parse(element.dataset.sect),
          course: JSON.parse(element.dataset.cour),
          u: JSON.parse(element.dataset.cu),
          next: JSON.parse(element.dataset.nc)
        }
      },
      template: '<quizzesshow :comp_quiz="compQuiz" :section="section" :course="course" :user="u" :checkpoint="next" />',
      components: { quizzesshow }
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementById('completeButton')
  if (element != null){
    const app = new Vue({
      el: element,
      data: () => {
        return {
          u: JSON.parse(element.dataset.cu),
          check: JSON.parse(element.dataset.c)
        }
      },
      template: '<completebutton :user="u" :checkpoint="check" />',
      components: { completebutton }
    })
  }
})
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


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import '../stylesheets/application'
import 'bootstrap'
import '@coreui/coreui'
import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import courseform from '../components/courses/courseform'
import courseoverview from '../components/courses/courseoverview'
import sectionform from '../components/courses/sectionform'
import courseindex from '../components/courses/courseindex'
import topbar from '../components/dash/topbar'
import usercourseindex from '../components/clientfacing/course/usercourseindex'
import learnercourseoverview from '../components/clientfacing/course/learnercourseoverview'
import choiceform from '../components/quizzes/choiceform'
import { inflateRaw } from 'zlib'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faCheckSquare } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faCheckSquare)
Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.use(TurbolinksAdapter)

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
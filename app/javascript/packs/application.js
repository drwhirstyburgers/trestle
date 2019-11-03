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
import courseindex from '../components/indexes/courseindex'


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
  var sf = document.getElementById('sectionForm')
  if (sf != null){
    const app = new Vue({
      el: sf,
      data: () => {
        return {
          c: JSON.parse(sf.dataset.courses),
          s: JSON.parse(sf.dataset.section)
        }
      },
      template: '<sectionform :courses="c" :section="s" />',
      components: { sectionform }
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
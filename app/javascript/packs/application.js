// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('perfect-scrollbar')


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
import navbar from '../components/dash/navbar'
import topbar from '../components/dash/topbar'
import courseindex from '../components/indexes/courseindex'
import checkpointform from '../components/checkpoints/checkpointform'

Vue.use(TurbolinksAdapter)
document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]',
    data: () => {
      return {
        
      }
    },
    components: { App, 
                  courseform,
                  sectionform,
                  courseoverview,
                  navbar,
                  topbar,
                  courseindex,
                  checkpointform
                }
  })
})
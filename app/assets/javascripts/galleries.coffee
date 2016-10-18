# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "turbolinks:load", ->
   $('.button').on 'click', -> 
     $('#FormForUpload').toggleClass('DoNotShow').toggleClass('ModalViewForUpload')

$(document).on "turbolinks:load", -> 
  $grid = $('.grid').packery({
   itemSelector: '.imageBox'
  }); 
    
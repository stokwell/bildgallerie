# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
   $('.button').on 'click', -> 
     $('#FormForUpload').toggleClass('DoNotShow').toggleClass('ModalViewForUpload')
     $('.modalview-background').toggleClass('DoNotShow')
     $('body').addClass('lock')
   $('.modalview-background').on 'click', ->
     $('#FormForUpload').toggleClass('DoNotShow').toggleClass('ModalViewForUpload')
     $('.modalview-background').toggleClass('DoNotShow')
     $('body').removeClass('lock')
$ ->
   $('.multi-image-grid').on 'click', -> 
     $('.imageBox img').css({'width' : '390px'})
     $grid = $('#grid').packery({
        itemSelector: '.imageBox';
        });

$ ->
   $('.one-image-grid').on 'click', -> 
     $grid = $('#grid').packery({
        itemSelector: '.imageBox';
        });
     $grid.packery('destroy')
     $('.imageBox img').css({'width' : '700px'})

 









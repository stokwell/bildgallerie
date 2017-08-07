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
     $grid = $('#grid').packery()
     $grid.imagesLoaded().progress ->
       $grid.packery ({
         itemSelector: '.imageBox';
       });
    

$ ->
   $('.one-image-grid').on 'click', -> 
     $grid = $('#grid').packery({
        itemSelector: '.imageBox';
        });
     $grid.packery('destroy')
     $('.imageBox img').css({'width' : '700px'})

#$ -> 
 #  $grid = $('#galleries_grid').packery({
  #      itemSelector: '.gallery-box';
   #     }); 

$ ->
  new CoverCropper()

class CoverCropper
  constructor: ->
    $('#cropbox').Jcrop
      onSelect: @update
      onChange: @update
      aspectRatio: 1

  update: (coords) =>
    $('#gallery_crop_x').val(coords.x)
    $('#gallery_crop_y').val(coords.y)    
    $('#gallery_crop_w').val(coords.w)    
    $('#gallery_crop_h').val(coords.h)    








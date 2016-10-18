# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
     $('.image img').addClass('width')


$(document).on "turbolinks:load", -> 
  isActive = true
  $grid = $('.grid').packery({
   itemSelector: '.image'
  }); 
  $('.one').on 'click', ->
       $('.image img').toggleClass('width') 
       $('.image img').toggleClass('single')
       $('.image').toggleClass('box')
       $('.destroy').toggleClass('hide')
       $('.edit').toggleClass('hide')
       if isActive
       	$grid.packery('destroy')
       else 
        $grid = $('.grid').packery({
        itemSelector: '.image'
        });

       isActive = !isActive


$(document).on "turbolinks:load", ->
   isA = true
   $('.show').on 'click', -> 
       $('.image').find('p').toggleClass('visible') 
       $('.show').text('hide all descriptions')
       isA = !isA;
      
    
  
    $('.image').hover -> 
     if isA
       $(this).find('p').toggleClass('visible')     


      


       

      
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$("document").ready(function(){

    $(".img_up").change(function() {
                $('.img_up_sub').click();
            });


});

function camara_action(e){
  e.preventDefault();
  $('#camara_img').click();
};

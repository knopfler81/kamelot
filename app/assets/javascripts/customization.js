$(document).on('turbolinks:load', function() {


  $(function() {

    function readURL(input) {
      if (input.files && input.files[0]){
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#logo_prev').attr('src', e.target.result);
        } 
        reader.readAsDataURL(input.files[0]);
      }
    }

    $("#logo_upload").change(function(){ 

        $('#logo_prev').removeClass('hidden').addClass('tiny_image').parents('.error')
      
        readURL(this);
      
    }); 
  });


  $(function() {

    function readURL(input) {
      if (input.files && input.files[0]){
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#main_image_prev').attr('src', e.target.result);
        } 
        reader.readAsDataURL(input.files[0]);
      }
    }

    $("#main_image_upload").change(function(){ 

        $('#main_image_prev').removeClass('hidden').addClass('tiny_image').parents('.error')
      
        readURL(this);
      
    }); 
  });

  $(function() {

    function readURL(input) {
      if (input.files && input.files[0]){
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#second_image_prev').attr('src', e.target.result);
        } 
        reader.readAsDataURL(input.files[0]);
      }
    }

    $("#second_image_upload").change(function(){ 

        $('#second_image_prev').removeClass('hidden').addClass('tiny_image').parents('.error')
      
        readURL(this);
      
    }); 
  });

  $(function() {

    function readURL(input) {
      if (input.files && input.files[0]){
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#third_image_prev').attr('src', e.target.result);
        } 
        reader.readAsDataURL(input.files[0]);
      }
    }

    $("#third_image_upload").change(function(){ 

        $('#third_image_prev').removeClass('hidden').addClass('tiny_image').parents('.error')
      
        readURL(this);
      
    }); 
  });
});
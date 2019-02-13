$(document).on('turbolinks:load', function() {



  $(function() {

    function readURL(input) {
      if (input.files && input.files[0]){
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#main_img_prev').attr('src', e.target.result);
        } 
        reader.readAsDataURL(input.files[0]);
      }
    }

    $("#main_image_upload").change(function(){ 

        $('#main_img_prev').removeClass('hidden').addClass('tiny_image').parents('.error')
      
        readURL(this);
      
    }); 

  });
});

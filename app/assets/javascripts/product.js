$(document).on('turbolinks:load', function() {

  $('.small_image').on('mouseover', displayImage);
  $('.small_image_pdt').on('mouseover', displayImage);


  function displayImage(){

  	result = document.getElementById("big_image_show");
  	bigImages = document.createElement("div");
  	bigImages.setAttribute("class", "big_images")
  	result.appendChild(bigImages);
  	myDiv = document.createElement("div");
  	myDiv.setAttribute("class", "big_image")
  	myDiv.setAttribute("data-image", this.src)
  	myDiv.setAttribute("data-scale", 2.5);

  	bigImages.appendChild(myDiv)
  	

    $('.big_image')
      // tile mouse actions
      .on('mouseover', function(){

        $(this).children('.photo').css({'transform': 'scale('+ $(this).attr('data-scale') +')'});
      })
      .on('mouseout', function(){
        $(this).children('.photo').css({'transform': 'scale(1)'});
      })
      .on('mousemove', function(e){
        $(this).children('.photo').css({'transform-origin': ((e.pageX - $(this).offset().left) / $(this).width()) * 100 + '% ' + ((e.pageY - $(this).offset().top) / $(this).height()) * 100 +'%'});
      })
      // big_images set up
      .each(function(){
        $(this)
          // add a photo content
          .append('<div class="photo"></div>')
          // set up a background image for each tile based on data-image attribute
          .children('.photo').css({'background-image': 'url('+ $(this).attr('data-image') +')'});
      })
  };


});



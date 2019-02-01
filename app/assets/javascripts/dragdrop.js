function handleFileSelect() {
  //Check File API support
  if (window.File && window.FileList && window.FileReader) {

      var files = event.target.files; //FileList object
      var output = document.getElementById("result");

      for (var i = 0; i < files.length; i++) {
          var file = files[i];
          //Only pics
          if (!file.type.match('image')) continue;

          var picReader = new FileReader();
          picReader.addEventListener("load", function (event) {
            var picFile = event.target;
            var li = document.createElement("li");
            li.className ='list'

            li.innerHTML = "<img class='thumbnail small_image' src='" + picFile.result + "'" + "title='" + picFile.name + "'/></br>";

            output.insertBefore(li, null);
          });
          //Read the image
          picReader.readAsDataURL(file);
      }
  } else {
      console.log("Your browser does not support File API");
  }
}

var element = document.getElementById('files')

if(element != null){
  document.getElementById('files').addEventListener('change', handleFileSelect, false);  
}

///////////////////////////////////////////////////////////////////////////////////////////////

// Modal ajout d'image
var refresh = document.getElementById('refreshModal');
 refresh.addEventListener('click', function(){
  location.reload();
 })


function checkImageCounter(event){

  var tinyImagesCounter = Array.from(document.getElementsByClassName('tiny_image')).length
  var smallImagesCounter = Array.from(document.getElementsByClassName('small_image')).length

  var resultCounter = tinyImagesCounter + smallImagesCounter;

  var divTextUpload = document.getElementsByClassName('image-upload-wrap')[0];
  var submitNewImage = document.getElementById("modal-submit");


  if(resultCounter >= 5){
    divTextUpload.style.color= "red";
    divTextUpload.innerHTML = "<h3>OULA! Il ne peut y avoir que quatre images en tout!</h3>"
    submitNewImage.setAttribute("disabled", true)
    event.preventDefault();
    }
  else if (smallImagesCounter === 0 ){
    divTextUpload.style.color= "red";
    divTextUpload.innerHTML = "<h3>OULA! Séléctionnez au moins une image</h3>"
    submitNewImage.setAttribute("disabled", true)
    event.preventDefault();
  }
}

var submitNewImage = document.getElementById("modal-submit");

submitNewImage.addEventListener('click', checkImageCounter, false)


///////////////////////////////////////////////////////////////////////////////////////////////
/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 304);
/******/ })
/************************************************************************/
/******/ ({

/***/ 304:
/*!******************************************!*\
  !*** ./app/javascript/packs/dragdrop.js ***!
  \******************************************/
/*! dynamic exports provided */
/*! all exports used */
/***/ (function(module, exports) {


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
        li.className = 'list';

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

var element = document.getElementById('files');

if (element != null) {
  document.getElementById('files').addEventListener('change', handleFileSelect, false);
}

///////////////////////////////////////////////////////////////////////////////////////////////

// Modal ajout d'image

// var refresh = document.getElementById('refreshModal');
//  refresh.addEventListener('click', function(){
//   location.reload();
//  })


function checkImageCounter(event) {

  var tinyImagesCounter = Array.from(document.getElementsByClassName('tiny_image')).length;
  var smallImagesCounter = Array.from(document.getElementsByClassName('small_image')).length;

  var resultCounter = tinyImagesCounter + smallImagesCounter;

  var divTextUpload = document.getElementsByClassName('image-upload-wrap')[0];
  var submitNewImage = document.getElementById("modal-submit");

  if (resultCounter >= 5) {
    divTextUpload.style.color = "red";
    divTextUpload.innerHTML = "<h3>OULA! Il ne peut y avoir que quatre images en tout!</h3>";
    submitNewImage.setAttribute("disabled", true);
    event.preventDefault();
  } else if (smallImagesCounter === 0) {
    divTextUpload.style.color = "red";
    divTextUpload.innerHTML = "<h3>OULA! Séléctionnez au moins une image</h3>";
    submitNewImage.setAttribute("disabled", true);
    event.preventDefault();
  }
}

var submitNewImage = document.getElementById("modal-submit");

if (submitNewImage != null) {

  submitNewImage.addEventListener('click', checkImageCounter, false);
}

/***/ })

/******/ });
//# sourceMappingURL=dragdrop-b4465b06f67271f53d05.js.map
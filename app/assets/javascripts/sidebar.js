$(document).on('turbolinks:load', function() {

// $(function() {
//   var sessionItem = sessionStorage.getItem('activedropdown') || null;
//   var dropdown = document.getElementsByClassName('dropdown-btn');
//   var i; 
  
//   if (sessionItem !== null) {
//     var dropdownParent = document.getElementById(sessionItem);
//     openDropdown(dropdownParent);
//   }

//   for (i = 0; i < dropdown.length; i++) {
//     dropdown[i].addEventListener("click", function() {
//       openDropdown(this);
//       if (document.getElementsByClassName('active').length > 0) {
//         activeTab = document.getElementsByClassName('active')[0].id;
//         sessionStorage.setItem('activedropdown', activeTab);
//       } else {
//         sessionStorage.setItem('activedropdown', null);
//       }
//     });
//   }

//   function openDropdown(dropdownParent) {
//     if (dropdownParent == null) return;
//     dropdownParent.classList.toggle('active');
//     var dropdownContent = dropdownParent.nextElementSibling;
//     if (dropdownContent.style.display === 'block') {
//       dropdownContent.style.display = 'none';
//     } else {
//       dropdownContent.style.display = 'block';
//     }
//   }
// });
 //  $(function(){
 //    var sessionItem = sessionStorage.getItem('activedropdown') || null;
 //    var dropdown = document.getElementsByClassName('sidebar-dropdown');
 //    var i;


 //    if (sessionItem !== null) {
 //        var dropdownParent = document.getElementById(sessionItem);
 //        openDropdown(dropdownParent);
 //      }

 //     for (i = 0; i < dropdown.length; i++) {
 //       dropdown[i].addEventListener("click", function() { 
 //       openDropdown(this);
 //        if (document.getElementsByClassName('active').length > 0) {
 //          activeTab = document.getElementsByClassName('active')[0].id;
 //        sessionStorage.setItem('activedropdown', activeTab);
 //        } else {
 //          sessionStorage.setItem('activedropdown', null);
 //        }
 //     });
 //    };


 //      function openDropdown(dropdownParent){
        // $(".sidebar-dropdown > a").on('click', function(e) {
        //  e.preventDefault();

         

        //   $(".sidebar-submenu").slideUp(200);

        //   if ($(this).hasClass("active")) {

        //     $(".sidebar-dropdown").removeClass("active");
        //     //$(this).parent().removeClass("active");
        //     $(this).removeClass("active");

        //   } else {

        //     $(".sidebar-dropdown").removeClass("active");
        //     $(this).next(".sidebar-submenu").slideDown(200);
        //     //$(this).parent().addClass("active");
        //     $(this).addClass("active");

        //   }  
        // });
 //      };
 //  });

 // $("#close-sidebar").click(function() {
 //   $(".page-wrapper").addClass('reduced-menu')
 //   $("#show-sidebar").show();
 //   $("#close-sidebar").hide()
 // });

 // $("#show-sidebar").click(function() {
 //   $(".page-wrapper").removeClass('reduced-menu');
 //   $("#show-sidebar").hide();
 //   $("#close-sidebar").show()
 // });

 
 // $("#sidebar").mCustomScrollbar({
 //         theme: "minimal"
 //    });

$('#sidebarCollapse').on('click', function () {
    // open or close navbar
    $('#sidebar').toggleClass('active');
    // close dropdowns
    $('.collapse.in').toggleClass('in');
    // and also adjust aria-expanded attributes we use for the open/closed arrows
    // in our CSS
    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
});


});
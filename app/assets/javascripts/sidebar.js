$(document).on('turbolinks:load', function() {
   //jQuery(function ($) {

      $(".sidebar-dropdown > a").on('click', function(e) {
        e.preventDefault();
        $(".sidebar-submenu").slideUp(200);
        console.log(($(this).parent().hasClass("active")))

        if ($(this).parent().hasClass("active")) {
          $(".sidebar-dropdown").removeClass("active");
          $(this).parent().removeClass("active");

        } else {
          $(".sidebar-dropdown").removeClass("active");
          $(this).next(".sidebar-submenu").slideDown(200);
          $(this).parent().addClass("active");
        }
      });

      $("#close-sidebar").click(function() {
        $(".page-wrapper").removeClass("toggled");
      });
      $("#show-sidebar").click(function() {
        $(".page-wrapper").addClass("toggled");
      });

  //});
 });

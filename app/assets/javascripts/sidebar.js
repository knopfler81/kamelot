$(document).on('turbolinks:load', function() {

    $('#sidebarCollapse').on('click', function () {
        // open or close navbar
        $('#sidebar').toggleClass('active');
        // close dropdowns
        $('.collapse.in').toggleClass('in');
        // and also adjust aria-expanded attributes we use for the open/closed arrows
        // in our CSS
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');

        if ($('#sidebar').hasClass('active')) {
        	document.cookie = 'hide_menu=true;path=/';
        } else {
        	document.cookie = 'hide_menu=false;path=/';
        }
    });
});
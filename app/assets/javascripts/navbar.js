// ouvre le sous menu et referme le sous menu (admin et clients)

$(document).on('turbolinks:load', function() {
  $(".gender").mouseenter(function(){
    var gender = $(this).data("gender")
    $(".categories[data-gender=" + gender + "]").slideDown();
  })

  $(".categories").mouseleave(function() {
    $(".categories").each(function() { $(this).slideUp() })
  });

  $(".gender").mouseenter(function(){
    var gender = $(this).data("gender")
    $(".admin-categories[data-gender=" + gender + "]").slideDown();
  })


  $(".gender").mouseenter(function(){
    var gender = $(this).data("gender")
    $(".admin-categories[data-gender=" + gender + "]").slideDown();
  })

  $(".admin-categories").mouseleave(function() {
    $(".admin-categories").each(function() { $(this).slideUp() })
  });
});
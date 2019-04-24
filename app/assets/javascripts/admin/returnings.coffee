$(document).on 'turbolinks:load', ->
  if $('.pagination').length && $('#returnings').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Chargement des autres commandes...")
        $.getScript(url)
    $(window).scroll()
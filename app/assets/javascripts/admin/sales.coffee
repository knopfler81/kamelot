$ ->
  if $('.pagination').length && $('#sales').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Chargement des autres ventes...")
        $.getScript(url)
    $(window).scroll()
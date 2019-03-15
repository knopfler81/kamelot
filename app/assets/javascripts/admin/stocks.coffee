$ ->
  if $('.pagination').length && $('#stocks').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Chargement du stock...")
        $.getScript(url)
    $(window).scroll()
class NavbarViewModel

  constructor: ->
    @initializeScrollingBehaviour()

  initializeScrollingBehaviour: ->
    docElem = document.documentElement
    $header = $(".cbp-af-header")
    didScroll = false
    changeHeaderOn = 300

    window.addEventListener "scroll", ((event) ->
      unless didScroll
        didScroll = true
        setTimeout scrollPage, 250
      return
    ), false

    scrollPage = ->
      sy = window.pageYOffset or docElem.scrollTop
      if sy >= changeHeaderOn
        $header.addClass('cbp-af-header-shrink')
      else
        $header.removeClass('cbp-af-header-shrink')
      didScroll = false
      return

  scrollToAnchor: (data, event) ->
    $(window).scrollTo event.target.hash
    return false


# Bind the view-model to each .cbp-af-header element
$ ->
  $('.cbp-af-header').each(->
    ko.applyBindings(new NavbarViewModel(), this))

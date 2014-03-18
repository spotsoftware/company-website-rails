#= require anim_on_scroll


initializeScrollAnimation = ->
  new AnimOnScroll(document.getElementById("grid"),
    minDuration: 0.4
    maxDuration: 0.7
    viewportFactor: 0.2
  )
  return

$ -> initializeScrollAnimation()

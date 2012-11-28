#= require jquery.js

$ ->
  slides = $(".slides img")
  first = $(slides[0])
  base = first.offset().top
  slides.click (event) ->
    image = $(this);
    next = image.next()
    next = first unless next.length
    top = next.offset().top
    $("body").animate(scrollTop: top - base, 400, "swing")

  $(".show-info").click (event) ->
    event.preventDefault()
    $("body").toggleClass("expand-info")

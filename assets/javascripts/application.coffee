#= require jquery.js

$ ->
  slides = $(".js-slideshow .js-slide")
  first = $(slides[0])
  base = first.offset().top
  body = $("body")

  scrollTo = (slide) ->
    top = slide.offset().top
    body.animate(scrollTop: top - base, 400, "swing")

  slides.click (event) ->
    image = $(this)
    next = image.next()
    next = first unless next.length
    scrollTo(next)

  $("#backTop").click (event) ->
    event.preventDefault()
    scrollTo(first)

  $(".show-info").click (event) ->
    $("body").toggleClass("expand-info")

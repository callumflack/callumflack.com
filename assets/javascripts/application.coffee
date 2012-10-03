#= require zepto.js

$ ->
  slides = $(".slide")
  length = slides.length
  index = 0
  expanded = false
  timeout = null

  forward = ->
    slides.removeClass("previous")
    next = (index + 1) % length
    $(slides[index]).removeClass("active").addClass("previous")
    $(slides[next]).addClass("active")
    index = next
    timeout = setTimeout forward, 5000

  startSlideshow = ->
    timeout = setTimeout forward, 5000

  stopSlideshow = ->
    clearTimeout(timeout) if timeout

  startSlideshow()

  images = $(".slide .background img")
  images.each ->
    $this = $(this)
    $this.data("width", $this.width())
    $this.data("height", $this.height())

  resize = ->
    body = $("body")
    bodyWidth = body.width()
    bodyHeight = body.height()
    images.each ->
      $this = $(this)
      width = $this.data("width")
      height = $this.data("height")
      ratio = Math.max(bodyWidth / width, bodyHeight / height)
      $this.width(width * ratio)
      $this.height(height * ratio)
      $this.css(left: (bodyWidth - width * ratio) / 2)
      $this.css(top: (bodyHeight - height * ratio) / 2)

  resize()
  $(window).on "resize", resize

  $(".show-info").click (e) ->
    e.preventDefault()
    if expanded
      startSlideshow()
      $("body").removeClass("expand-info")
    else
      stopSlideshow()
      $("body").addClass("expand-info")
    expanded = !expanded

  $(".show-pictures").click (e) ->
    e.preventDefault()
    if expanded
      startSlideshow()
      $("body").removeClass("expand-info")
    else
      stopSlideshow()
      $("body").addClass("expand-info")
    expanded = !expanded

#= require jquery.js

$ ->
    slides = $(".js-slide")
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

    # Unslider
    $(".banner").unslider()
        speed: 500
        delay: 3000
        keys: true       #  Enable keyboard (left, right) arrow shortcuts
        dots: false       #  Display dot navigation
        fluid: true     #  Support responsive design. May break non-responsive designs

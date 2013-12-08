#= require jquery.js
#= mw-modernizr.custom.js

#= require jquery.arbitrary-anchor.js
#= require jquery.scrollNav.min.js

#= require unslider.js
#= require owl.carousel.min.js

#= mw-classie.js
#= mw-css-filters-polyfill
#= mw-cssParser.js
#= mw-modalEffects.js


$(document).ready ->

    $("#owl-test").owlCarousel
        navigation: false
        singleItem: true
        autoPlay: 3000

    $(".post__article").scrollNav



# https://gist.github.com/rezwyi/3919572
# https://gist.github.com/chrishamant/946868
root = exports ? this
root._gaq = [['_setAccount', 'UA-43323845-1'], ['_trackPageview']]

insertGAScript = ->
    ga = document.createElement 'script'
    ga.type = 'text/javascript'
    ga.async = true

    proto = document.location.protocol
    proto = if (proto is 'https:') then 'https://ssl' else 'http://www'
    ga.src = "#{proto}.google-analytics.com/ga.js"

    s = document.getElementsByTagName 'script'
    s[0].parentNode.insertBefore ga, s

insertGAScript()
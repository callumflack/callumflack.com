#= require jquery.js
#= require modernizr.js
#= require jquery.arbitrary-anchor.js
#= require jquery.event.swipe.js
#= require jquery.event.move.js
#= require unslider.js

$ ->
    $(".banner").unslider
        speed: 200
        delay: 5000
        keys: true
        dots: false
        fluid: true

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
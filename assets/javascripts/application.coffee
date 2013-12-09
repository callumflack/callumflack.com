#= require jquery.js
#= require modernizr.js
#= require jquery.arbitrary-anchor.js
#= require jquery.event.swipe.js
#= require jquery.event.move.js
#= require unslider.js

$ ->
    $(".banner").unslider
        speed: 200
        delay: 3500
        init: 100
        keys: true
        dots: true
        fluid: true
        pause: false
        easing: 'swing' #see: https://github.com/idiot/unslider/issues/94


# http://ianrichard.com/2012/08/hide-mobile-safari-browser-chrome/
# get rid of the browser chrome for mobile Safari on page load
# first check to see if it's an iPhone or iPod - as this is useless for other browsers
if navigator.userAgent.match(/iPhone/i) or navigator.userAgent.match(/iPod/i)

# if going to a comments section, don't apply the mobile Safari position fix  
if document.URL.indexOf("#") is -1
    window.addEventListener "load", ->
        setTimeout (->
          
            # and just to make sure they haven't scrolled down yet
            # don't want to piss the user off by jumping around 
            # 20 is if they had only scrolled down a little bit, 
            # but not fully out of view of the browser chrome
            window.scrollTo 0, 1  if window.pageYOffset < 20
        ), 0


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
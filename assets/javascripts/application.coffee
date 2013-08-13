#= require jquery.js
#= require jquery.arbitrary-anchor.js
#= require jquery.event.swipe.js
#= require jquery.event.move.js
#= require unslider.js

$ ->
    $(".banner").unslider()
        speed: 500
        delay: 3000
        keys: true
        dots: false
        fluid: true

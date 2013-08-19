#= require jquery.js
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

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


newTyped = ->

  ### A new typed object ###

  return

foo = ->
  console.log 'Callback'
  return

ready = undefined

ready = ->
  $('#typed').typed
    stringsElement: $('#typed-strings')
    typeSpeed: 30
    backDelay: 500
    loop: true
    contentType: 'html'
    loopCount: false
    callback: ->
      foo()
      return
    resetCallback: ->
      newTyped()
      return
  $('.reset').click ->
    $('#typed').typed 'reset'
    return
  return

$(document).ready(ready)
$(document).on('page:load', ready)
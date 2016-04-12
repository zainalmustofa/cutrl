# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

ready = ->
  $('li a').click (e) ->
    e.preventDefault()
    $('a').removeClass 'active'
    $(this).addClass 'active'
    return
  return


KeyCheck = (event) ->
  KeyID = event.keyCode
  switch KeyID
    when 8
      console.log 'backspace'
      break
  return

document.addEventListener 'keydown', KeyCheck
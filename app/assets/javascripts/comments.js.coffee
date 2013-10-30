# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:change', ->
  $('textarea').autosize({append: "\n"})

$(document).on 'ready page:change', -> $(".edit-btn").click ->
    $(@).siblings(".comment-body,.comment-edit,.cancel-btn,.update-btn").toggle "slow", =>
      $('textarea').trigger 'autosize.resize'
    $(@).toggle("slow")
    
    
$(document).on 'ready page:change', -> $(".cancel-btn").click ->
    $(@).siblings(".comment-body,.comment-edit,.update-btn,.edit-btn").toggle("slow")
    $(@).toggle("slow")
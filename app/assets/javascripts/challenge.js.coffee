# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready', ->
  $('.created-time').each ->
    getTime = =>
      $.ajax(url: '/comments/time/created/'+$(@).data('comment-id')+'.json').done (json) =>
        $(@).text($.timeago(json))
    getTime();
    setInterval getTime, 5000
  $('.updated-time').each ->
    getTime = =>
      $.ajax(url: "/comments/time/updated/"+$(@).data('comment-id')+'.json').done (json) =>
        $(@).text($.timeago(json))
    getTime();
    setInterval getTime, 5000
  $('textarea').autosize({append: "\n"})
  $(".edit-btn").click ->
    $(@).siblings(".comment-body,.comment-edit,.cancel-btn,.update-btn").toggle "slow", =>
      $('textarea').trigger 'autosize.resize'
    $(@).toggle("slow")
  $(".cancel-btn").click ->
    $(@).siblings(".comment-body,.comment-edit,.update-btn,.edit-btn").toggle("slow")
    $(@).toggle("slow")
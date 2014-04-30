# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready', ->
  $(".complete_checkbox").on "change", ->
    $(this).parent().submit()
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
  $(".edit-btn").click ->
    $(@).siblings("div.comment-edit").show()
    $(@).siblings("p.comment-content").hide()
    $('textarea').trigger 'autosize.resize'
    event.preventDefault()
  $(".cancel-btn").click ->
    $(@).parent("div").hide()
    $(@).parent("div").siblings("p.comment-content").show()
  $(".reply-btn").click ->
    $(@).parent().siblings(".comment-reply").show()
    event.preventDefault()

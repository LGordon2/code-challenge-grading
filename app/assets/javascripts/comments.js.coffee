# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> $('.edit-btn').bind 'click', ->
        $(@).siblings(".comment-body").hide()
        $(@).siblings(".comment-edit").show()
        $(@).siblings(".cancel-btn,.update-btn").show()
        
$ -> $('.cancel-btn').bind 'click', ->
        $(@).siblings(".comment-body").show()
        $(@).siblings(".comment-edit").hide()
        $(@).siblings(".update-btn").hide()
        $(@).hide()
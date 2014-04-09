# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#set-date-form select").on "change", ->
    $("#set-date-form").submit()
  $(".admin_checkbox").on "change", ->
    $(this).parent().submit()
  $("li.disabled a").on "click", ->
    return false

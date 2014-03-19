# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".participatedGroup").change ->
    if ($(this).val() == 'yes')
      $("#notParticipated").fadeOut "slow", -> 
        $("#hasParticipated").fadeIn "slow"
    else
      $("#hasParticipated").fadeOut "slow", ->
        $("#notParticipated").fadeIn "slow"
  $(".projectWork").change ->
    if ($(this).val() == 'yes')
      $("#provideExample").fadeIn "slow"
    else
      $("#provideExample").fadeOut "slow"
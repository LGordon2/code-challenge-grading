# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready", ->
  $(".theirnumber").each ->
    $(this).text(their_fib($(this).attr("id").split("_")[1],username()))
    animate_number($(this))

animate_number = (number_obj) ->
  expected_val = fib(parseInt(number_obj.attr("id").split("_")[1]))
  number_obj.hide().removeClass("hidden").fadeIn().fadeOut().fadeIn ->
    number_obj.removeClass("text-danger").addClass("text-success") if number_obj.text() == "#{expected_val}"

#Test cases
fib = (n) ->
  prev_last = 0
  return prev_last if n <= 0
  last = 1
  return last if n == 1

  for i in [2..n]
    ans = last + prev_last
    prev_last = last
    last = ans

  return ans


$(document).on 'ready page:change', -> $(".edit-btn").click ->
    $(@).siblings(".comment-body,.comment-edit,.cancel-btn,.update-btn").toggle "slow", =>
      $('textarea').autosize()
    $(@).toggle("slow")
    
    
$(document).on 'ready page:change', -> $(".cancel-btn").click ->
    $(@).siblings(".comment-body,.comment-edit,.update-btn,.edit-btn").toggle("slow")
    $(@).toggle("slow")
        
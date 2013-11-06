$(document).on 'ready page:change', ->
  $('.created-time').each ->
    getTime = =>
      $.ajax(url: '/comments/time/created/'+$(@).data('comment-id')+'.json').done (json) =>
        $(@).text($.timeago(json))
    getTime();
    setInterval getTime, 5000
  $('.updated-time').each ->
    getTime = =>
      $.ajax(url: '/comments/time/updated/'+$(@).data('comment-id')+'.json').done (json) =>
        $(@).text($.timeago(json))
    getTime();
    setInterval getTime, 5000

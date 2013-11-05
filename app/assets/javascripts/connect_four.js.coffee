# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# create a namespace to export our public methods
connect_four = exports? and exports or @connect_four = {}

$(document).on "ready page:change", ->
  $(document).on "mousemove", ->
    container = $(".container").first()
    $("#testTitle").text(container.offset().left)
    element = $("#checker")
    element.css("left",event.pageX-element.width()/2) if event.pageX < container.offset().left+container.width()-element.width()/4 and event.pageX >= container.offset().left+element.width()/2
  draw_board()
  testAdd()

drawline = (start_col,start_row,end_col,end_row) ->
  board = $("canvas#board")
  board_left = board.position().left
  board_top = board.position().top
  board_ctx = board[0].getContext("2d")
  board_ctx.beginPath()
  board_ctx.moveTo(100*start_col+50,100*start_row+50)
  board_ctx.lineCap="round"
  board_ctx.lineWidth=15;
  board_ctx.lineTo(100*end_col+50,100*end_row+50)
  board_ctx.strokeStyle="#00FF00"
  board_ctx.stroke()
  board_ctx.closePath()
 

valid_msg = (msg, callback) ->
  $("#info_txt").fadeOut ->
    $("#info_txt").text(msg).css("color","white").fadeIn(callback)

invalid_msg = (msg, callback) ->
  $("#info_txt").text(msg).css("color","red").fadeOut("fast").fadeIn("fast").fadeOut("fast").fadeIn("fast", callback)



connect_four.add = (x,y,color,callback) ->
  board = $("canvas#board")
  board_left = board.position().left
  board_top = board.position().top
  return if x < 0 or x > (board.width()/100 - 1) or y < 0 or y > (board.height()/100 - 1)
  new_img = $('<img src="/assets/'+color+'.png" class="checker" style="position:absolute;left:'+(x*100+board_left+1)+'px;top:0px;z-index:-1;" width="100" height="100">')
  $("div:last").first().after(new_img)
  new_img.animate({top:(y*100+board_top+2)+'px'},"slow",callback)
          
draw_board = ->
  block = $("canvas#block")[0]
  board = $("canvas#board")[0]    
  block_ctx = block.getContext("2d")
  board_ctx = board.getContext("2d")
  block_ctx.fillStyle="yellow"
  block_ctx.fillRect(0,0,100,100)
  block_ctx.globalCompositeOperation='destination-out';
  block_ctx.beginPath()
  block_ctx.arc(50,50,40,0,2*Math.PI)
  block_ctx.fill()
  block_ctx.stroke()
  block_ctx.closePath()
  
  pat = board_ctx.createPattern(block,'repeat')
  board_ctx.beginPath()
  board_ctx.rect(0,0,board.width,board.height)
  board_ctx.fillStyle=pat
  board_ctx.fill()
  board_ctx.stroke()
  board_ctx.closePath()

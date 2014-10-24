window.onload = ->
  canvas = document.getElementById "field"
  ctx = canvas.getContext '2d'

  class Point
    constructor : (x, y, size) ->
      @x = x
      @y = y
      @size = size

    update: (dx, dy, dsize) ->
      @x += dx
      @y += dy
      @size -= dsize

  counter = 0

  getRan = () -> (Math.random() - 0.5)*2
 
  nPoint = 1000
  points = (new Point(canvas.width/2, canvas.height/2, 5) for i in [0..nPoint]) #描画したい位置#
  dpoints = ({dx:getRan(), dy:getRan(), dsize:0.008} for i in [0..nPoint])

  drawCircle = (pt) ->
    ctx.beginPath()
    ctx.arc pt.x, pt.y, pt.size, 0, Math.PI * 2, true  
    ctx.fill()
	
  update = ->
    drawCircle(i) for i in points
    ctx.fillStyle = 'rgb(256,0,0)' 
 #   ctx.clearRect 0, 0, canvas.width, canvas.height    

    drawCircle(i) for i in points
    ctx.fillStyle = 'rgb(256,256,0)' 
 #   ctx.clearRect 0, 0, canvas.width, canvas.height 

    for i in [0..nPoint]
      d = dpoints[i]
      points[i].update(d.dx, d.dy, d.dsize)  
	  

    window.requestAnimationFrame update

  window.requestAnimationFrame update
love.load = ->
	export image = love.graphics.newImage 'assets/splash_robot.png'
	image\setFilter "nearest", "nearest"

love.draw = ->
	love.graphics.draw image, 0, 0, 0, 20, 20

-------------
-- IMPORTS --
-------------

export libs = {
	bump:   require 'libs.bump'
	lily:   require 'libs.lily'
	sti:    require 'libs.sti'
	locale: require 'libs.locale'
	bitser: require 'libs.bitser'
	sock:   require 'libs.sock'
	timer:  require 'libs.hump.timer'
	state:  require 'libs.hump.gamestate'
}

import state from libs

-------------
-- ALIASES --
-------------

lg = love.graphics

------------
-- STATES --
------------

export assets = {}

states = {}

states.init = do class
	enter: =>
		state.switch states.load

states.load = do class
	enter: =>
		@rotation = 0

		lg.setBackgroundColor 63 / 255, 54 / 255, 86 / 255
		lg.setDefaultFilter "nearest", "nearest"

		@splashRobot = lg.newImage "assets/splash_robot.png"

	update: =>
		@rotation += 0.01

	draw: =>
		w, h = lg.getDimensions!
		lg.draw @splashRobot, w / 2, h / 2, 0, 5, 5

------------
-- EVENTS --
------------

love.load = ->
	state.registerEvents!
	state.switch states.init


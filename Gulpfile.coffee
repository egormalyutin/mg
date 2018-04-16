gulp     = require 'gulp'
del      = require 'del'
cmd      = require 'gulp-run'
rename   = require 'gulp-rename'
lazypipe = require 'lazypipe'

path     = require 'path'

moon = lazypipe()
	.pipe cmd, "moonc --", verbosity: 1
	.pipe rename, extname: ".lua"

gulp.task "moon", ->
	gulp.src "app/**/*.moon"
		.pipe moon()
		.pipe gulp.dest "dist"

gulp.task "lua", ->
	gulp.src "app/**/*.lua"
		.pipe gulp.dest "dist"

gulp.task "copy", ->
	gulp.src ["app/**/*", "!app/**/*.lua", "!app/**/*.moon"]
		.pipe gulp.dest "dist"

gulp.task 'build', ['moon', 'lua', 'copy']

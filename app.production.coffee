axis            = require 'axis'
rupture         = require 'rupture'
autoprefixer    = require 'autoprefixer-stylus'
js_pipeline     = require 'js-pipeline'
css_pipeline    = require 'css-pipeline'
dynamic         = require 'dynamic-content'
roots_yaml      = require 'roots-yaml'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee', out: 'js/app.js', minify: false, hash: true),
    css_pipeline(files: 'assets/css/*.styl', out: 'css/app.css', minify: false, hash: true),
    dynamic()
    roots_yaml()
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]

  locals:
    dev:  false
    base: '/sites/android-hub/'
    _:    require 'lodash'

test = require "prova"
AudioManager = require "./index.coffee"

audioManager = new AudioManager

test "can load", (t) ->
  t.plan 1
  audioManager.load "http://soundjax.com/reddo/82564%5ETazNoise01.mp3", -> t.pass "load"

test "can play", (t) ->
  t.plan 1
  audioManager.play "http://soundjax.com/reddo/82564%5ETazNoise01.mp3", -> t.pass "play"

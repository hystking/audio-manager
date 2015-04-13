# Usage

```coffee
AudioManager = require "audio-manager"
audioManager = new AudioManager

audioManager.load "path-to-resource", ->
audioManager.load ["path", "to", "resources"], ->
audioManager.play "path-to-resource", -> # will called at audio played
```

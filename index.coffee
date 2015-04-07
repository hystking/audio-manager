class Pool
  constructor: ({@url}) ->
    @pool = []

  getElement: ->
    for e in @pool
      return e if e.paused and (e.currentTime is e.duration or e.currentTime is 0)
    e = new Audio @url
    @pool.push e
    return e

module.exports = class AudioManager
  constructor: ->
    @cache = {}

  load: (urls, callback) ->
    urls = [urls] if typeof urls is "string"

    _onCanPlayThrough = do ->
      count = 0
      ->
        callback() if ++count >= urls.length

    for url in urls
      pool = new Pool url: url
      @cache[url] = pool
      audio = pool.getElement()
      audio.addEventListener "canplaythrough", _onCanPlayThrough

  play: (url, callback) ->
    pool = @cache[url] or @cache[url] = new Pool url: url
    audio = pool.getElement()
    audio.play()
    audio.addEventListener "ended", callback if callback?

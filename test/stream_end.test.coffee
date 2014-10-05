end = require '..'
through = require 'through'
through2 = require 'through2'

describe 'stream-end', ->
  describe 'given a streams2 style stream', ->
    beforeEach ->
      @source = through2()

    it 'calls end when the stream is finished', (done) ->
      @source.pipe end done
      @source.write 'foo'
      @source.end()

  describe 'given a streams1 style stream', ->
    beforeEach ->
      @source = through()

    it 'calls end callback when the stream is finished', (done) ->
      @source.pipe end done
      @source.write 'foo'
      @source.end()


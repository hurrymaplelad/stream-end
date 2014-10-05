stream-end [![NPM version](https://badge.fury.io/js/stream-end.png)](http://badge.fury.io/js/stream-end) [![Build Status](https://travis-ci.org/hurrymaplelad/stream-end.png)](https://travis-ci.org/hurrymaplelad/stream-end)
==============

Just a callback when the stream ends.  Called if the upstream is flowing with `'data'` events or using Streams2 style `read`s.

Usage
-----
I needed this for use with [gulp](https://github.com/gulpjs/gulp/), but it works with any stream.
```js
gulp.src('specs/*.spec.coffee', {read: false})
  .pipe(mocha())
  .pipe(end(function() {
    return devServer.close();
  }));
```

Why!?
-----
Can't we just use `stream.on('end', cb)`?

I wish.  Unfortunately, streams are messy.  There are at least [3 api conventions](http://stackoverflow.com/questions/21538812/what-is-streams3-in-node-js-and-how-does-it-differ-from-streams2) in node.

With some [combinations of stream versions](http://stackoverflow.com/questions/26206804/should-piped-streams-flow-by-default), the readable stream returned by pipe isn't flowing unless you manually `resume()` it.  If you just register an `'end'` listener, it may [never be called](http://stackoverflow.com/questions/26206538/why-do-some-gulp-streams-flow-by-default-while-others-do-not). If the retured stream *is* flowing, your '`end`' listner get's called just fine.  It's a brittle habit.

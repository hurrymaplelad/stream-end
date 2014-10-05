var Transform = require('stream').Transform,
    util = require('util');

function End(cb) {
  this.cb = cb;
  Transform.call(this, {objectMode: true});
}

util.inherits(End, Transform);

End.prototype._transform = function (data, enc, done) {
  done(null, data);
};

End.prototype._flush = function (done) {
  this.cb();
  done();
};

module.exports = function (cb) {
  return new End(cb);
};


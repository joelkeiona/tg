var fs = require('fs');
var util = require('util');
var path = require('path');
var stream = require('stream');
var dateFormat = require('dateformat');

/**
 * @param {string} filename
 * @param {string} [format=yyyymmdd]
 * @param {number} [timezone=0]
 * @param {string} [separator=-]
 * @constructor
 */
function DateStream(filename, format, timezone, separator) {
	stream.Writable.call(this);

	this.filename = filename;
	this.format = format || 'yyyymmdd';
	this.timezone = timezone || 0;
	this.separator = separator || '-';

	this._realPath = '';
	this._fileStream = null;

	this.on('finish', function () {
		this._fileStream.end();
	});
}

util.inherits(DateStream, stream.Writable);

DateStream.prototype._write = function (chunk, encoding, callback) {
	var fileStream = this._fileStream;
	var realPath = this._getRealPath(new Date());
	if (realPath !== this._realPath) {
		if (fileStream) {
			fileStream.end();
		}
		this._realPath = realPath;
		this._fileStream = fileStream = fs.createWriteStream(realPath, {flags: 'a'});
	}
	fileStream.write(chunk, encoding, callback);
};

DateStream.prototype._getRealPath = function (date) {
	var filename = this.filename;
	var dir = path.dirname(filename);
	var ext = path.extname(filename);
	var name = path.basename(filename, ext);
	var offsetTime = (date.getTimezoneOffset() + this.timezone * 60) * 60000;
	var dateStr = dateFormat(new Date(date.getTime() + offsetTime), this.format);
	return dir + '/' + name + this.separator + dateStr + ext;
};

/**
 * @param {string} filename
 * @param {string} [format=yyyymmdd]
 * @param {number} [timezone=0]
 * @param {string} [separator=-]
 * @constructor
 */
DateStream.getStream = function (filename, format, timezone, separator) {
	return new DateStream(filename, format, timezone, separator);
};

module.exports = DateStream;
DateStream.DateStream = DateStream;

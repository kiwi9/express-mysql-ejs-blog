const crypto = require('crypto');
const {
  salt
} = require('../config')

function md5(str) {
  const md5 = crypto.createHash('md5')

  const obj = md5.update(str + salt)

  return obj.digest('hex')
}

module.exports = md5;
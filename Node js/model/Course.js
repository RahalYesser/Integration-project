const mongoose = require('mongoose');
const Schema = mongoose.Schema;
let Course = new Schema({
  Tid: {
    type: String
  },
  Sid: {
    type: String
  },
  Sname: {
    type: String
  },
}, {
  collection: 'courses'
})
module.exports = mongoose.model('course', Course)
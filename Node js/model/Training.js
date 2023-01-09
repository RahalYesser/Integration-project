const mongoose = require('mongoose');
const Schema = mongoose.Schema;
let Training = new Schema({
  name: {
    type: String
  },
  trainerName: {
    type: String
  },
  date: {
    type: Date
  },
  description: {
    type: String
  }
}, {
  collection: 'trainings'
})
module.exports = mongoose.model('Training', Training)

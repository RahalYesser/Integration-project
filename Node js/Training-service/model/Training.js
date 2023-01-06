const mongoose = require('mongoose');
const Schema = mongoose.Schema;
let Training = new Schema({
  name: {
    type: String
  },
  date: {
    type: Date
  },
  imageUrl:{
    type: String
  },
  trainer_name: {
    type: String
  },
  description: {
    type: String
  }
}, {
  collection: 'trainings'
})
module.exports = mongoose.model('Training', Training)

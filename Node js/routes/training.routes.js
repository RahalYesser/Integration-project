const express = require('express');
const app = express();
const trainingRoute = express.Router();
let Training = require('../model/Training');

// Add Training
trainingRoute.route('/add-training').post((req, res, next) => {
    Training.create(req.body, (error, data) => {
    if (error) {
      return next(error)
    } else {
      res.json(data)
    }
  })
});

// Get all Training
trainingRoute.route('/').get((req, res) => {
    Training.find((error, data) => {
    if (error) {
      return next(error)
    } else {
      res.json(data)
    }
  })
})

// Get Training
trainingRoute.route('/read-training/:id').get((req, res) => {
    Training.findById(req.params.id, (error, data) => {
    if (error) {
      return next(error)
    } else {
      res.json(data)
    }
  })
})

// Update Training
trainingRoute.route('/update-training/:id').put((req, res, next) => {
    Training.findByIdAndUpdate(req.params.id, {
    $set: req.body
  }, (error, data) => {
    if (error) {
      return next(error);
      console.log(error)
    } else {
      res.json(data)
      console.log('Training updated successfully!')
    }
  })
})

// Delete Training
trainingRoute.route('/delete-training/:id').delete((req, res, next) => {
    Training.findByIdAndRemove(req.params.id, (error, data) => {
    if (error) {
      return next(error);
    } else {
      res.status(200).json({
        msg: data
      })
    }
  })
})
module.exports = trainingRoute;

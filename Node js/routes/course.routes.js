const express = require('express');
const app = express();
const courseRoute = express.Router();
let Course = require('../model/Course');

// Add Training
courseRoute.route('/add-course').post((req, res, next) => {
    Course.create(req.body, (error, data) => {
    if (error) {
      return next(error)
    } else {
      res.json(data)
    }
  })
});

// Get all course
courseRoute.route('/').get((req, res) => {
    Course.find((error, data) => {
    if (error) {
      return next(error)
    } else {
      res.json(data)
    }
  })
})

// Get course
courseRoute.route('/read-course/:id').get((req, res) => {
    Course.findById(req.params.id, (error, data) => {
    if (error) {
      return next(error)
    } else {
      res.json(data)
    }
  })
})

// Update course
courseRoute.route('/update-course/:id').put((req, res, next) => {
    Course.findByIdAndUpdate(req.params.id, {
    $set: req.body
  }, (error, data) => {
    if (error) {
      return next(error);
      console.log(error)
    } else {
      res.json(data)
      console.log('course updated successfully!')
    }
  })
})

// Delete course
courseRoute.route('/delete-course/:id').delete((req, res, next) => {
    Course.findByIdAndRemove(req.params.id, (error, data) => {
    if (error) {
      return next(error);
    } else {
      res.status(200).json({
        msg: data
      })
    }
  })
})
module.exports = courseRoute;

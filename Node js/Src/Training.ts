import mongoose from "mongoose";
import mongoosePaginate from "mongoose-paginate";

let trainingShema=new mongoose.Schema({
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
})

trainingShema.plugin(mongoosePaginate);

const Training=mongoose.model("Training",trainingShema);

export default Training;
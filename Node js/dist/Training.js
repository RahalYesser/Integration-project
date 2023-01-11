"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = __importDefault(require("mongoose"));
const mongoose_paginate_1 = __importDefault(require("mongoose-paginate"));
let trainingShema = new mongoose_1.default.Schema({
    name: {
        type: String,
        required: true
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
});
trainingShema.plugin(mongoose_paginate_1.default);
const Training = mongoose_1.default.model("Training", trainingShema);
exports.default = Training;

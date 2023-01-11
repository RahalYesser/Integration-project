"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const Training_1 = __importDefault(require("./Training"));
const body_parser_1 = __importDefault(require("body-parser"));
const serve_static_1 = __importDefault(require("serve-static"));
const mongoose_1 = __importDefault(require("mongoose"));
const cors_1 = __importDefault(require("cors"));
const app = (0, express_1.default)();
app.use(body_parser_1.default.json());
app.use((0, serve_static_1.default)("public"));
app.use((0, cors_1.default)());
const uri = "mongodb://127.0.0.1:27017/Trainings";
mongoose_1.default.connect(uri, (err) => {
    if (err) {
        console.log(err);
    }
    else {
        console.log("Mongo db connection sucess");
    }
});

//GetAll
app.get("/", (req, resp) => {
    Training_1.default.find((err, trainings) => {
        if (err) {
            resp.status(500).send(err);
        }
        else {
            resp.send(trainings);
        }
    });
});

//GetTraining
app.get("/read-training/:id", (req, resp) => {
    Training_1.default.findById(req.params.id, (err, training) => {
        if (err) {
            resp.status(500).send(err);
        }
        else {
            resp.send(training);
        }
    });
});

//addTraining
app.post("/add-training", (req, resp) => {
    let training = new Training_1.default(req.body);
    training.save(err => {
        if (err)
            resp.status(500).send(err);
        else
            resp.send(training);
    });
});

//updateTraining
app.put("/update-training/:id", (req, resp) => {
    Training_1.default.findByIdAndUpdate(req.params.id, req.body, (err, training) => {
        if (err)
            resp.status(500).send(err);
        else {
            resp.send("successfuly updates training");
        }
    });
});

//deleteTraining
app.delete("/delete-training/:id", (req, resp) => {
    Training_1.default.deleteOne({ _id: req.params.id }, err => {
        if (err)
            resp.status(500).send(err);
        else
            resp.send("Successfuly deleted training");
    });
});
app.listen(8700, () => {
    console.log("Server Started on port %d", 8700);
});

//paginate
app.get("/ptrainings", (req, resp) => {
    let p = parseInt(String(req.query.page || 1));
    let size = parseInt(String(req.query.size || 5));
    Training_1.default.paginate({}, { page: p, limit: size }, function (err, result) {
        if (err)
            resp.status(500).send(err);
        else
            resp.send(result);
    });
});

//search
app.get('/trainings-search', (req, resp) => {
    let p = parseInt(String(req.query.page || 1));
    let size = parseInt(String(req.query.size || 5));
    let keyword = (String(req.query.kw || ''));
    Training_1.default.paginate({ title: { $regex: ".*(?i)" + keyword + ".*" } }, { page: p, limit: size }, function (err, result) {
        if (err)
            resp.status(500).send(err);
        else
            resp.send(result);
    });
});

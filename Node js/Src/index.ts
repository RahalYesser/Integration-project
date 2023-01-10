import express, {Request,Response} from 'express';
import Training from "./Training";
import bodyParser from "body-parser";
import serverStatic from "serve-static";
import mongoose from "mongoose";
import cors from "cors";

const app=express();
app.use(bodyParser.json());
app.use(serverStatic("public"));
app.use(cors());
const uri:string="mongodb://127.0.0.1:27017/Trainings";
mongoose.connect(uri,(err)=>{
    if(err){ console.log(err);}
    else{console.log("Mongo db connection sucess");}
});


//GetAll
app.get("/",(req:Request,resp:Response)=>{
    Training.find((err,trainings)=>{
        if(err){resp.status(500).send(err);}
        else{resp.send(trainings);}
    })
});

//Gettraining
app.get("/training/:id",(req:Request,resp:Response)=>{
    Training.findById(req.params.id,(err: any,training: any)=>{
        if(err){resp.status(500).send(err);}
        else{resp.send(training);}
    });
});

//addTraining
app.post("/add-training",(req:Request,resp:Response)=>{
    let training=new Training(req.body);
    training.save(err=>{
        if(err) resp.status(500).send(err);
        else resp.send(training);
    })
});

//update
app.put("/update-training/:id",(req:Request,resp:Response)=>{
    Training.findByIdAndUpdate(req.params.id,req.body,(err: any,training: any)=>{
        if(err) resp.status(500).send(err);
        else{
            resp.send("successfuly updates training")
        }
    });
});

//delete
app.delete("/delete-training/:id",(req:Request,resp:Response)=>{
    Training.deleteOne({_id:req.params.id},err=>{
        if(err) resp.status(500).send(err);
        else resp.send("Successfuly deleted training");
    });
});

app.listen(8700,()=>{
    console.log("Server Started on port %d",8700);
});
app.get("/ptrainings",(req:Request,resp:Response)=>{
    let p:number=parseInt(String(req.query.page || 1));
    let size:number=parseInt(String(req.query.size || 5));
    Training.paginate({},{page:p,limit:size},function(err,result){
        if(err) resp.status(500).send(err);
        else resp.send(result);
    });
});

app.get('/trainings-search',(req:Request,resp:Response)=>{
    let p:number=parseInt(String(req.query.page || 1));
    let size:number=parseInt(String(req.query.size || 5));
    let keyword:String=(String(req.query.kw || ''));
    Training.paginate({title:{$regex:".*(?i)"+keyword+".*"}},{page:p,limit:size},function(err,result){
        if(err) resp.status(500).send(err);
        else resp.send(result);
    });
});

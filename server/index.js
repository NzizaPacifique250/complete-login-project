// imports from package
const express= require('express');
const mongoose = require('mongoose');
var cors = require('cors')


//Imports from  other files in the app.
const authRouter = require("./routes/auths")

//define a host & define express into a variable
const PORT= 3000;
const app = express();
const DB = "mongodb+srv://nziza:abc!123@cluster0.0uoq9bl.mongodb.net/"
// To be able to make client communicating with serve we use MIDDLEWARE
app.use(cors())
app.use(express.json());
app.use(authRouter);



// Connect with out database
mongoose.connect(DB)
    .then(()=>{console.log('Connected successfully')})
    .catch((err)=>{console.log(`DB connection error: ${err}`)});

app.listen(PORT,()=>{console.log(`Server is running on port, ${PORT}`)})

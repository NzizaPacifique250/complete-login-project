// imports from package
const express= require('express');

//Imports from  other files in the app.
const authRouter = require("./routes/auths")

//define a host & define express into a variable
const PORT= 3000;
const app = express();

// To be able to make client communicating with serve we use MIDDLEWARE
app.use(authRouter);

app.listen(PORT,"0.0.0.0",()=>{console.log(`Server is running on port, ${PORT}`)})

// Note: There reason what we use this IP address [0.0.0.0] 
// is because if you are using the mobile at some case the android might not be able to run. It for the debuging purpose

// Imports packages 
// Note: To import packages we define a variable and add require('<name_of_package>')
const express = require('express');

// Variable initialization
const authRouter = express.Router();

// Creates routes

// The following shows how to get data from the  database using the 'get' method in Express.

 /* 
    authRouter.get( '/', (req, res) => {
        res.send('Welcome to our first page made in nodejs')]
        }); 
*/

// How to post data to the database and send response message to the client

authRouter.post( '/signup', (req,res)=>{
    // This is how to make be know the expected  datatype for req.body
    const {email,password}= req.body;

/*
    const username = req.body.username;
    if(username === "admin"){
      return res.json({success : true, message:"You are logged in"});}
})
            .then((response)=>{})   // What happens when request is successful
            .catch((error)=>{});         // What happens if there is an error with the request

*/


// Note: Variable declared in their own file are considered to be private to make
// them accissible into the whole application you will need to export them using [module.exports]
module.exports = authRouter;

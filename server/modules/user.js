const mongoose = require("mongoose");

const userSchema = mongoose.Schema({ // Schema is like structure  of data in MongoDB

    name: {
        required: true,
        type: String,
        trim: true
    },
    email:{
        required: true,
        type: String,
        trim: true,
        validate:{
        validator: (value) =>{
            let  regExp =   /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(regExp);
        },
        message: 'Please enter valid email',
    }
    },
    password: {
        required: true,
        type: String,
    },
    address: {
        type:String, 
        default: "",
    },
    type:{
        type:String,
        default: "user" // admin or user
    },
    
});

const User = mongoose.model( "User", userSchema );
module.exports= User;

var express=require('express');
var mysql=require('mysql');
var cors=require('cors');
const { json } = require('express');
var app=express();

app.use(express.urlencoded({extended:false}));
app.use(express(json))


app.set('view engine','ejs')
app.use('/',require('./router'));



app.listen(3000,function(){
    console.log('servidor ok');
});
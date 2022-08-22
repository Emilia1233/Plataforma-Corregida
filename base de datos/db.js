const mysql=require('mysql');

const conexion=mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'45089282',
    database:'aulavirtual_db'
})

conexion.connect((error)=>{
    if(error){
        throw error;
    }else{
        console.log('conexion de diez')
    }
})

module.exports=conexion;
const express=require('express');
const router=express.Router();
const conexion=require('./base de datos/db')
router.get('/',(req,res)=>{
   
    conexion.query('SELECT*FROM usuario',(error,results)=>{;
    if(error){
        throw error;
    }else{
        res.render('index',{results:results});
    }
})
    
})





//funcion para editar
router.get('/editar/:id_materia',(req,res)=>{
    const id_materia =req.params.id_materia;
    
    conexion.query('SELECT * FROM notas WHERE id_materia= ?',[id_materia],(error,results)=>{
        if(error){
            throw error;
        }else{
            res.render('editar',{notas:results[0]});

        }
    })
});

//funcion para borrar
router.get('/borrar/:id_materia',(req,res)=>{
    const id_materia=req.params.id_materia;
    conexion.query('DELETE FROM notas WHERE id_materia= ?',[id_materia],(error,results)=>{
        if(error){
            throw error;
        }else{
            res.redirect('/cursos');

        }
    })
})

//administrador
router.get('/admi_lib',(req,res)=>{
   
    conexion.query('SELECT*FROM usuario',(error,results)=>{;
    if(error){
        throw error;
    }else{
        res.render('admi_lib',{results:results});
    }
})
})

//LIBRETA ALUMNO ******CREAR RUTA**********

router.get('/libreta',(req,res)=>{
   
    conexion.query('SELECT materias.nombre_materia,notas.primer_t,notas.segundo_t,notas.tercer_t,notas.promedio FROM materias INNER JOIN notas on materias.id_materia=notas.id_materia; ',(error,results)=>{;
    if(error){
        throw error;
    }else{
        res.render('libreta',{results:results});
    }
})
})




    
router.get('/menu_alumno', (req, res)=>{
    conexion.query('SELECT*FROM materias  ',(error, results)=>{;
        if(error){
            throw error;
        }else{
            res.render('menu_alumno',{results:results});
        }

    })
})

//RUTA PARA VER MATERIAS DESAPROBADAS ******CREAR RUTA**********
router.get('/desaprobadas', (req, res)=>{
    conexion.query('SELECT materias.nombre_materia,notas.primer_t,notas.segundo_t,notas.tercer_t,notas.promedio FROM materias INNER JOIN notas on materias.id_materia=notas.id_materia where promedio< 6;', (error, results)=>{;
        if(error){
            throw error;
        }else{
            res.render('desaprobadas',{results:results});
        }

    })
})

//RUTA PARA VER MATERIAS APROBADAS ******CREAR RUTA**********
router.get('/aprobadas', (req, res)=>{
    conexion.query('SELECT materias.nombre_materia,notas.primer_t,notas.segundo_t,notas.tercer_t,notas.promedio FROM materias INNER JOIN notas on materias.id_materia=notas.id_materia where promedio>=6;', (error, results)=>{;
        if(error){
            throw error;
        }else{
            res.render('aprobadas',{results:results});
        }

    })
})

//admin 
router.get('/admi_lib', (req, res)=>{
    conexion.query('SELECT*FROM materias  ',(error, results)=>{;
        if(error){
            throw error;
        }else{
            res.render('admi_lib',{results:results});
        }

    })
})


//admin-seleccionar curso
router.get('/cursos',(req,res)=>{
   
    conexion.query('SELECT alumno.curso from alumno',(error,results)=>{;
    if(error){
        throw error;
    }else{
        res.render('cursos',{results:results});
    }
})
    
})

//funcion para mostrar alumnos del curso seleccionado al administrador
router.get('/curso_select/:curso',(req,res)=>{
    const curso =req.params.curso;
    conexion.query('SELECT * FROM alumno WHERE curso= ? ',[curso],(error,results)=>{
        if(error){
            throw error;
        }else{
            res.render('curso_select',{results:results});

        }
    })
});

////funcion para mostrar alumnos seleccionado al administrador
router.get('/admi_lib/:id_a',(req,res)=>{
    const id_a =req.params.id_a;
    conexion.query('SELECT alumno.nombre, alumno.apellido, materias.nombre_materia, notas.primer_t, notas.segundo_t, notas.tercer_t, notas.promedio,notas.id_materia FROM alumno inner join notas ON alumno.id_a = notas.id_a INNER JOIN materias On notas.id_materia=materias.id_materia where alumno.id_a= ? ',[id_a],(error,results)=>{
        if(error){
            throw error;
        }else{
            res.render('admi_lib',{results:results});

        }
    })
});

router.get('/agre_mat',(req,res)=>{
   
    conexion.query('SELECT materias.nombre_materia FROM materias',(error,results)=>{;
    if(error){
        throw error;
    }else{
        res.render('agre_mat',{results:results});
    }
})
    
})

router.get('/agregar_matexalu/:id_materia',(req,res)=>{
    const id_materia=req.params.id_materia
   
    conexion.query('SELECT notas.primer_t,notas.segundo_t,notas.tercer_t,notas.promedio FROM notas where id_materia=? ',[id_materia],(error,results)=>{;
    if(error){
        throw error;
    }else{
        res.render('agregar_matexalu',{results:results});
    }
})
    
})
   



//crud
const crud=require('./controllers/crud');
router.post('/save_materia',crud.save_materia);
router.post('/update',crud.update);
router.post('/save_nota',crud.save_nota);



module.exports=router;
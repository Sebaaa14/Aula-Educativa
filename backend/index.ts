import { error } from "console";

const express = require('express');
const cors = require('cors');
const mysql = require('mysql2')
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const { v4: uuidv4 } = require('uuid');
const PORT = 9000;
const app = express();

const secretKey = 'mi_clave_secreta';

app.use(cors());
app.use(express.json());

app.listen(PORT, () => {
    console.log(`Server is running on port: ${PORT}`);
});

// Conexión al pool de bases de datos
const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "aula_educativa",
    port: 3306
})

//Get de alumnos
app.get('/alumnos', (req: any, res: any) => {
    pool.query("select * from alumnos", (error: any, results: any) => {
        if (error) {
            console.error(error);
            res.status(500).send("error en el server :c");
        } else {
            const response = {
                status: 'éxito',
                message: 'Data retrieved successfully',
                data: results
            }
            res.status(200).json(response);
        }
    })
});

//Get de docentes
app.get('/docentes', (req: any, res: any) => {
    pool.query("select * from docentes", (error: any, results: any) => {
        if (error) {
            console.error(error);
            res.status(500).send("error en el server :c");
        } else {
            const response = {
                status: 'éxito',
                message: 'Data retrieved successfully',
                data: results
            }
            res.status(200).json(response);
        }
    })
});

//Mi perfil
app.get('/miPerfil', (req: any, res: any) => {
    pool.query("SELECT id_alumno FROM login ORDER BY hora DESC LIMIT 1", (error: any, resultsLogin: any) => {
        if (error) {
            console.error(error);
            res.status(500).send("error en el servidor :c");
        } else {
            // Caso donde sí se encuentra el id
            const idAlumno = resultsLogin[0].id_alumno;
            // Segunda query 
            pool.query(`SELECT * FROM alumnos WHERE id_alumno = ${idAlumno}`, (error: any, resultsAlumnos: any) => {
                if (error) {
                    console.error("Error:", error);
                    res.status(500).send("El alumno no se encuentra");
                } else {
                    const miPerfil = {
                        status: 'éxito',
                        message: 'Alumno encontrado',
                        data: resultsAlumnos
                    }
                    res.status(200).json(miPerfil);
                }
            });
        }
    });
});

//Post para registrar alumno
app.post("/registrarAlumno", (req: any, res: any) => {

    const { nombre, rut_alumno, curso, colegio, contrasena, apoderado, rut_apoderado, email, telefono } = req.body;

    bcrypt.hash(contrasena, 1, (error: any, hash: any) => {
        if (error) {
            console.error(error);
            hash.status(500).send("error hasheando password")
        } else {
            pool.query(
                "insert into alumnos (nombre,rut_alumno,curso,colegio,contrasena,apoderado,rut_apoderado,email,telefono) VALUES (?,?,?,?,?,?,?,?,?)",
                [nombre, rut_alumno, curso, colegio, hash, apoderado, rut_apoderado, email, telefono],
                (error: any, results: any) => {
                    if (error) {
                        console.error(error);
                        res.status(500).send("error insertando en el server :c");
                    } else {
                        const response = {
                            status: 'exito',
                            message: 'se insertaron los datos bien',
                            data: results
                        }
                        res.status(200).json(response);
                    }
                }
            );
        }
    });
});

//Registrar docente
app.post("/registrarDocente", (req: any, res: any) => {
    const { nombre, email, horario,rol } = req.body;
            pool.query(
                "insert into docentes (nombre,email,horario,rol) VALUES (?,?,?,?)",
                [nombre,email,horario,rol],
                (error: any, results: any) => {
                    if (error) {
                        console.error(error);
                        res.status(500).send("error insertando en el server :c");
                    } else {
                        const response = {
                            status: 'exito',
                            message: 'se insertaron los datos bien',
                            data: results
                        }
                        res.status(200).json(response);
                    }
                }
            );
});

//Post para iniciar sesion
app.post("/iniciarSesion", (req: any, res: any) => {
    const { rut_alumno, contrasena } = req.body;

    // Verificar si es administrador
    pool.query(
        "SELECT * FROM administradores WHERE rut = ? AND contrasena = ?",
        [rut_alumno, contrasena],
        (error: any, results: any) => {
            if (error) {
                console.error(error);
                res.status(500).send("Error consultando en el servidor");
            } else if (results.length > 0) {
                // Es un administrador
                const admin = results[0];
                const response = {
                    status: "exito",
                    message: "Inicio de sesión exitoso como administrador",
                    data: admin,
                    token: jwt.sign({ rut_alumno, rol: "admin" }, secretKey, { expiresIn: '1h' })
                };
                res.status(200).json(response);
            } else {
                // No es un administrador, verificar como usuario normal
                pool.query(
                    "SELECT * FROM alumnos WHERE rut_alumno = ?",
                    [rut_alumno],
                    (error: any, results: any) => {
                        if (error) {
                            console.error(error);
                            res.status(500).send("Error consultando en el servidor");
                        } else if (results.length === 0) {
                            res.status(404).send("El alumno no existe");
                        } else {
                            const alumno = results[0];

                            // Comparar la contraseña ingresada con el hash almacenado en la base de datos
                            bcrypt.compare(contrasena, alumno.contrasena, (compareError: any, isMatch: boolean) => {
                                if (compareError) {
                                    console.error(compareError);
                                    res.status(500).send("Error comparando las claves");
                                } else if (!isMatch) {
                                    res.status(400).send("La clave ingresada es incorrecta");
                                } else {
                                    
                                    const response = {
                                        status: "exito",
                                        message: "Inicio de sesión exitoso",
                                        data: alumno,
                                        token: jwt.sign({ rut_alumno, rol:"usuario" }, secretKey, { expiresIn: '1h' })
                                    };

                                    // Para insertar en la tabla de login
                                    const fechaActual: Date = new Date();
                                    pool.query(
                                        "INSERT INTO login (id_alumno, hora, token) VALUES (?,?,?)",
                                        [alumno.id_alumno, fechaActual, response.token],
                                        function (error: any, results: any, fields: any) {
                                            console.log("Datos insertados en la tabla log");
                                        }
                                    );

                                    res.status(200).json(response);
                                }
                            });
                        }
                    }
                );
            }
        }
    );
});



// Middleware para autenticación
function authenticateToken(req: any, res: any, next: any) {
    const token = req.headers.authorization;

    if (!token) {
        return res.status(401).send('Token de autenticación no proporcionado');
    }

    const tokenWithoutBearer = token.split(' ')[1]; // Elimina el prefijo "Bearer" del token

    jwt.verify(tokenWithoutBearer, secretKey, (error: any, decoded: any) => {
        if (error) {
            return res.status(403).send('Token de autenticación inválido');
        }
        req.user = decoded; // Almacena la información del usuario decodificada en el objeto de solicitud
        next();
    });
}

//put para recuperar Contraseña
app.put("/recuperarContrasena", (req: any, res: any) => {
    const { rut_alumno, contrasena, recontrasena } = req.body;

    pool.query("SELECT * FROM alumnos WHERE rut_alumno=?", [rut_alumno], function (error: any, results: any, fields: any) {
        if (error) {
            console.log(error);
            res.send({ "mensaje": false, "resultado": "" });
            return;
        }

        if (results.length > 0) {
            if (results[0].rut_alumno == rut_alumno) {
                console.log("Nombre alumno: ", results[0].nombre);

                if (contrasena === recontrasena) {

                    bcrypt.hash(contrasena, 1, (error: any, hash: any) => {
                        pool.query("UPDATE alumnos SET contrasena = ? WHERE rut_alumno = ?", [hash, rut_alumno], function (error: any, results: any, fields: any) {
                            if (error) {
                                console.log(error);
                                res.send({ "mensaje": false, "resultado": "no se concreto" });
                            } else {
                                console.log("actualizada");
                                res.send(JSON.stringify({ mensaje: true, resultado: 'Contraseña actualizada' }));
                            }
                        });
                    });
                } else {
                    res.send(JSON.stringify({ mensaje: false, resultado: 'Las contraseñas no coinciden' }));
                }
            }
        } else {
            res.send(JSON.stringify({ mensaje: false, resultado: 'Usuario no registrado' }));
        }
    });
});

//Get del horario del alumno
app.get('/horario', (req: any, res: any) => {
    pool.query("Select id_alumno from login order by hora desc limit 1", (error: any, resultsHorario: any) => {
        if (error) {
            console.error(error);
            res.status(500).send("error en el servidor :c");
        } else {
            // Caso donde sí se encuentra el id
            const idAlumno = resultsHorario[0].id_alumno;
            // Segunda query 
            pool.query(`SELECT * FROM horarios where id_alumno = ${idAlumno}`, (error: any, resultadoHorario: any) => {
                if (error) {
                    console.error(error);
                    res.status(500).send("error en el servidor :c");
                } else {
                    const horario = {
                        status: 'éxito',
                        message: 'Horario cargado',
                        data: resultadoHorario
                    }
                    res.status(200).json(horario);
                }
            });
        }
    })
});

//Get de las notas del alumno
app.get('/notas', (req: any, res: any) => {
    pool.query("Select id_alumno from login order by hora desc limit 1", (error: any, resultsNotas: any) => {
        if (error) {
            console.error(error);
            res.status(500).send("error en el servidor :c");
        } else {
            // Caso donde sí se encuentra el id
            const idAlumno = resultsNotas[0].id_alumno;
            // Segunda query 
            pool.query(`SELECT * FROM notas where id_alumno = ${idAlumno}`, (error: any, resultadoNotas: any) => {
                if (error) {
                    console.error(error);
                    res.status(500).send("error en el servidor :c");
                } else {
                    const notas = {
                        status: 'éxito',
                        message: 'Notas cargadas',
                        data: resultadoNotas
                    }
                    res.status(200).json(notas);
                }
            });
        }
    })
});

//Mi perfil
app.get('/miPerfil', (req: any, res: any) => {
    pool.query("SELECT id_alumno FROM login ORDER BY hora DESC LIMIT 1", (error: any, resultsLogin: any) => {
        if (error) {
            console.error(error);
            res.status(500).send("error en el servidor :c");
        } else {
            // Caso donde sí se encuentra el id
            const idAlumno = resultsLogin[0].id_alumno;
            // Segunda query 
            pool.query(`SELECT * FROM alumnos WHERE id_alumno = ${idAlumno}`, (error: any, resultsAlumnos: any) => {
                if (error) {
                    console.error("Error:", error);
                    res.status(500).send("El alumno no se encuentra");
                } else {
                    const miPerfil = {
                        status: 'éxito',
                        message: 'Alumno encontrado',
                        data: resultsAlumnos
                    }
                    res.status(200).json(miPerfil);
                }
            });
        }
    });
});

//Get del bloque horario
app.get('/bloqueHorario', (req: any, res: any) => {
    //Solo nos da la hora y minutos, un poco raro pero lo pille por ahi xdd
    pool.query("SELECT TIME_FORMAT(hora_inicio, '%H:%i') AS hora_inicio, TIME_FORMAT(hora_fin, '%H:%i') AS hora_fin FROM horariosbloques;", (error: any, resultadoHorario: any) => {
        if (error) {
            console.error(error);
            res.status(500).send("error en el servidor :c");
        } else {
            const bloqueHorario = {
                status: 'éxito',
                message: 'Horario cargado',
                data: resultadoHorario
            }
            res.status(200).json(bloqueHorario);
        }
    });
});

//Eliminar alumno
app.delete("/eliminarAlumno/:rut_alumno", (req:any, res:any) => {
    const alumno = req.params.rut_alumno;
    pool.query(
      "DELETE FROM alumnos WHERE rut_alumno = ?",
      [alumno],
      (error:any, results:any) => {
        if (error) {
          console.error(error);
          res.status(500).json({ error: "Error eliminando al alumno" });
        } else if (results.affectedRows === 0) {
          res.status(404).json({ error: "El alumno no existe" });
        } else {
          res.status(200).json({ message: "Alumno eliminado correctamente" });
        }
      }
    );
  });
  
  //Eliminar docente
  app.delete("/eliminarDocente/:id_profesor", (req:any, res:any) => {
    const docente = req.params.id_profesor;
    console.log(docente);
    pool.query(
      "DELETE FROM docentes WHERE id_profesor = ?",
      [docente],
      (error:any, results:any) => {
        if (error) {
          console.error(error);
          res.status(500).json({ error: "Error eliminando al docente" });
        } else if (results.affectedRows === 0) {
          res.status(404).json({ error: "El docente no existe" });
        } else {
          res.status(200).json({ message: "Docente eliminado correctamente" });
        }
      }
    );
  });
  

const express = require('express');
const cors = require('cors');
const mysql = require('mysql2')
const bcrypt = require("bcrypt");
const PORT = 9000;

const app = express();

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

//Post para iniciar sesion
app.post("/iniciarSesion", (req: any, res: any) => {
    const { rut_alumno, contrasena } = req.body;

    pool.query(
        "SELECT * FROM alumnos WHERE rut_alumno = ?",
        [rut_alumno],
        (error: any, results: any) => {
            if (error) {
                console.error(error);
                res.status(500).send("error consultando en el servidor");
            } else if (results.length === 0) {
                res.status(404).send("El alumno no existe");
            } else {
                const alumno = results[0];

                // Comparar la contraseña ingresada con el hash almacenado en la base de datos
                bcrypt.compare(contrasena, alumno.contrasena, (compareError: any, isMatch: boolean) => {
                    if (compareError) {
                        console.error(compareError);
                        res.status(500).send("error comparando las claves");
                    } else if (!isMatch) {
                        res.status(400).send("La clave ingresada es incorrecta");
                    } else {
                        const response = {
                            status: "exito",
                            message: "Inicio de sesión exitoso",
                            data: alumno
                        };
                        res.status(200).json(response);

                        //para insertar en la table de login
                        const fechaActual: Date = new Date();
                        pool.query("insert into login (id_alumno, hora) VALUES (?,?)", [alumno.id_alumno, fechaActual], function (error: any, results: any, fields: any) {
                            console.log("Datos insertados en la tabla log");
                        });
                    }
                });
            }
        }
    );
});

//Post para recuperar Contraseña
app.post("/recuperarContrasena", (req: any, res: any) => {
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



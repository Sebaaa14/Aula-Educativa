"use strict";
const express = require('express');
const cors = require('cors');
const mysql = require('mysql2');
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
});
//Get de alumnos
app.get('/alumnos', (req, res) => {
    pool.query("select * from alumnos", (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).send("error en el server :c");
        }
        else {
            const response = {
                status: 'éxito',
                message: 'Data retrieved successfully',
                data: results
            };
            res.status(200).json(response);
        }
    });
});
//Get de docentes
app.get('/docentes', (req, res) => {
    pool.query("select * from docentes", (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).send("error en el server :c");
        }
        else {
            const response = {
                status: 'éxito',
                message: 'Data retrieved successfully',
                data: results
            };
            res.status(200).json(response);
        }
    });
});
//Post para registrar alumno
app.post("/registrarAlumno", (req, res) => {
    console.log("valor de req.body: ", req.body);
    const { nombre, rut_alumno, curso, colegio, contrasena, apoderado, rut_apoderado, email, telefono } = req.body;
    bcrypt.hash(contrasena, 1, (error, hash) => {
        if (error) {
            console.error(error);
            hash.status(500).send("error hasheando password");
        }
        else {
            pool.query("insert into alumnos (nombre,rut_alumno,curso,colegio,contrasena,apoderado,rut_apoderado,email,telefono) VALUES (?,?,?,?,?,?,?,?,?)", [nombre, rut_alumno, curso, colegio, hash, apoderado, rut_apoderado, email, telefono], (error, results) => {
                if (error) {
                    console.error(error);
                    res.status(500).send("error INSERTando en el server :c");
                }
                else {
                    const response = {
                        status: 'exito',
                        message: 'se insertaron los datos bien',
                        data: results
                    };
                    res.status(200).json(response);
                }
            });
        }
    });
});

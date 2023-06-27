-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2023 a las 04:21:21
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aula_educativa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(11) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `rut`, `contrasena`) VALUES
(1, '10101010-1', 'admin1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `rut_alumno` varchar(200) NOT NULL,
  `curso` varchar(200) NOT NULL,
  `colegio` varchar(200) NOT NULL,
  `contrasena` varchar(200) NOT NULL,
  `apoderado` varchar(200) NOT NULL,
  `rut_apoderado` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Almacenamiento de los datos del alumno';

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nombre`, `rut_alumno`, `curso`, `colegio`, `contrasena`, `apoderado`, `rut_apoderado`, `email`, `telefono`) VALUES
(1, 'Nathalia Trigo', '20919909-2', '4º', 'El Olivar', '$2b$04$QtbIwUzEheu/umBvDDWEmesH4UQi.P33rIs7JCeKOqJNWzh/55QqS', 'Diego Duran', '1356478-2', 'nathaliatrigo@gmail.com', '976789234'),
(2, 'Sebastián Valdés', '20986948-9', '5º', 'Forestal', '$2b$04$xuHVdOHZx1hyXlH5YQnSEeQZWo9YVnlwdIoOwgNhBvFmLoTzZR2iS', 'Matías Fernández', '15560982-7', 'juancitoperez@gmail.com', '971972252'),
(3, 'Elpepe', '20986948-5', '5º', 'Ñuñoacity', '$2b$04$xjpjYXF3PEDtXkDcNuCcD.S91cr2rIhopK1av0IJXXjDuHxCcao9S', 'El juancin', '15560875.3', 'pepinbombin@gmail.com', '971971242');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id_profesor` int(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `horario` varchar(200) NOT NULL,
  `rol` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id_profesor`, `nombre`, `email`, `horario`, `rol`) VALUES
(1, 'María Castellana', 'maria.castellana@mail.edu.cl', 'Lunes a Jueves 14:30 - 15:30', 'Profesora de Matemáticas'),
(2, 'Mario Orellana', 'mario.orellana@mail.edu.cl', 'Lunes a Jueves 12.30 - 13.30', 'Profesor de Historia'),
(3, 'José Zamudio', 'jose.zamudio@mail.edu.cl', 'Lunes 16:30 - 18.30', 'Profesor de Filosofía'),
(4, 'Juan José Mora', 'juanjose.mora@mail.edu.cl', 'Lunes y Martes 14:30 - 15:30', 'Profesor de Educación Física'),
(5, 'Nicolás Castellón', 'nicolas.castellon@mail.edu.cl', 'Martes a Jueves 14:30 - 15:30', 'Profesor de Ingles'),
(6, 'Juliana Valdivieso', 'juliana.valdivieso@mail.edu.cl', 'Jueves 13:00 - 15:30', 'Profesora de Física'),
(8, 'Martina perez', 'martina.perez@mail.edu.cl', 'Lunes a viernes 14:30', 'Profesor jefe'),
(10, 'matias sanchez', 'asdklas@gmail.com', 'Miercoles 14:30', 'Profesor de clases');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL,
  `dia` varchar(255) DEFAULT NULL,
  `id_bloque` int(11) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `nombre_clase` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id_horario`, `dia`, `id_bloque`, `id_alumno`, `nombre_clase`) VALUES
(1, 'Lunes', 1, 2, 'Lenguaje'),
(2, 'Jueves', 1, 2, 'Matemáticas'),
(3, 'Viernes', 3, 2, 'Filosofía'),
(4, 'Martes', 4, 2, 'Física'),
(5, 'Jueves', 1, 1, 'Matematicas'),
(6, 'Lunes', 4, 1, 'Filosofia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariosbloques`
--

CREATE TABLE `horariosbloques` (
  `id_bloque` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horariosbloques`
--

INSERT INTO `horariosbloques` (`id_bloque`, `hora_inicio`, `hora_fin`) VALUES
(1, '08:00:00', '09:30:00'),
(2, '09:45:00', '11:15:00'),
(3, '11:30:00', '13:00:00'),
(4, '14:00:00', '15:30:00'),
(5, '15:45:00', '17:15:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id_alumno` int(200) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `hora` varchar(200) NOT NULL,
  `token` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id_alumno`, `id_admin`, `hora`, `token`) VALUES
(2, 0, '2023-06-26 21:36:44.220', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4Mjk4MDQsImV4cCI6MTY4NzgzMzQwNH0.UGckIfGvus5e6CtgG2DNWhmVrdF107fX4vrlk4v6l9k'),
(2, 0, '2023-06-26 21:39:39.052', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4Mjk5NzksImV4cCI6MTY4NzgzMzU3OX0.0VeYKAZ25kmPOYhAgwIqS5l47Wddjc4iMUDY_IZFOtc'),
(0, 1, '2023-06-26 21:43:30.672', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMTAxMDEwMTAtMSIsInJvbCI6ImFkbWluIiwiaWF0IjoxNjg3ODMwMjEwLCJleHAiOjE2ODc4MzM4MTB9.CfMwaOL3UyivgW7LAZSCRm5knav1gVMiO6sGWpWPTSM'),
(2, 0, '2023-06-26 21:47:20.312', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4MzA0NDAsImV4cCI6MTY4NzgzNDA0MH0.MLwsB5uu4fcnlV2pF6uDmhOz72bjQzYzf2KyMDWcO-U'),
(2, 0, '2023-06-26 21:54:02.694', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4MzA4NDIsImV4cCI6MTY4NzgzNDQ0Mn0.MewhKsYrY23cp55rV8jntlaHC9FvnpTwLpBd4MeY9Bg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_alumno` int(11) NOT NULL,
  `asignatura` varchar(50) NOT NULL,
  `nota` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_alumno`, `asignatura`, `nota`) VALUES
(1, 'Lenguaje', 55),
(1, 'Matemáticas', 40),
(2, 'Matemáticas', 52),
(2, 'Lenguaje', 20),
(2, 'Matemáticas', 70),
(2, 'Matemáticas', 70);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id_profesor`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `ID_Bloque` (`id_bloque`),
  ADD KEY `ID_Alumno` (`id_alumno`);

--
-- Indices de la tabla `horariosbloques`
--
ALTER TABLE `horariosbloques`
  ADD PRIMARY KEY (`id_bloque`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD KEY `id_alumno` (`id_alumno`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id_profesor` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_bloque`) REFERENCES `horariosbloques` (`ID_Bloque`),
  ADD CONSTRAINT `horarios_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

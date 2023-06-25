-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2023 a las 03:00:47
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
(3, 'Elpepe', '20986948-5', '5º', 'Ñuñoacity', '$2b$04$xjpjYXF3PEDtXkDcNuCcD.S91cr2rIhopK1av0IJXXjDuHxCcao9S', 'El juancin', '15560875.3', 'pepinbombin@gmail.com', '971971242'),
(4, 'housh nasi', '15560328-3', '4º', 'El santiago', '$2b$04$vpn1.cMjnW7M8qXxObcLPuk2N5Ak7Q39a.R7/suRRmCuPH9F9gQ1K', 'Juanito alcachofa', '20986948-9', 'sebastian@gmail.com', '123456789'),
(5, 'housh nasi', '15560328-3', '4º', 'El santiago', '$2b$04$Kw5PYq6KyqQxQGK5LWou2uydo3LsloSagNRVeSmW66yIONq/fNm32', 'Juanito alcachofa', '20986948-9', 'sebastian@gmail.com', '123456789'),
(6, 'housh nasi', '15560328-3', '4º', 'El santiago', '$2b$04$o3fJ82M5ZKnCLFWp34yigeEF5ahGPQmZVmFI27tQBkzTZmnmjTe4i', 'Juanito alcachofa', '20986948-9', 'sebastian@gmail.com', '123456789'),
(7, 'housh nasi', '15560328-3', '4º', 'El santiago', '$2b$04$YfDt6qy1sMcLfZN/0/NYnemNPo2uXANTUwYsOe8g5ZwbpEh3afFii', 'Juanito alcachofa', '20986948-9', 'sebastian@gmail.com', '123456789'),
(8, 'housh nasi', '15560328-3', '4º', 'El santiago', '$2b$04$c4I732QlRrpXhi/FkkJ53.4VQVzKSRaaIWlFOim2pTkfsBrauVE1K', 'Juanito alcachofa', '20986948-9', 'sebastian@gmail.com', '123456789'),
(9, 'housh nasi', '15560328-3', '4º', 'El santiago', '$2b$04$7NxJ4BR8tBuN1V/aCjhXs.dqAl8L9idjmbvavPk87Ft7Srzs40mnW', 'Juanito alcachofa', '20986948-9', 'sebastian@gmail.com', '123456789'),
(10, 'housh nasi', '15560328-3', '4º', 'El santiago', '$2b$04$hPsu4I82XvbH.amoD7vKhue/rd0x0x2yf32R3jh/nawVZj.4KxZgG', 'Juanito alcachofa', '20986948-9', 'sebastian@gmail.com', '123456789'),
(11, 'housh nasi', '15560328-3', '4º', 'El santiago', '$2b$04$H0kTA3UD1a4qYKNmiP6ZoOiWfqIh5U3/.SCwXNkqfTcJqUS990dyy', 'Juanito alcachofa', '20986948-9', 'sebastian@gmail.com', '123456789'),
(12, 'housh nasi', '15560328-3', '4º', 'El santiago', '$2b$04$VlkfhL2Jf9h8N5bAQ/eyPuqIHU.dcJY.t7Q8/a446NmH1DQdS7bsW', 'Juanito alcachofa', '20986948-9', 'sebastian@gmail.com', '123456789'),
(13, 'matias tilin', '209869848-9', '4º', 'sdasdsa', '$2b$04$ShhPnGJzyV44VlFPa.J0PO9owMg59QwlWsnkBkV6boslOe68vCQgu', 'sdasd asdas', '123456489-9', 'asdas@gmail.com', '123456789');

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
(5, 'Nicolás Castellón', 'nicolas.castellon@mail.edu.cl', 'Martes a Jueves 14:30 - 15:30', 'Martes a Jueves 14:30 - 15:30'),
(6, 'Juliana Valdivieso', 'juliana.valdivieso@mail.edu.cl', 'Jueves 13:00 - 15:30', 'Profesora de Física');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id_alumno` int(200) NOT NULL,
  `hora` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id_alumno`, `hora`) VALUES
(2, '2023-06-24 19:02:53.620'),
(1, '2023-06-24 19:04:20.633'),
(2, '2023-06-24 20:49:57.853'),
(1, '2023-06-24 20:53:13.487'),
(2, '2023-06-24 20:54:34.908'),
(2, '2023-06-24 20:54:55.074'),
(1, '2023-06-24 20:57:07.226'),
(3, '2023-06-24 20:58:07.713');

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id_profesor` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

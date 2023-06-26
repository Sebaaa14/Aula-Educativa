-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2023 a las 07:52:55
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
  `hora` varchar(200) NOT NULL,
  `token` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id_alumno`, `hora`, `token`) VALUES
(2, '2023-06-25 18:10:02.046', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzczMTAwMiwiZXhwIjoxNjg3NzM0NjAyfQ.3DqSjQWqn8VIDg-SKgd2bBeUpAsprVOoOlP1KikIqPg'),
(2, '2023-06-25 18:24:44.092', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzczMTg4NCwiZXhwIjoxNjg3NzM1NDg0fQ._IrJKU1lQPRhYLecEKAKWJz4Q4v2-h_BwpRC_aJPVmc'),
(2, '2023-06-25 18:26:06.239', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzczMTk2NiwiZXhwIjoxNjg3NzM1NTY2fQ._NcZ04qs9-rulMIbV0-YwC9X5-V9dGQSilClNDGhdAE'),
(2, '2023-06-25 18:27:20.643', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzczMjA0MCwiZXhwIjoxNjg3NzM1NjQwfQ.7cIVwLNCXtx8poGicEhHTITYvGn2IJBzVxTCpzGPC7I'),
(3, '2023-06-25 18:28:30.675', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtNSIsImlhdCI6MTY4NzczMjExMCwiZXhwIjoxNjg3NzM1NzEwfQ.cIvuZNheEcZbzZf3kd4dk4_8SNlGUm7jdi6foZ96DPc'),
(1, '2023-06-25 20:28:08.938', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5MTk5MDktMiIsImlhdCI6MTY4NzczOTI4OCwiZXhwIjoxNjg3NzQyODg4fQ.w04kwYBhmnw7LiTNmI57OU8EndGN5bUWPhAeZz_t0Q0'),
(1, '2023-06-25 20:30:07.541', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5MTk5MDktMiIsImlhdCI6MTY4NzczOTQwNywiZXhwIjoxNjg3NzQzMDA3fQ.dX-TqKZDgKtykh49499jABZQEeDOJIH2S9VPaRY8ZqE'),
(2, '2023-06-25 20:38:16.240', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzczOTg5NiwiZXhwIjoxNjg3NzQzNDk2fQ.Cj3a4ZxQthEPOu0K6KCHtBbsCeQuIjMCmXSEhzEEhmc'),
(2, '2023-06-25 20:40:19.036', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc0MDAxOSwiZXhwIjoxNjg3NzQzNjE5fQ.-sjmkIoUpaZWTN2Z6Cfo7sO_xdGokLhUbYxhJW4tvRE'),
(2, '2023-06-25 21:02:57.747', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc0MTM3NywiZXhwIjoxNjg3NzQ0OTc3fQ.ANuzjlygDbl4hF5yhJeP4MPxMgp12WBs4PblyViBYPo'),
(2, '2023-06-25 21:04:33.760', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc0MTQ3MywiZXhwIjoxNjg3NzQ1MDczfQ.2vJTQyqhfBWIBqmr4W2wJjmhowBD9GeY9GuuwKAnkRY'),
(2, '2023-06-25 23:53:02.792', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1MTU4MiwiZXhwIjoxNjg3NzU1MTgyfQ.k0XfvSpL2KjmDVDftYUhN4ROAHU07bt41e_afXsWx0s'),
(2, '2023-06-25 23:55:15.463', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1MTcxNSwiZXhwIjoxNjg3NzU1MzE1fQ.abTwO5e3XcKRBSbD3rtzhxvQyrIllpS2FAsvN3ZBXbA'),
(2, '2023-06-25 23:56:51.651', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1MTgxMSwiZXhwIjoxNjg3NzU1NDExfQ.Z78RxXLSNU8D57d0-CIyo6sAqy9SPHC89moeP6dSQ9Y'),
(2, '2023-06-26 00:04:37.717', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1MjI3NywiZXhwIjoxNjg3NzU1ODc3fQ.ycHUEywv7jqyf34Ccv-6aSEJJv1LDWXONCh5ko3Fs6I'),
(1, '2023-06-26 00:04:54.681', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5MTk5MDktMiIsImlhdCI6MTY4Nzc1MjI5NCwiZXhwIjoxNjg3NzU1ODk0fQ.Iny3C9bVaRihOuSLniydQRjOPX_9lpylPYT1PYSm2Hk'),
(2, '2023-06-26 00:08:52.019', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1MjUzMiwiZXhwIjoxNjg3NzU2MTMyfQ.PRtDbhXlNchqw6litnl1uiT2CPvuL9YvFyIGDSo5XB0'),
(2, '2023-06-26 01:12:08.442', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1NjMyOCwiZXhwIjoxNjg3NzU5OTI4fQ.QUUvnbMu5xaQMWXxikFo347IVzMK1ANtj0AcJ32hxMA'),
(2, '2023-06-26 01:12:21.274', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1NjM0MSwiZXhwIjoxNjg3NzU5OTQxfQ.V9dAjhDFRwMXWVfNr3St5KrchhHKeR16MVQCAQ8CYe0'),
(2, '2023-06-26 01:12:43.168', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1NjM2MywiZXhwIjoxNjg3NzU5OTYzfQ.0tSH7qKkvrZd9XfESWaXqqVghbpDYxgUpnwfI_qLSMc'),
(2, '2023-06-26 01:13:43.675', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1NjQyMywiZXhwIjoxNjg3NzYwMDIzfQ.pivOAU4isToMqKTcuGkzcNNroUTnj25yaQu2WCqWO_w'),
(2, '2023-06-26 01:25:58.095', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1NzE1OCwiZXhwIjoxNjg3NzYwNzU4fQ.SvkR4xbHwUMWzkKGqNIjBcRtdnuOCD_HyTpAqiRjvaw'),
(2, '2023-06-26 01:26:14.420', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1NzE3NCwiZXhwIjoxNjg3NzYwNzc0fQ.WgplovJrVhJ09DuR5ydMtQJvYcIIGHpBS2Xm56aPLjY'),
(2, '2023-06-26 01:28:22.641', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1NzMwMiwiZXhwIjoxNjg3NzYwOTAyfQ.jnDC3Ey7uAmAaiL3e0-rWeF4Qgtm9NuzP9KkSVnpfZY'),
(2, '2023-06-26 01:33:33.772', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1NzYxMywiZXhwIjoxNjg3NzYxMjEzfQ.Y-CSriNaGNeT30eQ-uvQiniIz1udZaavzSXlulY-mnw'),
(2, '2023-06-26 01:35:14.739', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1NzcxNCwiZXhwIjoxNjg3NzYxMzE0fQ.1sQThlmDIJrdr1tpb85fqz99E7DROxeMRx3mH-BTmAM'),
(2, '2023-06-26 01:39:04.912', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1Nzk0NCwiZXhwIjoxNjg3NzYxNTQ0fQ.jxCUslwoiVxr66DZDCQDiXp6Bz747bqoKpY22tNwLWo'),
(2, '2023-06-26 01:49:09.103', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1ODU0OSwiZXhwIjoxNjg3NzYyMTQ5fQ.YGzNHES6Ov_7VswlUruUqB-YT4sceryn5UQr018cjrg'),
(2, '2023-06-26 01:50:43.090', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1ODY0MywiZXhwIjoxNjg3NzYyMjQzfQ.neCW4nKCAcPL1itugsb0cOecZ-8pePCcEFa4cJUZpwI'),
(2, '2023-06-26 01:51:11.266', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1ODY3MSwiZXhwIjoxNjg3NzYyMjcxfQ.pMXsRA5_3_kKCrHgSxP27XNYhdP_eOEiAV9wv34AHUA'),
(2, '2023-06-26 01:52:27.855', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1ODc0NywiZXhwIjoxNjg3NzYyMzQ3fQ.YFr1Hs9qJP-dcj8QnkKUAHnwDSgH7FOFgyhwQqevmmA');

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
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id_profesor` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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

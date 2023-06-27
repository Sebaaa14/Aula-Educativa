-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2023 a las 02:57:03
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
(8, 'Martina perez', 'martina.perez@mail.edu.cl', 'Lunes a viernes 14:30', 'Profesor jefe');

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
(2, '2023-06-26 01:52:27.855', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc1ODc0NywiZXhwIjoxNjg3NzYyMzQ3fQ.YFr1Hs9qJP-dcj8QnkKUAHnwDSgH7FOFgyhwQqevmmA'),
(2, '2023-06-26 12:04:53.595', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc5NTQ5MywiZXhwIjoxNjg3Nzk5MDkzfQ.-cLyfomaiU0xY3ffo5jinsfDoDuPy2i3PoDbTwZ2jSU'),
(2, '2023-06-26 12:16:36.453', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc5NjE5NiwiZXhwIjoxNjg3Nzk5Nzk2fQ.JRlUH0FwROpLIkB1m3KfaApU_CyAg5jqCY1gN8w1sKQ'),
(2, '2023-06-26 12:22:34.330', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4Nzc5NjU1NCwiZXhwIjoxNjg3ODAwMTU0fQ.Nkb3NCE-4IH6ylxG1xxQsyCqdyoPTRmsBRx2waWWffU'),
(2, '2023-06-26 14:42:51.989', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgwNDk3MSwiZXhwIjoxNjg3ODA4NTcxfQ.DdQkoN3dWk6XHb62_dN9X1zmg8w5wG5Z87CW1lnu3ec'),
(2, '2023-06-26 17:54:27.567', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgxNjQ2NywiZXhwIjoxNjg3ODIwMDY3fQ.SRjdFtTj81jMpe3VMIQDZ0xufEonneN_hYLfUVvxqzc'),
(2, '2023-06-26 17:58:24.242', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgxNjcwNCwiZXhwIjoxNjg3ODIwMzA0fQ.8Hm2OCPVVX7GBeyOBQ02LP0Ye7CVIkIfRHSVb4NY_Eo'),
(2, '2023-06-26 18:37:11.474', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgxOTAzMSwiZXhwIjoxNjg3ODIyNjMxfQ.O49wZScPaWqlEMmi0AYdOYTUE7Mz7rv0nys9Lut9jo0'),
(2, '2023-06-26 18:38:21.426', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgxOTEwMSwiZXhwIjoxNjg3ODIyNzAxfQ.Jn_POKWR0LQ8-7a2GlG5kjE9qunVZ2M0XipJ_ZD3gmU'),
(2, '2023-06-26 18:41:18.730', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgxOTI3OCwiZXhwIjoxNjg3ODIyODc4fQ.VO5ZjjIgunkY51BZg_Y9D81dZwrPIqwLsbTB95kN8ZI'),
(2, '2023-06-26 18:54:45.675', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMDA4NSwiZXhwIjoxNjg3ODIzNjg1fQ.Li2rbDH5HjqmJ1RGe3Kie1u-dQbAF_g6ssgOMfeQo0U'),
(2, '2023-06-26 19:09:22.432', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMDk2MiwiZXhwIjoxNjg3ODI0NTYyfQ.e-3J0yxlX802EnE7s5LrQV2YhPdjnguMHJy1r728X4o'),
(2, '2023-06-26 19:13:19.135', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMTE5OSwiZXhwIjoxNjg3ODI0Nzk5fQ.9IM-t1I29vqWP3lb5kZKCdwpXQnG7dXCMoEhpQHItaU'),
(2, '2023-06-26 19:14:18.052', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMTI1OCwiZXhwIjoxNjg3ODI0ODU4fQ.rMIp78VWkM_T4AJkzKEG5EfG-oeuEoft2APyJ3YM2Dc'),
(2, '2023-06-26 19:15:07.490', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMTMwNywiZXhwIjoxNjg3ODI0OTA3fQ.Pez09-RSqg38UzHZIhWPCXWRHzdejCO9U8hJ1X8QAJY'),
(2, '2023-06-26 19:21:39.233', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMTY5OSwiZXhwIjoxNjg3ODI1Mjk5fQ.lq7ppVTVA3td6KrEJWeV7Nl-DLbL5l835U0h52UZR_8'),
(2, '2023-06-26 19:24:56.218', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMTg5NiwiZXhwIjoxNjg3ODI1NDk2fQ.hSWS1S2rm596TnhR1_rVelaUS1J2KNS8cuUO2al4GJs'),
(2, '2023-06-26 19:27:20.792', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMjA0MCwiZXhwIjoxNjg3ODI1NjQwfQ.t4ttyaDmjg-HYmP6kGnbmO9dct6oIHys_0vkkLW2FKk'),
(2, '2023-06-26 19:29:32.871', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMjE3MiwiZXhwIjoxNjg3ODI1NzcyfQ.hyyPTX67StPL3KYDkZCZWnzVgWIqCRQe1k0p48cvDsc'),
(2, '2023-06-26 19:30:07.564', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMjIwNywiZXhwIjoxNjg3ODI1ODA3fQ.-RmrpqsfeJqfrHxuO506sy9PpumqJv6DswuCoVxW7BQ'),
(2, '2023-06-26 19:56:20.245', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyMzc4MCwiZXhwIjoxNjg3ODI3MzgwfQ.fDUx82lsb4v3v6xx-hQWnx8FE6Q_UmPrg3qI-6OGC9s'),
(2, '2023-06-26 20:01:19.900', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyNDA3OSwiZXhwIjoxNjg3ODI3Njc5fQ.7_fhTuOyXVKJLuLh4WJRSvfRd0alxcNll-SUwH6xbUQ'),
(2, '2023-06-26 20:04:39.172', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsImlhdCI6MTY4NzgyNDI3OSwiZXhwIjoxNjg3ODI3ODc5fQ.Oe2i5haxIQVKsRn4vBpgY7uMCtYzfhVikUxc84bL-IA'),
(2, '2023-06-26 20:09:28.813', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbGUiOiJ1c3VhcmlvIiwiaWF0IjoxNjg3ODI0NTY4LCJleHAiOjE2ODc4MjgxNjh9.w1ilJYgSj8qPmk0kPLWV3psjCLdfSRf9oOPhv6cTwK4'),
(2, '2023-06-26 20:13:45.284', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbGUiOiJ1c3VhcmlvIiwiaWF0IjoxNjg3ODI0ODI1LCJleHAiOjE2ODc4Mjg0MjV9.kxNqlPNp4LG8rC7DCDa6wj86nUBH73zP0IUuKo0NJTY'),
(2, '2023-06-26 20:13:46.744', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbGUiOiJ1c3VhcmlvIiwiaWF0IjoxNjg3ODI0ODI2LCJleHAiOjE2ODc4Mjg0MjZ9.o6ZwaxIo1BEYpHWOeEZxGEitVuWxqxy86vPynlLiwJ0'),
(2, '2023-06-26 20:19:19.140', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbGUiOiJ1c3VhcmlvIiwiaWF0IjoxNjg3ODI1MTU5LCJleHAiOjE2ODc4Mjg3NTl9.gRtHeD4K3LwCCw_iCluysPVgrEq1JvucfDge7wCmEqk'),
(2, '2023-06-26 20:22:13.471', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4MjUzMzMsImV4cCI6MTY4NzgyODkzM30.hYVB2SAfTcE2cHi7BC6OmaSxT1AaQGEgZXMtkz3GJ4w'),
(2, '2023-06-26 20:23:13.221', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4MjUzOTMsImV4cCI6MTY4NzgyODk5M30.1sIuIxDgD2AJpioveoxKSkqnneEupYWuu_f2wof4l7U'),
(2, '2023-06-26 20:24:16.361', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4MjU0NTYsImV4cCI6MTY4NzgyOTA1Nn0.-QQiaIoZeN0uohtqnKQ1vRQ9q5NTmAAhvdAh23JcnEk'),
(2, '2023-06-26 20:28:54.325', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4MjU3MzQsImV4cCI6MTY4NzgyOTMzNH0.vhU7U6Mr2EuRxfhcGbGGUNmLKO95Gif2j1vYxM3CHng'),
(2, '2023-06-26 20:52:07.449', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4MjcxMjcsImV4cCI6MTY4NzgzMDcyN30.55R59fTOUUHEQuhEndngskIoURVEKG6b4PPVBv95fpo'),
(2, '2023-06-26 20:55:57.018', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJydXRfYWx1bW5vIjoiMjA5ODY5NDgtOSIsInJvbCI6InVzdWFyaW8iLCJpYXQiOjE2ODc4MjczNTcsImV4cCI6MTY4NzgzMDk1N30.1ZAX5KZAZwMpGUF5of5f5pMtPaoeE3VkE379O5ynGx0');

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
  MODIFY `id_profesor` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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

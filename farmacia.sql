-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2024 a las 15:16:12
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
-- Base de datos: `farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorizaciones`
--

CREATE TABLE `autorizaciones` (
  `id_auto` int(11) NOT NULL,
  `id_cita` int(11) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `docu_medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `documento` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `docu_medico` int(11) NOT NULL,
  `id_esp` int(3) NOT NULL,
  `id_estado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `documento`, `fecha`, `hora`, `docu_medico`, `id_esp`, `id_estado`) VALUES
(2, 0, '0000-00-00', '00:00:00', 1104786412, 1, 3),
(3, 1003239087, '2024-03-30', '00:00:00', 1122736351, 5, 3),
(4, 1118723902, '2024-03-30', '00:00:00', 1104786412, 5, 3),
(6, 1106226573, '2024-04-06', '00:00:00', 1122736351, 5, 3),
(7, 2147483647, '2024-03-26', '00:00:00', 1122736351, 15, 3),
(10, 2147483647, '2024-03-12', '00:00:00', 1122736351, 15, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(3) NOT NULL,
  `ciudad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `ciudad`) VALUES
(1, 'Bogota'),
(2, 'Ibagué'),
(3, 'Cali'),
(4, 'Medellin'),
(5, 'Cartagena'),
(6, 'Manizales'),
(7, 'Bucaramanga'),
(8, 'Pereira'),
(9, 'Armenia'),
(10, 'Caqueta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_autorizacion`
--

CREATE TABLE `det_autorizacion` (
  `id_detalle` int(11) NOT NULL,
  `id_auto` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL,
  `cantidad` varchar(20) NOT NULL,
  `medida_cant` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `nit` varchar(10) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  `licencia` varchar(10) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `codigo_unico` int(3) NOT NULL,
  `id_estado` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`nit`, `empresa`, `licencia`, `inicio`, `fin`, `codigo_unico`, `id_estado`) VALUES
('12378945', 'Sanitas', 'UW7fYLp!qy', '2024-05-08', '2025-05-08', 123, 3),
('123852789', 'Caprecom', 'EvbgiISNp)', '2024-05-10', '2025-05-10', 852, 3),
('45685297', 'Nueva Eps', 'uQDbCnWCUn', '2024-05-10', '2025-05-10', 789, 3),
('4317284950', 'SURA', '0hryf(jn3h', '2024-05-10', '2025-05-10', 147, 3),
('2836147590', 'Compensar', 'RnMK#pg^KQ', '2024-05-10', '2025-05-10', 258, 3),
('9572841630', 'Salud Total', '3UJ6M#fXFd', '2024-05-10', '2025-05-10', 951, 3),
('8241763950', 'Coomeva', '4PwToKRs8K', '2024-05-10', '2025-05-10', 753, 3),
('6918472053', 'Medimás', 'r59gznHk78', '2024-05-10', '2025-05-10', 659, 3),
('7461593280', 'Famisanar', 'bxah@drLE(', '2024-05-10', '2025-05-10', 379, 3),
('6491275380', 'Comfenalco', 'v^ALy&62LO', '2024-05-10', '2025-05-10', 493, 3),
('5194837206', 'Mutual Ser', '!wWDGL@z#g', '2024-05-10', '2025-05-10', 813, 3),
('7985626269', 'Cruz Roja', 'L#gR1cIi@z', '2024-05-16', '2025-05-16', 512, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especializacion`
--

CREATE TABLE `especializacion` (
  `id_esp` int(3) NOT NULL,
  `especializacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `especializacion`
--

INSERT INTO `especializacion` (`id_esp`, `especializacion`) VALUES
(1, 'Medicina Interna'),
(2, 'Pediatría'),
(3, 'Cirugía'),
(4, 'Ginecología y Obstetricia'),
(5, 'Psiquiatría'),
(6, 'Dermatología'),
(7, 'Oftalmología'),
(8, 'Otorrinolaringología'),
(9, 'Cardiología'),
(10, 'Neurología'),
(11, 'Endocrinología'),
(12, 'Nefrología'),
(13, 'Reumatología'),
(14, 'Urgencias '),
(15, 'Radiología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estado` int(3) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `estado`) VALUES
(1, 'Pendiente'),
(2, 'Entregado'),
(3, 'Activo'),
(4, 'Inactivo'),
(5, 'Activa'),
(6, 'Cancelada'),
(7, 'Disponible'),
(8, 'Agotado'),
(10, 'Ocupado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `id_lab` int(4) NOT NULL,
  `laboratorio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`id_lab`, `laboratorio`) VALUES
(2, 'Laboratorio Pharma'),
(3, 'Laboratorio Tecnofarma'),
(4, 'Laboratorio MK'),
(5, 'Laboratorio Biogalenic'),
(6, 'Laboratorio Takeda'),
(7, 'Laboratorio LKM'),
(8, 'Laboratorio Roche'),
(9, 'Laboratorio Bayer'),
(10, 'Laboratorio Abbott'),
(11, 'Laboratorio Duran');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamento` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `id_cla` int(3) NOT NULL,
  `cantidad` varchar(20) NOT NULL,
  `medida_cant` varchar(20) NOT NULL,
  `id_lab` int(5) NOT NULL,
  `f_vencimiento` date NOT NULL,
  `codigo_barras` varchar(200) NOT NULL,
  `id_estado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamento`, `nombre`, `id_cla`, `cantidad`, `medida_cant`, `id_lab`, `f_vencimiento`, `codigo_barras`, `id_estado`) VALUES
(2, 'Amoxicilina', 1, '75UND', 'pastillas500ml', 9, '2025-05-07', '0883572', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `docu_medico` int(11) NOT NULL,
  `id_doc` int(2) NOT NULL,
  `nombre_comple` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `password` varchar(500) NOT NULL,
  `id_rol` int(3) NOT NULL,
  `id_estado` int(3) NOT NULL,
  `id_esp` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`docu_medico`, `id_doc`, `nombre_comple`, `correo`, `telefono`, `password`, `id_rol`, `id_estado`, `id_esp`) VALUES
(1102378951, 3, 'Laura Camila Ramirez', 'Lauramirez@gmail.com', '3152134312', '38211887', 3, 3, 14),
(1104786412, 3, 'yareth ohany garcia rangel', 'yogarcia@gmail.com', '3123122213', 'undefined ', 3, 3, 4),
(1108982783, 3, 'Isabella Rios ', 'isa10256@gmail.com', '3125468787', 'undefined.', 3, 3, 5),
(1122736351, 3, 'Jeferson Cardenal', 'jefer23@gmail.com', '3002349008', 'jefer123', 3, 3, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rh`
--

CREATE TABLE `rh` (
  `id_rh` int(2) NOT NULL,
  `rh` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rh`
--

INSERT INTO `rh` (`id_rh`, `rh`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'B+'),
(4, 'B-'),
(5, 'AB+'),
(6, 'AB-'),
(7, 'O+'),
(8, 'O-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(3) NOT NULL,
  `rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`) VALUES
(1, 'Desarrollador'),
(2, 'Administrador'),
(3, 'Medico'),
(4, 'Farmaceuta'),
(5, 'Paciente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_medicamento`
--

CREATE TABLE `tipo_medicamento` (
  `id_cla` int(3) NOT NULL,
  `clasificacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_medicamento`
--

INSERT INTO `tipo_medicamento` (`id_cla`, `clasificacion`) VALUES
(1, 'Analgesicos'),
(2, 'Antibioticos'),
(3, 'Anticonvulsivos'),
(4, 'Antidepresivos'),
(5, 'Antidiabeticos'),
(6, 'Antihipertensivos'),
(7, 'Antiinflamatorios'),
(8, 'Antipireticos'),
(9, 'Antitusivos'),
(10, 'Jarabe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trigg`
--

CREATE TABLE `trigg` (
  `n_password` varchar(500) DEFAULT NULL,
  `v_password` varchar(500) DEFAULT NULL,
  `tipo` varchar(20) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trigg`
--

INSERT INTO `trigg` (`n_password`, `v_password`, `tipo`, `fecha_creacion`) VALUES
('$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', '$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', 'update', '2024-03-02 23:28:57'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-03-02 23:35:15'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-03-02 23:35:26'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$/ueZ6P1lDq0GhQ5XOzl29OvS1c6QXuCW827M7DVLJagpsehfiQ/Oe', 'update', '2024-03-03 10:41:56'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-03-21 17:35:06'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-03-21 17:35:13'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-03-21 19:24:39'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-03-21 19:36:36'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-05-03 11:04:34'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-05-03 11:13:56'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-03 14:25:02'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-03 14:25:48'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-05-08 06:59:49'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-08 07:39:56'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 16:37:30'),
('$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', '$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', 'update', '2024-05-09 16:39:00'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-09 16:39:10'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-05-09 16:39:53'),
('$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', '$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', 'update', '2024-05-09 16:40:28'),
('$2y$10$TYJFKZbibuno5.SpYna0duc.a6up7kuCw2bfbbrCnFxCs/ihXunHe', '$2y$10$TYJFKZbibuno5.SpYna0duc.a6up7kuCw2bfbbrCnFxCs/ihXunHe', 'update', '2024-05-09 16:43:10'),
('$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', '$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', 'update', '2024-05-09 16:43:23'),
('$2y$10$M1Ce1H3hlrmjpj5y1ozh0O3v5a2GH0jnxVG2oDDTn8scg8jfzzYe.', '$2y$10$M1Ce1H3hlrmjpj5y1ozh0O3v5a2GH0jnxVG2oDDTn8scg8jfzzYe.', 'update', '2024-05-09 16:45:27'),
('$2y$10$M1Ce1H3hlrmjpj5y1ozh0O3v5a2GH0jnxVG2oDDTn8scg8jfzzYe.', '$2y$10$M1Ce1H3hlrmjpj5y1ozh0O3v5a2GH0jnxVG2oDDTn8scg8jfzzYe.', 'update', '2024-05-09 16:46:07'),
('$2y$10$LjYX4iryaOVjTKMNJ9dp8exa2qlUuZcbfYZ8lWm/NP9ng9eKRdJEG', '$2y$10$LjYX4iryaOVjTKMNJ9dp8exa2qlUuZcbfYZ8lWm/NP9ng9eKRdJEG', 'update', '2024-05-09 16:49:43'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-09 16:50:46'),
('$2y$10$LjYX4iryaOVjTKMNJ9dp8exa2qlUuZcbfYZ8lWm/NP9ng9eKRdJEG', '$2y$10$LjYX4iryaOVjTKMNJ9dp8exa2qlUuZcbfYZ8lWm/NP9ng9eKRdJEG', 'update', '2024-05-09 16:50:53'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 16:50:57'),
('$2y$10$M1Ce1H3hlrmjpj5y1ozh0O3v5a2GH0jnxVG2oDDTn8scg8jfzzYe.', '$2y$10$M1Ce1H3hlrmjpj5y1ozh0O3v5a2GH0jnxVG2oDDTn8scg8jfzzYe.', 'update', '2024-05-09 16:51:03'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-09 16:51:56'),
('$2y$10$LjYX4iryaOVjTKMNJ9dp8exa2qlUuZcbfYZ8lWm/NP9ng9eKRdJEG', '$2y$10$LjYX4iryaOVjTKMNJ9dp8exa2qlUuZcbfYZ8lWm/NP9ng9eKRdJEG', 'update', '2024-05-09 16:52:13'),
('$2y$10$M1Ce1H3hlrmjpj5y1ozh0O3v5a2GH0jnxVG2oDDTn8scg8jfzzYe.', '$2y$10$M1Ce1H3hlrmjpj5y1ozh0O3v5a2GH0jnxVG2oDDTn8scg8jfzzYe.', 'update', '2024-05-09 16:52:26'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:08:31'),
('$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', '$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', 'update', '2024-05-09 18:08:34'),
('$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', '$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', 'update', '2024-05-09 18:08:37'),
('$2y$10$TYJFKZbibuno5.SpYna0duc.a6up7kuCw2bfbbrCnFxCs/ihXunHe', '$2y$10$TYJFKZbibuno5.SpYna0duc.a6up7kuCw2bfbbrCnFxCs/ihXunHe', 'update', '2024-05-09 18:08:41'),
('$2y$10$GVXLX/6r5YA4amnDbAMRBODFxiLBQqOmzfpE/Y6Fmo0Vgu88Tdh0m', '$2y$10$GVXLX/6r5YA4amnDbAMRBODFxiLBQqOmzfpE/Y6Fmo0Vgu88Tdh0m', 'update', '2024-05-09 18:08:43'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-05-09 18:16:25'),
('$2y$10$GVXLX/6r5YA4amnDbAMRBODFxiLBQqOmzfpE/Y6Fmo0Vgu88Tdh0m', '$2y$10$GVXLX/6r5YA4amnDbAMRBODFxiLBQqOmzfpE/Y6Fmo0Vgu88Tdh0m', 'update', '2024-05-09 18:16:57'),
('$2y$10$TYJFKZbibuno5.SpYna0duc.a6up7kuCw2bfbbrCnFxCs/ihXunHe', '$2y$10$TYJFKZbibuno5.SpYna0duc.a6up7kuCw2bfbbrCnFxCs/ihXunHe', 'update', '2024-05-09 18:17:06'),
('$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', '$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', 'update', '2024-05-09 18:17:19'),
('$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', '$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', 'update', '2024-05-09 18:17:25'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:17:36'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-09 18:17:53'),
('$2y$10$4Er5XPvRfHpO3dUS7ZhkVe2AEaONDw/8eLQ.3cWw6eh.EcDKUC70W', '$2y$10$4Er5XPvRfHpO3dUS7ZhkVe2AEaONDw/8eLQ.3cWw6eh.EcDKUC70W', 'update', '2024-05-09 18:17:58'),
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-05-09 18:18:24'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:19:00'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:19:14'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:19:20'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:21:11'),
('$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', '$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', 'update', '2024-05-09 18:21:19'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:23:15'),
('$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', '$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', 'update', '2024-05-09 18:26:29'),
('$2y$10$TYJFKZbibuno5.SpYna0duc.a6up7kuCw2bfbbrCnFxCs/ihXunHe', '$2y$10$TYJFKZbibuno5.SpYna0duc.a6up7kuCw2bfbbrCnFxCs/ihXunHe', 'update', '2024-05-09 18:48:36'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:50:37'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-09 18:51:16'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:51:30'),
('$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', '$2y$10$YP92x3h.8.UkNTZ.npNxj.VnKT5Aspz9ABIAlZTiS5.OePZTECV5a', 'update', '2024-05-09 18:59:42'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-09 19:10:08'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-09 19:10:15'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-09 19:10:45'),
('$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', '$2y$10$sczcuDFcLc1Q9lBJ1yqp3OZRyAvVvjW5oPzit2gzXv3XzpAcju/zK', 'update', '2024-05-09 19:10:48'),
('$2y$10$GVXLX/6r5YA4amnDbAMRBODFxiLBQqOmzfpE/Y6Fmo0Vgu88Tdh0m', '$2y$10$GVXLX/6r5YA4amnDbAMRBODFxiLBQqOmzfpE/Y6Fmo0Vgu88Tdh0m', 'update', '2024-05-09 19:13:30'),
('$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', '$2y$10$hbf3wAqhk/xE9cuVxVMVYeFMDbfHvYXfZzAyAiGcjA575W7EQj.bm', 'update', '2024-05-09 19:14:18'),
('$2y$10$qGALdxLPgvOV.hgDeuTbNeVdF9mf86zNrNKGKhGO3t/JC7ejHv9Yu', '$2y$10$qGALdxLPgvOV.hgDeuTbNeVdF9mf86zNrNKGKhGO3t/JC7ejHv9Yu', 'update', '2024-05-14 09:26:01'),
('$2y$10$Ty6V5Rsq3sa3o9xdg3wvzurk.4GDfWDD2jnAQBWw0o.X9/abuU5yK', '$2y$10$Ty6V5Rsq3sa3o9xdg3wvzurk.4GDfWDD2jnAQBWw0o.X9/abuU5yK', 'update', '2024-05-14 09:31:40'),
('$2y$10$38Y5VeED/nkAfSwUwAUrruFRb.WFCYI9x9Io4Pqg.ZhfP8uyXOcTO', '$2y$10$38Y5VeED/nkAfSwUwAUrruFRb.WFCYI9x9Io4Pqg.ZhfP8uyXOcTO', 'update', '2024-05-14 09:32:16'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-14 09:36:04'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-14 10:41:16'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-14 10:41:22'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-14 11:25:04'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-14 11:28:56'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-14 11:29:01'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 10:30:08'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 10:30:12'),
('$2y$10$qGALdxLPgvOV.hgDeuTbNeVdF9mf86zNrNKGKhGO3t/JC7ejHv9Yu', '$2y$10$qGALdxLPgvOV.hgDeuTbNeVdF9mf86zNrNKGKhGO3t/JC7ejHv9Yu', 'update', '2024-05-15 10:30:17'),
('$2y$10$Ty6V5Rsq3sa3o9xdg3wvzurk.4GDfWDD2jnAQBWw0o.X9/abuU5yK', '$2y$10$Ty6V5Rsq3sa3o9xdg3wvzurk.4GDfWDD2jnAQBWw0o.X9/abuU5yK', 'update', '2024-05-15 10:36:16'),
('$2y$10$rQE0y0KfiOItTsrxj/.oDe2G/J78ySu.JD5gp4iogRdj8hPoDkCTS', '$2y$10$rQE0y0KfiOItTsrxj/.oDe2G/J78ySu.JD5gp4iogRdj8hPoDkCTS', 'update', '2024-05-15 10:56:40'),
('$2y$10$W9gCCOEzUIO4.y.PsvvMLOrlaXGt8XuHjodmXZMfulaxTuBhKfh4O', '$2y$10$W9gCCOEzUIO4.y.PsvvMLOrlaXGt8XuHjodmXZMfulaxTuBhKfh4O', 'update', '2024-05-15 10:56:53'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 10:57:20'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 10:57:23'),
('$2y$10$W9gCCOEzUIO4.y.PsvvMLOrlaXGt8XuHjodmXZMfulaxTuBhKfh4O', '$2y$10$W9gCCOEzUIO4.y.PsvvMLOrlaXGt8XuHjodmXZMfulaxTuBhKfh4O', 'update', '2024-05-15 10:57:44'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:33:44'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:35:50'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:36:51'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:36:54'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:38:34'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:38:43'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:42:46'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:43:15'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:43:29'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:45:03'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:47:32'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:47:39'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-15 12:47:44'),
('$2y$10$R2fBqslLXvEL2gbulrSNa.ZAm5VzLD.VAAEMPHQ0o5FAwc7HTGr8W', '$2y$10$R2fBqslLXvEL2gbulrSNa.ZAm5VzLD.VAAEMPHQ0o5FAwc7HTGr8W', 'update', '2024-05-16 06:19:21'),
('$2y$10$R2fBqslLXvEL2gbulrSNa.ZAm5VzLD.VAAEMPHQ0o5FAwc7HTGr8W', '$2y$10$R2fBqslLXvEL2gbulrSNa.ZAm5VzLD.VAAEMPHQ0o5FAwc7HTGr8W', 'update', '2024-05-16 07:25:02'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 07:25:14'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 07:26:18'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 07:26:27'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 07:26:32'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 07:28:47'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 07:38:46'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 07:38:57'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:41:57'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:42:36'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:42:44'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:43:43'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:44:24'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:44:39'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:44:57'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:45:18'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:49:20'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:49:41'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:49:53'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:52:48'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:53:58'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:54:11'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:54:14'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:55:19'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:55:25'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:58:57'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 10:59:01'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:00:21'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:00:24'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:00:33'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:01:11'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:14:33'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:15:13'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:17:29'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:17:41'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:19:53'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:20:16'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:21:41'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:22:01'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:22:07'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:22:14'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:22:47'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:22:53'),
('$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 'update', '2024-05-16 11:23:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_documento`
--

CREATE TABLE `t_documento` (
  `id_doc` int(2) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `t_documento`
--

INSERT INTO `t_documento` (`id_doc`, `tipo`) VALUES
(1, 'Registro CIvil'),
(2, 'Tarjeta de Identidad'),
(3, 'Cedula de Ciudadania'),
(4, 'Cedula de Extrangeria ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `documento` int(11) NOT NULL,
  `id_doc` int(2) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `id_rh` int(2) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_ciudad` int(3) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `id_rol` int(3) NOT NULL,
  `id_estado` int(3) NOT NULL,
  `nit` varchar(10) DEFAULT NULL,
  `token` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`documento`, `id_doc`, `nombre`, `apellido`, `id_rh`, `telefono`, `correo`, `id_ciudad`, `direccion`, `password`, `id_rol`, `id_estado`, `nit`, `token`) VALUES
(38211887, 3, 'Briceida', 'Prada Guzman', 1, '3124237144', 'brisapradaguzman34@gmail.com', 2, 'Cra 2 #75-b31 conjunto villa cristales', '$2y$10$Nc12rdh8A/TrslGo5RRL.en/rkUtSb1ghx/VKsCXzLqyp5IuQdSjy', 2, 3, '9572841630', ''),
(1005717713, 3, 'Aura', 'Olaya', 7, '3173532543', 'olayacristina01@gmail.com', 2, 'calle 60 n 6-16 Prados', '$2y$10$Ty6V5Rsq3sa3o9xdg3wvzurk.4GDfWDD2jnAQBWw0o.X9/abuU5yK', 1, 3, '12378945', ''),
(1006123134, 3, 'yesica', 'gomez', 1, '3136651555', 'yesica@gmail.com', 2, 'arboleda', '$2y$10$VlIZBg/m7H0IfFO23/1rFeKWEUXlPNHZ99LkVjubfcUx.VhbW3RNq', 5, 4, '7461593280', ''),
(1023870638, 3, 'juan david', 'aroca', 7, '3154221202', 'jdaroca83gmail.com', 2, 'mz b casa 8', '$2y$10$AwCcAd8yWYJ1uisFewaU4es7KAQLewZ.8It/h6T9cfLrAkQPiCj1O', 5, 4, '45685297', ''),
(1031540636, 3, 'jeferson', 'cardenal', 7, '3213879832', 'yiyecardenal@gmail.com', 2, 'calle 39 bis', '$2y$10$jDjtO9kgW3jNviS9GzVSOe1/gQvjc/jN0eFk.rPtK1kz4OeX7xeg6', 5, 4, '45685297', ''),
(1104254269, 3, 'daniel', 'montoya', 1, '3193914473', 'danielcamilom96@gmail.com', 2, 'calle 21 con 5', '$2y$10$gp9XECGkkFrLZElrjSRV6eyiMTon4rUStoas0dCU3GpuGj/XthsvK', 5, 4, '45685297', ''),
(1104544454, 4, 'brayan fernando', 'sanchez izquierdo', 1, '3202174961', 'bfsanchez45gmail.com', 2, 'manza c casa 14 barrio la gait', '$2y$10$W9gCCOEzUIO4.y.PsvvMLOrlaXGt8XuHjodmXZMfulaxTuBhKfh4O', 5, 4, '12378945', ''),
(1106226573, 3, 'Santiago ', 'pinilla prada', 2, '3144342215', 'Santiagomagnos63@gmail.com', 2, 'Cra2 #75-b31 ', '$2y$10$qGALdxLPgvOV.hgDeuTbNeVdF9mf86zNrNKGKhGO3t/JC7ejHv9Yu', 1, 3, '9572841630', ''),
(1107975322, 3, 'cristian julian', 'figueroa armero', 7, '3124758405', 'cristianfigueroa040@gmail.com', 2, 'cra 6 # 6-36', '$2y$10$/xRvSSibu75J9odWRuTlg.ie0cOSWmkp25RWb5rfuOp1dCwFikTFC', 5, 4, '45685297', ''),
(1110172890, 3, 'Valentina', 'Mendoza', 7, '3158571494', 'valen.mza.28@gmail.com', 2, 'Barrio Ricaute', '$2y$10$38Y5VeED/nkAfSwUwAUrruFRb.WFCYI9x9Io4Pqg.ZhfP8uyXOcTO', 1, 4, '45685297', ''),
(1110567986, 3, 'julian', 'cladeo', 8, '3154688169', 'mlksklsk@gamil.com', 2, 'lslsklkslklsklkslksl', '$2y$10$ax4eNUxaiVO/lSDrYm40r.uc47OzHvnVb2rkY5gynKd2sN5GKrjsa', 5, 4, '8241763950', ''),
(1111333014, 3, 'Yurica', 'Ducuara', 7, '3212441999', 'yuriducu04@gmail.com', 2, 'mz a casa 13 rosales de tailan', '$2y$10$VIjtTBWyH6PhnD7Hybi5HOc9RX7zODhzcYhh76HJWpMv6MwlhtKYK', 5, 4, '45685297', ''),
(1127208301, 3, 'Ohany', 'Garcia', 8, '3102552339', 'yarethohany.6704@gmail.com', 2, 'Caracoli Bloq 15 - 304', '$2y$10$R2fBqslLXvEL2gbulrSNa.ZAm5VzLD.VAAEMPHQ0o5FAwc7HTGr8W', 4, 3, '9572841630', ''),
(2147483647, 3, 'jennifer tatiana', 'ortiz goyeneche', 7, '3114409273', 'ortiztatiana1416@gmail.com', 2, 'barrio americas', '$2y$10$rQE0y0KfiOItTsrxj/.oDe2G/J78ySu.JD5gp4iogRdj8hPoDkCTS', 5, 4, '123852789', '');

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `update_contra` AFTER UPDATE ON `usuarios` FOR EACH ROW begin insert into trigg(n_password, v_password, tipo) values(new.password, old.password, 'update'); end
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autorizaciones`
--
ALTER TABLE `autorizaciones`
  ADD PRIMARY KEY (`id_auto`),
  ADD KEY `id_cita` (`id_cita`),
  ADD KEY `id_detalle` (`id_detalle`),
  ADD KEY `id_medico` (`docu_medico`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_medico` (`docu_medico`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `det_autorizacion`
--
ALTER TABLE `det_autorizacion`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_auto` (`id_auto`),
  ADD KEY `id_medicamento` (`id_medicamento`);

--
-- Indices de la tabla `especializacion`
--
ALTER TABLE `especializacion`
  ADD PRIMARY KEY (`id_esp`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id_lab`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_medicamento`),
  ADD KEY `id_cla` (`id_cla`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_lab` (`id_lab`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`docu_medico`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_esp` (`id_esp`),
  ADD KEY `id_doc` (`id_doc`);

--
-- Indices de la tabla `rh`
--
ALTER TABLE `rh`
  ADD PRIMARY KEY (`id_rh`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tipo_medicamento`
--
ALTER TABLE `tipo_medicamento`
  ADD PRIMARY KEY (`id_cla`);

--
-- Indices de la tabla `t_documento`
--
ALTER TABLE `t_documento`
  ADD PRIMARY KEY (`id_doc`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `id_doc` (`id_doc`),
  ADD KEY `id_rh` (`id_rh`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autorizaciones`
--
ALTER TABLE `autorizaciones`
  MODIFY `id_auto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `det_autorizacion`
--
ALTER TABLE `det_autorizacion`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especializacion`
--
ALTER TABLE `especializacion`
  MODIFY `id_esp` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id_lab` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rh`
--
ALTER TABLE `rh`
  MODIFY `id_rh` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_medicamento`
--
ALTER TABLE `tipo_medicamento`
  MODIFY `id_cla` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `t_documento`
--
ALTER TABLE `t_documento`
  MODIFY `id_doc` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`id_cla`) REFERENCES `tipo_medicamento` (`id_cla`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicamentos_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicamentos_ibfk_3` FOREIGN KEY (`id_lab`) REFERENCES `laboratorio` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicos_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicos_ibfk_3` FOREIGN KEY (`id_esp`) REFERENCES `especializacion` (`id_esp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicos_ibfk_4` FOREIGN KEY (`id_doc`) REFERENCES `t_documento` (`id_doc`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

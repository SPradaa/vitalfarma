-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2024 a las 01:39:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

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
  `id_medico` int(3) NOT NULL
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
(3, 1003239087, '2024-03-30', '08:30:00', 1122736351, 5, 3),
(4, 1118723902, '2024-03-30', '08:30:00', 1104786412, 5, 3),
(6, 1106226573, '2024-04-06', '08:30:00', 1122736351, 5, 3),
(7, 2147483647, '2024-03-26', '13:30:00', 1122736351, 15, 3),
(10, 2147483647, '2024-03-12', '19:30:00', 1122736351, 15, 3);

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
  `medida_cant` varchar(20) NOT NULL,
  `concentracion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `nit` varchar(10) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  `id_licencia` int(10) DEFAULT NULL,
  `codigo_unico` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`nit`, `empresa`, `id_licencia`, `codigo_unico`) VALUES
('1234569877', 'Sanitas', 1, 123),
('2581473692', 'Nueva EPS', 2, 852);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `id_eps` int(4) NOT NULL,
  `eps` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`id_eps`, `eps`) VALUES
(1, 'Salud Total '),
(2, 'Coomeva'),
(3, 'Compensar'),
(4, 'Sanitas'),
(5, 'Cafesalud'),
(6, 'Famisanar'),
(7, 'Nueva EPS'),
(8, 'Aliansalud '),
(9, 'Colmédica'),
(10, 'EPS Sura');

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
(8, 'Agotado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_hor` int(3) NOT NULL,
  `horario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id_hor`, `horario`) VALUES
(1, '7:00 - 7:30'),
(2, '7:30 - 8:00'),
(3, '8:00 - 8:30'),
(4, '8:30 - 9:00'),
(5, '9:00 - 9:30'),
(6, '9:30 - 10:00'),
(7, '10:00 - 10:30'),
(8, '10:30 - 11:00'),
(9, '11:00 - 11:30'),
(10, '11:30 - 12:00'),
(11, '12:00 - 12:30'),
(12, '12:30 - 13:00'),
(13, '13:00 - 13:30'),
(14, '13:30 - 14:00'),
(15, '14:00 - 14:30'),
(16, '14:30 - 15:00'),
(17, '15:00 - 15:30'),
(18, '15:30 - 16:00'),
(19, '16:00 - 16:30'),
(20, '16:30 - 17:00'),
(21, '17:00 - 17:30'),
(22, '17:30 - 18:00'),
(23, '18:00 - 18:30'),
(24, '18:30 - 19:00');

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
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE `licencias` (
  `id_licencia` int(10) NOT NULL,
  `licencia` varchar(10) NOT NULL,
  `f_inicio` date NOT NULL,
  `f_fin` date NOT NULL,
  `id_estado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `licencias`
--

INSERT INTO `licencias` (`id_licencia`, `licencia`, `f_inicio`, `f_fin`, `id_estado`) VALUES
(1, 'a5dd5w6q3', '2024-02-21', '2025-02-21', 3),
(2, '4W#mb@J1y&', '2024-02-27', '2025-02-27', 3);

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
  `lote` varchar(30) NOT NULL,
  `id_estado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamento`, `nombre`, `id_cla`, `cantidad`, `medida_cant`, `id_lab`, `f_vencimiento`, `lote`, `id_estado`) VALUES
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
(1104786412, 3, 'yareth ohany garcia rangel', 'yogarcia@gmail.com', '3123122213', 'undefined ', 3, 3, 4),
(1108982783, 3, 'Isabella Rios ', 'isa10256@gmail.com', '3125468787', 'undefined.', 3, 3, 4),
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
('$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 'update', '2024-03-21 19:36:36');

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
  `id_eps` int(4) NOT NULL,
  `id_rh` int(2) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `id_ciudad` int(3) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `password` varchar(500) NOT NULL,
  `id_rol` int(3) NOT NULL,
  `id_estado` int(3) NOT NULL,
  `nit` varchar(10) DEFAULT NULL,
  `token` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`documento`, `id_doc`, `nombre`, `apellido`, `id_eps`, `id_rh`, `telefono`, `correo`, `id_ciudad`, `direccion`, `password`, `id_rol`, `id_estado`, `nit`, `token`) VALUES
(1003239087, 3, 'Juan Esteban', 'Ortega', 1, 1, '3046589012', 'juanes@gmail.com', 7, 'Cra 5 23-30', '$2y$10$4Er5XPvRfHpO3dUS7ZhkVe2AEaONDw/8eLQ.3cWw6eh.EcDKUC70W', 5, 4, NULL, ''),
(1106226573, 3, 'Santiago', 'Prada', 4, 2, '3218906523', 'santiagoprada@gmail.com', 2, 'Barrio el Jardin', '$2y$10$tgxzhYlCkVFTwGk310aYh.Kth5w2hvQp.a3mN3Ny9g1H4aNXYi8M.', 1, 3, '1234569877', ''),
(1110172892, 3, 'Valentina', 'Mendoza', 7, 7, '3158571432', 'Valenramirez@gmail.com', 1, 'Barrio Usaquen', '$2y$10$TYJFKZbibuno5.SpYna0duc.a6up7kuCw2bfbbrCnFxCs/ihXunHe', 2, 3, '1234569877', ''),
(1118723902, 3, 'Aura Cristina', 'Olaya', 5, 8, '3228901209', 'Auraolaya@gmail.com', 4, 'Cra 5 norte 23-40', '$2y$10$GVXLX/6r5YA4amnDbAMRBODFxiLBQqOmzfpE/Y6Fmo0Vgu88Tdh0m', 4, 4, '1234569877', ''),
(1234567891, 3, 'administrador', 'admi', 4, 2, '3144342215', 'administrador@gmail.com', 9, 'Cra4 # 12-90', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 1, 4, '1234569877', ''),
(2147483647, 3, 'paciente', 'nuevo', 7, 2, '3152487936', 'pacientes@gmail.com', 8, 'cra4-nuevapereira', '$2y$10$Csua5/iUyLYxue.JSNC5f.UOGGFHthsqHexKWb2ILzbHMat5hyXUO', 5, 4, NULL, '');

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
  ADD KEY `id_medico` (`id_medico`);

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
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`id_eps`);

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
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_hor`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id_lab`);

--
-- Indices de la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD PRIMARY KEY (`id_licencia`);

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
  ADD KEY `id_eps` (`id_eps`),
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
-- AUTO_INCREMENT de la tabla `eps`
--
ALTER TABLE `eps`
  MODIFY `id_eps` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `especializacion`
--
ALTER TABLE `especializacion`
  MODIFY `id_esp` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_hor` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id_lab` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `licencias`
--
ALTER TABLE `licencias`
  MODIFY `id_licencia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Filtros para la tabla `autorizaciones`
--
ALTER TABLE `autorizaciones`
  ADD CONSTRAINT `autorizaciones_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `autorizaciones_ibfk_2` FOREIGN KEY (`id_detalle`) REFERENCES `det_autorizacion` (`id_detalle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `autorizaciones_ibfk_3` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`docu_medico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `det_autorizacion`
--
ALTER TABLE `det_autorizacion`
  ADD CONSTRAINT `det_autorizacion_ibfk_1` FOREIGN KEY (`id_auto`) REFERENCES `autorizaciones` (`id_auto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `det_autorizacion_ibfk_2` FOREIGN KEY (`id_medicamento`) REFERENCES `laboratorio` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE;

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

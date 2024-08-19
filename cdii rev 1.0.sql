-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2024 a las 22:17:46
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
-- Base de datos: `cdii`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `matricula` int(11) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apeMaterno` varchar(100) NOT NULL,
  `apePaterno` varchar(100) NOT NULL,
  `nombreSocial` varchar(100) DEFAULT NULL,
  `edad` date NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_curso` int(11) NOT NULL,
  `id_apoderado` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `id_beneficios` int(11) NOT NULL,
  `id_antecedentes` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_talleres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`matricula`, `rut`, `nombres`, `apeMaterno`, `apePaterno`, `nombreSocial`, `edad`, `sexo`, `direccion`, `telefono`, `id_curso`, `id_apoderado`, `id_medico`, `id_carrera`, `id_beneficios`, `id_antecedentes`, `id_pago`, `id_talleres`) VALUES
(180, '19405196-4', 'Rodrigo Ignacio', 'Farias', 'Alarcon', 'HelicopteroApache', '1996-08-23', '', 'mi casa', '98568748', 1, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antecedente`
--

CREATE TABLE `antecedente` (
  `id_antecidentes` int(11) NOT NULL,
  `consultorio` varchar(650) NOT NULL,
  `cantidadHermanos` int(11) NOT NULL,
  `prevencionSalud` varchar(40) NOT NULL,
  `trabaja` varchar(650) NOT NULL,
  `perteneceEtnia` varchar(650) NOT NULL,
  `viveCon` varchar(650) NOT NULL,
  `id_alumno` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoderado`
--

CREATE TABLE `apoderado` (
  `rut` varchar(12) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `paterno` varchar(200) NOT NULL,
  `materno` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ocupacion` varchar(200) NOT NULL,
  `escolaridad` varchar(200) NOT NULL,
  `rol` varchar(100) NOT NULL,
  `id_alumno` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficio`
--

CREATE TABLE `beneficio` (
  `id_beneficio` int(11) NOT NULL,
  `beca_presidenteRe` tinyint(1) NOT NULL,
  `suf_unicoFamiliar` tinyint(1) NOT NULL,
  `beca_indigena` tinyint(1) NOT NULL,
  `porcentajeRegistroSocial` int(11) NOT NULL,
  `utilesEscolares` tinyint(1) NOT NULL,
  `PAE` tinyint(1) NOT NULL,
  `id_alumno` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `nombre_curso` varchar(10) NOT NULL,
  `id_plan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `nombre_curso`, `id_plan`) VALUES
(1, '1A', 310),
(2, '1B', 310),
(3, '3C', 610),
(4, '4C', 610);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `peso` varchar(5) NOT NULL,
  `talla` varchar(5) NOT NULL,
  `calzado` int(11) NOT NULL,
  `grupo_sangre` varchar(10) DEFAULT NULL,
  `dif_aprendisaje` varchar(650) DEFAULT NULL,
  `prog_integracion_es` varchar(650) DEFAULT NULL,
  `discapacidades_enfermedades` varchar(650) DEFAULT NULL,
  `medicamentos` varchar(650) DEFAULT NULL,
  `rut_alumno` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_mod` int(11) NOT NULL,
  `operacion_pagina` varchar(100) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_operacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id_mod`, `operacion_pagina`, `id_rol`, `id_operacion`) VALUES
(1, 'crear_inventario.jsp', 5, 1),
(2, 'crear_inventario.jsp', 5, 4),
(3, 'crear_inventario.jsp', 5, 2),
(4, 'crear_inventario.jsp', 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE `operacion` (
  `id_operacion` int(11) NOT NULL,
  `opracion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `operacion`
--

INSERT INTO `operacion` (`id_operacion`, `opracion`) VALUES
(1, 'Create'),
(2, 'Read'),
(3, 'Update'),
(4, 'Delete');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `centroPadres` double NOT NULL,
  `dechoTaller` double NOT NULL,
  `fechaPago_Padres` date DEFAULT NULL,
  `fechaPago_Taller` date DEFAULT NULL,
  `id_alumno` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participacion`
--

CREATE TABLE `participacion` (
  `participacionTalleres` tinyint(1) NOT NULL,
  `participacionReligion` tinyint(1) NOT NULL,
  `id_alumno` varchar(12) NOT NULL,
  `id_taller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `id_plan` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`id_plan`, `nombre`) VALUES
(510, 'Educación Media T/P Industrial Niños y Jovenes'),
(610, 'Educación Media T/P Técnica niños y jovenes'),
(310, 'Enseñanza Media Humanístico Científico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prioridad_carrera`
--

CREATE TABLE `prioridad_carrera` (
  `id_prioridad` int(11) NOT NULL,
  `prioridad_A` int(11) NOT NULL,
  `prioridad_b` int(11) NOT NULL,
  `id_alumno` varchar(12) NOT NULL,
  `id_carrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(5, 'Administrador'),
(6, 'Digitalizador'),
(7, 'Usuario_Estandar'),
(8, 'Lector');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talleres`
--

CREATE TABLE `talleres` (
  `id_taller` int(11) NOT NULL,
  `nombreTaller` int(11) NOT NULL,
  `id_participacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `rut_usuario` varchar(12) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `paterno` varchar(200) NOT NULL,
  `materno` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `password` varchar(300) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `rut_usuario`, `nombres`, `paterno`, `materno`, `email`, `fechaCreacion`, `password`, `id_rol`) VALUES
(3, '19405196-4', 'Rodrigo Ignacio', 'Farias', 'Alarcon', 'informaticajdpa@educasanantonio.cl', '2024-08-13', '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 5),
(5, '19405196-0', 'Juan Pablo', 'Luciano', 'Facundo', 'fff@gmail.com', '2024-08-13', '44', 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`rut`),
  ADD KEY `FK_curso` (`id_curso`);

--
-- Indices de la tabla `antecedente`
--
ALTER TABLE `antecedente`
  ADD PRIMARY KEY (`id_antecidentes`),
  ADD UNIQUE KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `apoderado`
--
ALTER TABLE `apoderado`
  ADD PRIMARY KEY (`rut`),
  ADD KEY `fk_alumno` (`id_alumno`);

--
-- Indices de la tabla `beneficio`
--
ALTER TABLE `beneficio`
  ADD PRIMARY KEY (`id_beneficio`),
  ADD UNIQUE KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id_carrera`),
  ADD UNIQUE KEY `nombre_carrera` (`nombre_carrera`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD UNIQUE KEY `nombre_curso` (`nombre_curso`),
  ADD KEY `fk_plan` (`id_plan`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `rut_alumno` (`rut_alumno`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_mod`),
  ADD KEY `fk2_modulo` (`id_operacion`),
  ADD KEY `fk_modulo` (`id_rol`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD PRIMARY KEY (`id_operacion`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD UNIQUE KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD KEY `kf_participacion` (`id_alumno`),
  ADD KEY `fk2_participacion` (`id_taller`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id_plan`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `prioridad_carrera`
--
ALTER TABLE `prioridad_carrera`
  ADD PRIMARY KEY (`id_prioridad`),
  ADD UNIQUE KEY `id_alumno` (`id_alumno`),
  ADD KEY `fk3_carrera` (`id_carrera`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`id_taller`),
  ADD UNIQUE KEY `id_participacion` (`id_participacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `rut_usuario` (`rut_usuario`),
  ADD KEY `fk_usuario` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `antecedente`
--
ALTER TABLE `antecedente`
  MODIFY `id_antecidentes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `beneficio`
--
ALTER TABLE `beneficio`
  MODIFY `id_beneficio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_mod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prioridad_carrera`
--
ALTER TABLE `prioridad_carrera`
  MODIFY `id_prioridad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `talleres`
--
ALTER TABLE `talleres`
  MODIFY `id_taller` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `antecedente`
--
ALTER TABLE `antecedente`
  ADD CONSTRAINT `fk_antecidente` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `apoderado`
--
ALTER TABLE `apoderado`
  ADD CONSTRAINT `fk_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `beneficio`
--
ALTER TABLE `beneficio`
  ADD CONSTRAINT `fk_beneficio` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_plan` FOREIGN KEY (`id_plan`) REFERENCES `planes` (`id_plan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `FK_curso2` FOREIGN KEY (`rut_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `fk2_modulo` FOREIGN KEY (`id_operacion`) REFERENCES `operacion` (`id_operacion`),
  ADD CONSTRAINT `fk_modulo` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_pagos` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD CONSTRAINT `fk2_participacion` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kf_participacion` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prioridad_carrera`
--
ALTER TABLE `prioridad_carrera`
  ADD CONSTRAINT `fk2_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk3_carrera` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

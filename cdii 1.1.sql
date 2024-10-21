-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-08-2024 a las 19:17:27
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
create database cdii;
use cdii;

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
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`matricula`, `rut`, `nombres`, `apeMaterno`, `apePaterno`, `nombreSocial`, `edad`, `sexo`, `direccion`, `telefono`, `id_curso`) VALUES
(180, '19405196-4', 'Rodrigo Ignacio', 'Farias', 'Alarcon', 'HelicopteroApache', '1996-08-23', '', 'mi casa', '98568748', 1),
(123, '19757944-7', 'José Eduardo', 'Farías', 'Hinojosa', 'Choripan', '2024-02-07', 'Masculino', 'mi casa', NULL, 4);

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

--
-- Volcado de datos para la tabla `antecedente`
--

INSERT INTO `antecedente` (`id_antecidentes`, `consultorio`, `cantidadHermanos`, `prevencionSalud`, `trabaja`, `perteneceEtnia`, `viveCon`, `id_alumno`) VALUES
(1, 'Consultorio de tejas', 3, 'Fonasa', 'se supone', 'nao', 'Padres', '19757944-7');

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

--
-- Volcado de datos para la tabla `apoderado`
--

INSERT INTO `apoderado` (`rut`, `nombres`, `paterno`, `materno`, `telefono`, `email`, `ocupacion`, `escolaridad`, `rol`, `id_alumno`) VALUES
('123456789-1', 'padre test', 'Hinojosa', 'Abarca', '+56912626925', 'test@gmail.com', 'existir', 'enseñanza media completa', 'testing', '19757944-7');

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

--
-- Volcado de datos para la tabla `beneficio`
--

INSERT INTO `beneficio` (`id_beneficio`, `beca_presidenteRe`, `suf_unicoFamiliar`, `beca_indigena`, `porcentajeRegistroSocial`, `utilesEscolares`, `PAE`, `id_alumno`) VALUES
(1, 1, 0, 0, 45, 0, 0, '19757944-7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id_carrera`, `nombre_carrera`) VALUES
(2, 'Construcciones metalicas'),
(3, 'Elaboracion industrial de elementos\r\n'),
(1, 'Mecanica automotriz'),
(5, 'Refrigeracion y climatizacion'),
(4, 'vestuario y confeccion textil\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conexion_alumnos`
--

CREATE TABLE `conexion_alumnos` (
  `id_conexion` int(11) NOT NULL,
  `id_alumno` varchar(12) NOT NULL,
  `id_apoderado` varchar(12) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `id_beneficio` int(11) NOT NULL,
  `id_antecedentes` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_talleres` int(11) NOT NULL
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

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id_medico`, `peso`, `talla`, `calzado`, `grupo_sangre`, `dif_aprendisaje`, `prog_integracion_es`, `discapacidades_enfermedades`, `medicamentos`, `rut_alumno`) VALUES
(1, '111', 'XL', 41, NULL, 'probando', 'probando', NULL, 'Probando', '19757944-7');

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

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`centroPadres`, `dechoTaller`, `fechaPago_Padres`, `fechaPago_Taller`, `id_alumno`) VALUES
(1000, 1000, '2024-08-30', '2024-08-30', '19757944-7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participacion`
--

CREATE TABLE `participacion` (
  `participacionTalleres` tinyint(1) NOT NULL,
  `participacionReligion` tinyint(1) NOT NULL,
  `id_alumno` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `participacion`
--

INSERT INTO `participacion` (`participacionTalleres`, `participacionReligion`, `id_alumno`) VALUES
(1, 0, '19757944-7');

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
  `id_alumno` varchar(12) NOT NULL
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
  `nombreTaller` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talleres`
--

INSERT INTO `talleres` (`id_taller`, `nombreTaller`) VALUES
(666, 'taller_test'),
(777, 'prueba_taller');

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
(3, '19405196-4', 'Rodrigo Ignacio', 'Farias', 'Alarcon', 'informaticajdpa@educasanantonio.cl', '2024-08-13', 'rere', 5),
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
-- Indices de la tabla `conexion_alumnos`
--
ALTER TABLE `conexion_alumnos`
  ADD PRIMARY KEY (`id_conexion`),
  ADD KEY `fk_alum_antecedente` (`id_antecedentes`),
  ADD KEY `fk_alum_rut` (`id_alumno`),
  ADD KEY `fk_alum_apoderado` (`id_apoderado`),
  ADD KEY `fk_alum_beneficio` (`id_beneficio`),
  ADD KEY `fk_alum_carrera` (`id_carrera`),
  ADD KEY `fk_alum_medico` (`id_medico`),
  ADD KEY `fk_alum_talleres` (`id_talleres`);

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
  ADD KEY `kf_participacion` (`id_alumno`);

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
  ADD UNIQUE KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`id_taller`);

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
  MODIFY `id_antecidentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `beneficio`
--
ALTER TABLE `beneficio`
  MODIFY `id_beneficio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `conexion_alumnos`
--
ALTER TABLE `conexion_alumnos`
  MODIFY `id_conexion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_mod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  ADD CONSTRAINT `fk_curso_alumno` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `antecedente`
--
ALTER TABLE `antecedente`
  ADD CONSTRAINT `fk_alumno_antecedente` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `apoderado`
--
ALTER TABLE `apoderado`
  ADD CONSTRAINT `fk_alumno_apoderado` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`);

--
-- Filtros para la tabla `beneficio`
--
ALTER TABLE `beneficio`
  ADD CONSTRAINT `fk_alumno_beneficio` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `conexion_alumnos`
--
ALTER TABLE `conexion_alumnos`
  ADD CONSTRAINT `fk_conexion_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conexion_antecedentes` FOREIGN KEY (`id_antecedentes`) REFERENCES `antecedente` (`id_antecidentes`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conexion_apoderado` FOREIGN KEY (`id_apoderado`) REFERENCES `apoderado` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conexion_beneficio` FOREIGN KEY (`id_beneficio`) REFERENCES `beneficio` (`id_beneficio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conexion_carrera` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conexion_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conexion_taller` FOREIGN KEY (`id_talleres`) REFERENCES `talleres` (`id_taller`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_plan_curso` FOREIGN KEY (`id_plan`) REFERENCES `planes` (`id_plan`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `fk_alumno_medico` FOREIGN KEY (`rut_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_alumno_pagos` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD CONSTRAINT `fk_alumno_participacion` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prioridad_carrera`
--
ALTER TABLE `prioridad_carrera`
  ADD CONSTRAINT `fk_alumno_prio` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

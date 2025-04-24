-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 01-03-2025 a las 04:22:36
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.2.24
CREATE DATABASE CDII2;
USE CDII2;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `CDII2`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`%` PROCEDURE `InsertarUsuarioCifrado` (IN `p_rut_usuario` VARCHAR(13), IN `p_primerNombre` VARCHAR(100), IN `p_segundoNombre` VARCHAR(100), IN `p_paterno` VARCHAR(100), IN `p_materno` VARCHAR(100), IN `p_email` VARCHAR(100), IN `p_fechaCreacion` DATE, IN `p_password` VARCHAR(100), IN `p_cambioPassword` TINYINT(1), IN `p_id_rol` INT, IN `p_clave_cifrado` VARCHAR(50))   BEGIN
    INSERT INTO Usuario (
        rut_usuario, primerNombre, segundoNombre, paterno, materno, email, 
        fechaCreacion, password, cambioPassword, id_rol
    ) 
    VALUES (
        p_rut_usuario, p_primerNombre, p_segundoNombre, p_paterno, p_materno, p_email, 
        p_fechaCreacion, AES_ENCRYPT(p_password, p_clave_cifrado), p_cambioPassword, p_id_rol
    );
END$$

CREATE DEFINER=`root`@`%` PROCEDURE `ObtenerPermisosPorRol` (IN `rol_param` INT)   BEGIN
    SELECT 
        Usuario.rut_usuario AS 'RUT', 
        Permisos.nombre_web AS 'DIRECTORIO', 
        roles.nombre_rol AS 'ROL', 
        roles.id_rol AS 'ID'
    FROM Usuario 
    INNER JOIN roles ON Usuario.id_rol = roles.id_rol 
    INNER JOIN Permisos ON Permisos.id_rol = roles.id_rol
    WHERE Permisos.id_rol = rol_param;
END$$

CREATE DEFINER=`root`@`%` PROCEDURE `ObtenerUsuariosDescifrados` (IN `p_clave_cifrado` VARCHAR(50))   BEGIN
    SELECT 
        id_usuario, 
        rut_usuario, 
        primerNombre, 
        segundoNombre, 
        paterno, 
        materno, 
        email, 
        fechaCreacion, 
        AES_DECRYPT(password, p_clave_cifrado) AS password_descifrada, 
        cambioPassword, 
        id_rol
    FROM Usuario;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Permisos`
--

CREATE TABLE `Permisos` (
  `id_permiso` int NOT NULL,
  `id_rol` int DEFAULT NULL,
  `nombre_web` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Permisos`
--

INSERT INTO `Permisos` (`id_permiso`, `id_rol`, `nombre_web`) VALUES
(1, 2, 'HOME.JSP'),
(2, 2, 'INVENTARIO_DINAMICO.JSP'),
(3, 2, 'BUSCAR_INVENTARIO.JSP'),
(4, 2, 'BUSCAR_USUARIO.JSP'),
(5, 2, 'CREAR_INVENTARIO.JSP'),
(6, 2, 'EDITAR_CUENTA.JSP'),
(7, 2, 'EDITAR_INVENTARIO.JSP'),
(8, 2, 'ESTADO_REQUERIMIENTO.JSP'),
(9, 2, 'INDEX.JSP'),
(10, 2, 'INGRESO_REQUERIMIENTO.JSP'),
(11, 2, 'REGISTRAR_USUARIO.JSP'),
(12, 2, 'USUARIO.JSP'),
(13, 1, 'INDEX.JSP'),
(14, 3, 'INDEX.JSP'),
(15, 1, 'HOME.JSP'),
(16, 3, 'HOME.JSP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimiento`
--

CREATE TABLE `requerimiento` (
  `id_requerimiento` int NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_revisado` date DEFAULT NULL,
  `tipo_requerimiento` varchar(100) NOT NULL,
  `contenido` varchar(10000) NOT NULL,
  `id_usuario` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `requerimiento`
--

INSERT INTO `requerimiento` (`id_requerimiento`, `fecha_ingreso`, `fecha_revisado`, `tipo_requerimiento`, `contenido`, `id_usuario`) VALUES
(1, '2025-03-01', NULL, 'PETICION DE HERRAMIENTAS', 'SE NECESITAN UN JUEGO DE LLAVES DADO', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int NOT NULL,
  `nombre_rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Docente'),
(2, 'Administrador'),
(3, 'Lector');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id_usuario` int NOT NULL,
  `rut_usuario` varchar(13) NOT NULL,
  `primerNombre` varchar(100) NOT NULL,
  `segundoNombre` varchar(100) DEFAULT NULL,
  `paterno` varchar(100) NOT NULL,
  `materno` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `password` varbinary(255) DEFAULT NULL,
  `cambioPassword` tinyint(1) NOT NULL,
  `id_rol` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id_usuario`, `rut_usuario`, `primerNombre`, `segundoNombre`, `paterno`, `materno`, `email`, `fechaCreacion`, `password`, `cambioPassword`, `id_rol`) VALUES
(1, '19405196-4', 'Rodrigo', 'Ignacio', 'Farias', 'Alarcon', 'rodrigoignacio.fa@gmail.com', '2025-03-01', 0x72726565, 0, 2),
(2, '19405196-0', 'Elizabeth', 'Paulina', 'Pardo', 'Montes', 'eli.1998@gmail.com', '2025-03-01', 0x77656e707166776f69756877, 0, 1),
(3, '19405197-5', 'Katherine', 'Alejandra', 'Farias', 'Pardo', 'katy200@gmail.com', '2025-03-01', 0x6b617479, 0, 3),
(4, '18405197-4', 'Gonzalo', 'Robert', 'Llanos', 'Alberto', 'gonzalo@gmail.com', '2025-03-01', 0x676f676f676f33393339, 0, 1),
(5, '12345678-9', 'Juan', 'Carlos', 'Pérez', 'Gómez', 'juan@email.com', '2024-03-01', 0x7df1ced96889b4c5363ec2f805901ba45d994d1b382bedf8cada6b579bc6380c, 0, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Permisos`
--
ALTER TABLE `Permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  ADD PRIMARY KEY (`id_requerimiento`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `rut_usuario` (`rut_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Permisos`
--
ALTER TABLE `Permisos`
  MODIFY `id_permiso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  MODIFY `id_requerimiento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Permisos`
--
ALTER TABLE `Permisos`
  ADD CONSTRAINT `Permisos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  ADD CONSTRAINT `requerimiento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);

--
-- Filtros para la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-05-2018 a las 08:20:41
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalle` (IN `fecha1_` DATE, IN `fecha2_` DATE)  BEGIN


SELECT usuario.idUsuario, usuario.priNombre, usuario.priApellido, proyecto.nomProyecto, proyecto.fecha, tema.descripTema FROM usuario, proyecto, tema ;


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `codigoCom` int(18) NOT NULL,
  `codigoUsu` int(18) DEFAULT NULL,
  `codigoPro` int(18) DEFAULT NULL,
  `comentario` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `codigoNot` int(18) NOT NULL,
  `idTipUsuario` int(2) DEFAULT NULL,
  `informacion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='									';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `codigoPro` int(18) NOT NULL,
  `nomProyecto` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `codTema` int(18) DEFAULT NULL,
  `archivo` mediumblob,
  `video` longblob,
  `codigoUsu` int(18) DEFAULT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`codigoPro`, `nomProyecto`, `fecha`, `codTema`, `archivo`, `video`, `codigoUsu`, `descripcion`) VALUES
(1, 'Sistema de Control y Almacenamiento de Proyectos', '2018-05-23 11:30:00', 1, NULL, NULL, 1072197162, 'Este sistema aparte de permitir almacenarlo en la nube permite que demas personas lo conozca y comente  si les gusta o si tienen mejoras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `codTema` int(18) NOT NULL,
  `descripTema` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`codTema`, `descripTema`) VALUES
(1, 'Tecnologico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipusuario`
--

CREATE TABLE `tipusuario` (
  `idTipUsuario` int(2) NOT NULL,
  `tip` int(11) NOT NULL,
  `codigoUsu` int(18) DEFAULT NULL,
  `descripcon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipusuario`
--

INSERT INTO `tipusuario` (`idTipUsuario`, `tip`, `codigoUsu`, `descripcon`) VALUES
(1, 1, 1072197162, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(18) NOT NULL,
  `priNombre` varchar(15) DEFAULT NULL,
  `segNombre` varchar(15) DEFAULT NULL,
  `priApellido` varchar(15) DEFAULT NULL,
  `segApellido` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `priNombre`, `segNombre`, `priApellido`, `segApellido`) VALUES
(1072197162, 'Juan', 'Sebastian', 'Carrero', 'Rodriguez');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`codigoCom`),
  ADD KEY `comP_idx` (`codigoPro`),
  ADD KEY `comU_idx` (`codigoUsu`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`codigoNot`),
  ADD KEY `noti_idx` (`idTipUsuario`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`codigoPro`),
  ADD KEY `tema_idx` (`codTema`),
  ADD KEY `usuario__idx` (`codigoUsu`);

--
-- Indices de la tabla `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`codTema`);

--
-- Indices de la tabla `tipusuario`
--
ALTER TABLE `tipusuario`
  ADD PRIMARY KEY (`idTipUsuario`),
  ADD UNIQUE KEY `codigoUsu_UNIQUE` (`codigoUsu`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `codigoPro` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipusuario`
--
ALTER TABLE `tipusuario`
  MODIFY `idTipUsuario` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comP` FOREIGN KEY (`codigoPro`) REFERENCES `proyecto` (`codigoPro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comU` FOREIGN KEY (`codigoUsu`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`codigoNot`) REFERENCES `tipusuario` (`idTipUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `tema` FOREIGN KEY (`codTema`) REFERENCES `tema` (`codTema`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_` FOREIGN KEY (`codigoUsu`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `tipusuario` (`codigoUsu`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

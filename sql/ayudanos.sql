-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-03-2018 a las 15:53:13
-- Versión del servidor: 5.5.59-0+deb8u1
-- Versión de PHP: 5.6.33-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ayudanos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuEventos`
--

CREATE TABLE IF NOT EXISTS `ayuEventos` (
`eveCod` int(11) NOT NULL,
  `eveEstado` enum('A','B') NOT NULL,
  `eveNombre` varchar(50) NOT NULL,
  `eveDireccion` varchar(100) NOT NULL,
  `eveFecha` date NOT NULL,
  `eveFecAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuTipoDoc`
--

CREATE TABLE IF NOT EXISTS `ayuTipoDoc` (
`tipCod` int(11) NOT NULL,
  `tipDescripcion` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ayuTipoDoc`
--

INSERT INTO `ayuTipoDoc` (`tipCod`, `tipDescripcion`) VALUES
(1, 'DNI'),
(2, 'Cédula'),
(3, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuUsuarios`
--

CREATE TABLE IF NOT EXISTS `ayuUsuarios` (
`usuCod` int(11) NOT NULL,
  `usuEstado` enum('A','B') NOT NULL COMMENT 'Estado del usuario (A: Activo, B: Baja)',
  `usuNombre` varchar(50) NOT NULL,
  `usuApellido` varchar(50) NOT NULL,
  `usuEmail` varchar(50) NOT NULL,
  `tipCod` int(11) NOT NULL,
  `usuPais` varchar(50) NOT NULL,
  `usuProvincia` varchar(50) NOT NULL,
  `usuDireccion` varchar(100) NOT NULL,
  `usuTipo` enum('N','O','A') NOT NULL COMMENT 'Tipo de Usuario (N: Necesita ayuda, O: Ofrece ayuda, A: Ambos)',
  `usuProfesion` varchar(50) NOT NULL,
  `usuFecAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuUsuariosEventos`
--

CREATE TABLE IF NOT EXISTS `ayuUsuariosEventos` (
  `usuCod` int(11) NOT NULL,
  `eveCod` int(11) NOT NULL,
  `uevEstado` enum('A','B') NOT NULL,
  `uevFecAlta` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ayuEventos`
--
ALTER TABLE `ayuEventos`
 ADD PRIMARY KEY (`eveCod`);

--
-- Indices de la tabla `ayuTipoDoc`
--
ALTER TABLE `ayuTipoDoc`
 ADD PRIMARY KEY (`tipCod`);

--
-- Indices de la tabla `ayuUsuarios`
--
ALTER TABLE `ayuUsuarios`
 ADD PRIMARY KEY (`usuCod`), ADD KEY `tipCod` (`tipCod`);

--
-- Indices de la tabla `ayuUsuariosEventos`
--
ALTER TABLE `ayuUsuariosEventos`
 ADD UNIQUE KEY `usuCod` (`usuCod`,`eveCod`), ADD KEY `fk_cod_evento` (`eveCod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ayuEventos`
--
ALTER TABLE `ayuEventos`
MODIFY `eveCod` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ayuTipoDoc`
--
ALTER TABLE `ayuTipoDoc`
MODIFY `tipCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `ayuUsuarios`
--
ALTER TABLE `ayuUsuarios`
MODIFY `usuCod` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ayuUsuarios`
--
ALTER TABLE `ayuUsuarios`
ADD CONSTRAINT `fk_tipo_doc` FOREIGN KEY (`tipCod`) REFERENCES `ayuTipoDoc` (`tipCod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ayuUsuariosEventos`
--
ALTER TABLE `ayuUsuariosEventos`
ADD CONSTRAINT `fk_cod_evento` FOREIGN KEY (`eveCod`) REFERENCES `ayuEventos` (`eveCod`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_cod_usuario` FOREIGN KEY (`usuCod`) REFERENCES `ayuUsuarios` (`usuCod`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/* USUARIO PARA LA BASE DE DATOS */
CREATE USER 'ayudanos'@'localhost' IDENTIFIED BY 'M4dur0c0#03Tum4dr3';
GRANT ALL PRIVILEGES ON ayudanos.* TO 'ayudanos'@'localhost';
FLUSH PRIVILEGES;

/*Número de documento del usuario*/
ALTER TABLE `ayuUsuarios` ADD `usuDocumento` INT NOT NULL AFTER `tipCod`;

/*Comentarios del usuario - Colocar en NULL*/
ALTER TABLE `ayuUsuarios` ADD `usuComentarios` VARCHAR(150) NOT NULL AFTER `usuProfesion`;
ALTER TABLE `ayuUsuarios` CHANGE `usuComentarios` `usuComentarios` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL;

/*EMAIL UNIQUE*/
ALTER TABLE `ayuUsuarios` ADD UNIQUE(`usuEmail`);
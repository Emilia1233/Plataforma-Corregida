-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2022 a las 17:12:15
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aulavirtual_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_a` int(3) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `inasistencias` varchar(20) NOT NULL,
  `id_u` int(8) NOT NULL,
  `curso` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_a`, `dni`, `nombre`, `apellido`, `inasistencias`, `id_u`, `curso`) VALUES
(1, '4502368799', 'Juan', 'Lopez', '7', 1, '7A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(1) NOT NULL,
  `nombre_materia` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `nombre_materia`) VALUES
(1, 'LENGUA'),
(2, 'FISICA'),
(3, 'QUIMICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiaxprofe`
--

CREATE TABLE `materiaxprofe` (
  `duracion_clase` varchar(30) NOT NULL,
  `id_materia` int(1) NOT NULL,
  `id_profe` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `primer_t` varchar(4) NOT NULL,
  `segundo_t` varchar(4) NOT NULL,
  `tercer_t` varchar(4) NOT NULL,
  `promedio` varchar(4) NOT NULL,
  `id_materia` int(1) NOT NULL,
  `id_a` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`primer_t`, `segundo_t`, `tercer_t`, `promedio`, `id_materia`, `id_a`) VALUES
('5', '2', '3', '3', 1, 1),
('10', '10', '10', '10', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profe` int(8) NOT NULL,
  `dni_prof` char(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_u` int(8) NOT NULL,
  `user` char(10) DEFAULT NULL,
  `pass` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_u`, `user`, `pass`) VALUES
(1, 'eeeee', '77'),
(4, 'lengua', NULL),
(5, 'lengua', NULL),
(6, 'aaa', NULL),
(7, 'asds', 'asdsa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_a`),
  ADD KEY `au` (`id_u`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `materiaxprofe`
--
ALTER TABLE `materiaxprofe`
  ADD KEY `mp` (`id_materia`),
  ADD KEY `mp2` (`id_profe`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD KEY `am` (`id_materia`),
  ADD KEY `al` (`id_a`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profe`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_u`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id_a` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id_profe` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_u` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `au` FOREIGN KEY (`id_u`) REFERENCES `usuarios` (`id_u`);

--
-- Filtros para la tabla `materiaxprofe`
--
ALTER TABLE `materiaxprofe`
  ADD CONSTRAINT `mp` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`),
  ADD CONSTRAINT `mp2` FOREIGN KEY (`id_profe`) REFERENCES `profesores` (`id_profe`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `al` FOREIGN KEY (`id_a`) REFERENCES `alumno` (`id_a`),
  ADD CONSTRAINT `am` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

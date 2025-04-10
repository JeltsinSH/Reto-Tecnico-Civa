-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2025 a las 17:48:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `civa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bus`
--

CREATE TABLE `bus` (
  `id` bigint(20) NOT NULL,
  `numero_bus` varchar(255) DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `caracteristicas` varchar(255) DEFAULT NULL,
  `activo` bit(1) NOT NULL,
  `marca_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bus`
--

INSERT INTO `bus` (`id`, `numero_bus`, `placa`, `fecha_creacion`, `caracteristicas`, `activo`, `marca_id`) VALUES
(1, '1001', 'ABC-123', '2005-05-01', 'Bus premium', b'1', 1),
(2, '1002', 'XYZ-456', '2020-01-15', 'Bus económico', b'0', 2),
(3, '1003', 'DEF-789', '2018-06-20', 'Bus interprovincial', b'1', 1),
(4, '1004', 'GHI-012', '2019-08-14', 'Bus urbano', b'0', 2),
(5, '1005', 'JKL-345', '2021-03-02', 'Bus de turismo', b'1', 3),
(6, '1006', 'MNO-678', '2017-05-10', 'Bus escolar', b'1', 4),
(7, '1007', 'PQR-901', '2020-02-18', 'Bus de transporte de personal', b'0', 5),
(8, '1008', 'STU-234', '2021-07-22', 'Bus turístico', b'1', 6),
(9, '1009', 'VWX-567', '2022-01-10', 'Bus de largo recorrido', b'1', 7),
(10, '1010', 'YZA-890', '2019-11-05', 'Bus de transporte público', b'0', 8),
(11, '1011', 'BCD-123', '2020-09-17', 'Bus de servicio exprés', b'1', 9),
(12, '1012', 'EFG-456', '2018-12-08', 'Bus de lujo', b'1', 10),
(13, '1013', 'HIJ-789', '2015-02-25', 'Bus interprovincial de lujo', b'1', 1),
(14, '1014', 'KLM-012', '2014-07-14', 'Bus de transporte urbano', b'0', 2),
(15, '1015', 'NOP-345', '2021-01-13', 'Bus turístico de lujo', b'1', 3),
(16, '1016', 'QRS-678', '2020-11-01', 'Bus urbano', b'1', 4),
(17, '1017', 'TUV-901', '2017-03-06', 'Bus de transporte escolar', b'0', 5),
(18, '1018', 'WXY-234', '2022-06-25', 'Bus de larga distancia', b'1', 6),
(19, '1019', 'ZAB-567', '2018-09-17', 'Bus turístico internacional', b'1', 7),
(20, '1020', 'CDE-890', '2019-04-11', 'Bus de transporte público interurbano', b'0', 8),
(21, '1021', 'FGH-123', '2021-08-12', 'Bus de servicio exprés interprovincial', b'1', 9),
(22, '1022', 'IJK-456', '2020-05-21', 'Bus de lujo urbano', b'1', 10),
(23, '1023', 'LMN-789', '2021-11-19', 'Bus de transporte de personal de empresa', b'1', 1),
(24, '1024', 'OPQ-012', '2016-10-30', 'Bus de transporte turístico rural', b'0', 2),
(25, '1025', 'RST-345', '2022-01-28', 'Bus de transporte privado', b'1', 3),
(26, '1026', 'UVW-678', '2019-12-03', 'Bus interprovincial de lujo', b'1', 4),
(27, '1027', 'XYZ-901', '2021-02-15', 'Bus turístico de largo recorrido', b'1', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`) VALUES
(1, 'Volvo'),
(2, 'Scania'),
(3, 'Fiat'),
(4, 'Mercedes-Benz'),
(5, 'MAN'),
(6, 'Renault'),
(7, 'Iveco'),
(8, 'Ford'),
(9, 'Chevrolet'),
(10, 'Hino');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bus`
--
ALTER TABLE `bus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

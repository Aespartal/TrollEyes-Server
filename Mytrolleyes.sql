-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-11-2019 a las 13:54:44
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trolleyes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `factura_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `cantidad`, `factura_id`, `producto_id`) VALUES
(1, 33, 25, 24),
(2, 43, 10, 3),
(3, 32, 19, 13),
(4, 49, 11, 6),
(5, 49, 17, 6),
(6, 39, 22, 7),
(7, 7, 10, 18),
(8, 48, 15, 4),
(9, 21, 22, 9),
(10, 48, 10, 3),
(11, 44, 17, 25),
(12, 32, 21, 5),
(13, 9, 2, 15),
(14, 40, 1, 8),
(15, 33, 8, 21),
(16, 27, 6, 25),
(17, 15, 21, 11),
(18, 6, 2, 6),
(19, 37, 1, 7),
(20, 22, 5, 17),
(21, 45, 4, 18),
(22, 44, 10, 22),
(23, 30, 18, 7),
(24, 16, 22, 10),
(25, 27, 10, 20),
(26, 10, 21, 14),
(27, 40, 16, 18),
(28, 40, 21, 2),
(29, 47, 19, 21),
(30, 30, 24, 5),
(31, 35, 18, 10),
(32, 6, 17, 6),
(33, 40, 14, 14),
(34, 30, 19, 5),
(35, 24, 3, 3),
(36, 16, 25, 24),
(37, 32, 20, 23),
(38, 24, 17, 24),
(39, 16, 12, 5),
(40, 35, 3, 20),
(41, 8, 18, 6),
(42, 31, 24, 23),
(43, 43, 21, 20),
(44, 42, 19, 18),
(45, 1, 24, 17),
(46, 9, 11, 11),
(47, 22, 14, 8),
(48, 37, 21, 1),
(49, 21, 9, 8),
(50, 42, 24, 2),
(51, 48, 1, 3),
(52, 3, 24, 20),
(53, 18, 10, 16),
(54, 35, 9, 24),
(55, 48, 15, 18),
(56, 36, 11, 4),
(57, 8, 19, 14),
(58, 16, 19, 15),
(59, 10, 15, 9),
(60, 19, 16, 4),
(61, 39, 20, 17),
(62, 42, 3, 6),
(63, 37, 13, 15),
(64, 4, 19, 1),
(65, 43, 17, 5),
(66, 11, 22, 4),
(67, 21, 17, 16),
(68, 43, 7, 20),
(69, 14, 21, 23),
(70, 32, 13, 20),
(71, 12, 1, 21),
(72, 9, 4, 21),
(73, 44, 25, 23),
(74, 14, 18, 23),
(75, 45, 2, 22),
(76, 4, 14, 2),
(77, 14, 5, 17),
(78, 33, 22, 14),
(79, 34, 3, 11),
(80, 10, 12, 18),
(81, 35, 25, 18),
(82, 1, 16, 14),
(83, 38, 5, 24),
(84, 4, 3, 5),
(85, 29, 24, 12),
(86, 38, 24, 4),
(87, 35, 18, 9),
(88, 43, 2, 16),
(89, 21, 19, 2),
(90, 34, 25, 9),
(91, 6, 19, 6),
(92, 22, 16, 2),
(93, 23, 17, 13),
(94, 6, 12, 25),
(95, 32, 7, 8),
(96, 22, 4, 23),
(97, 3, 3, 12),
(98, 25, 19, 7),
(99, 31, 13, 1),
(100, 35, 18, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `iva` int(3) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `fecha`, `iva`, `usuario_id`) VALUES
(1, '2015-07-23', 21, 21),
(2, '2017-07-21', 21, 4),
(3, '2014-03-23', 21, 22),
(4, '2019-11-02', 21, 25),
(5, '2016-03-31', 21, 11),
(6, '2017-06-27', 21, 2),
(7, '2014-08-15', 21, 20),
(8, '2014-05-21', 21, 23),
(9, '2018-07-16', 21, 11),
(10, '2016-01-08', 21, 20),
(11, '2019-01-13', 21, 6),
(12, '2018-10-01', 21, 13),
(13, '2018-05-28', 21, 21),
(14, '2019-06-13', 21, 21),
(15, '2018-03-29', 21, 26),
(16, '2017-10-20', 21, 26),
(17, '2016-09-03', 21, 18),
(18, '2014-11-28', 21, 16),
(19, '2017-01-31', 21, 13),
(20, '2016-09-04', 21, 24),
(21, '2019-09-27', 21, 26),
(22, '2016-01-02', 21, 18),
(23, '2015-11-08', 21, 9),
(24, '2018-06-29', 21, 22),
(25, '2019-10-18', 21, 4),
(26, '2019-03-05', 21, 4),
(27, '2018-04-08', 21, 8),
(28, '2018-02-08', 21, 4),
(29, '2019-07-17', 21, 21),
(30, '2015-06-30', 21, 2),
(31, '2015-08-24', 21, 23),
(32, '2019-04-11', 21, 21),
(33, '2017-05-25', 21, 7),
(34, '2015-01-18', 21, 24),
(35, '2018-08-09', 21, 18),
(36, '2014-01-01', 21, 4),
(37, '2017-04-28', 21, 25),
(38, '2015-05-23', 21, 14),
(39, '2014-12-16', 21, 7),
(40, '2018-11-05', 21, 13),
(41, '2019-10-14', 21, 17),
(42, '2018-10-10', 21, 20),
(43, '2015-05-09', 21, 24),
(44, '2016-01-21', 21, 21),
(45, '2017-06-15', 21, 3),
(46, '2014-03-05', 21, 19),
(47, '2015-08-28', 21, 14),
(48, '2017-02-02', 21, 8),
(49, '2016-06-19', 21, 6),
(50, '2016-11-09', 21, 21),
(51, '2014-12-09', 21, 3),
(52, '2017-04-11', 21, 5),
(53, '2014-10-02', 21, 22),
(54, '2016-01-06', 21, 9),
(55, '2017-05-03', 21, 25),
(56, '2015-02-07', 21, 22),
(57, '2016-04-26', 21, 21),
(58, '2019-04-28', 21, 12),
(59, '2015-10-31', 21, 18),
(60, '2019-01-14', 21, 14),
(61, '2014-03-25', 21, 21),
(62, '2014-08-27', 21, 18),
(63, '2015-07-28', 21, 6),
(64, '2017-11-29', 21, 24),
(65, '2019-07-14', 21, 26),
(66, '2015-08-10', 21, 9),
(67, '2014-06-17', 21, 5),
(68, '2015-08-13', 21, 12),
(69, '2014-12-08', 21, 19),
(70, '2015-11-10', 21, 22),
(71, '2014-03-18', 21, 15),
(72, '2016-11-07', 21, 3),
(73, '2015-09-26', 21, 20),
(74, '2017-12-23', 21, 21),
(75, '2014-10-17', 21, 19),
(76, '2014-08-08', 21, 25),
(77, '2014-07-15', 21, 3),
(78, '2018-07-09', 21, 16),
(79, '2019-12-18', 21, 25),
(80, '2019-10-18', 21, 24),
(81, '2015-08-06', 21, 15),
(82, '2014-10-15', 21, 12),
(83, '2016-01-31', 21, 23),
(84, '2016-11-13', 21, 15),
(85, '2016-12-27', 21, 7),
(86, '2014-02-21', 21, 10),
(87, '2019-11-02', 21, 4),
(88, '2017-03-07', 21, 24),
(89, '2015-04-21', 21, 7),
(90, '2019-08-30', 21, 23),
(91, '2018-04-21', 21, 6),
(92, '2015-03-16', 21, 16),
(93, '2017-03-06', 21, 8),
(94, '2015-04-24', 21, 2),
(95, '2015-08-05', 21, 2),
(96, '2018-02-11', 21, 13),
(97, '2018-12-09', 21, 26),
(98, '2017-12-20', 21, 20),
(99, '2017-04-13', 21, 8),
(100, '2019-01-07', 21, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `existencias` int(10) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `existencias`, `precio`, `imagen`, `descripcion`, `tipo_producto_id`) VALUES
(1, '234358', 13, '6.61', 'link a una imagen', 'Interruptor para dientes. ', 11),
(2, '646804', 528, '4.72', 'link a una imagen', 'Libro de manzana. ', 9),
(3, '691463', 481, '70.00', 'link a una imagen', 'Bebida de  montar tubos. ', 2),
(4, '836369', 460, '8.85', 'link a una imagen', 'Interruptor para montar tubos. ', 8),
(5, '446303', 620, '3.35', 'link a una imagen', 'Libro de dientes. ', 6),
(6, '454171', 55, '5.74', 'link a una imagen', 'Maquina de montar tubos. ', 3),
(7, '542252', 405, '9.37', 'link a una imagen', 'Interruptor para manzana. ', 11),
(8, '929908', 400, '1.86', 'link a una imagen', 'Bebida de  emparejar. ', 11),
(9, '402798', 202, '6.88', 'link a una imagen', 'Maquina de manzana. ', 5),
(10, '142676', 613, '7.19', 'link a una imagen', 'Interruptor para montar tubos. ', 7),
(11, '564053', 968, '3.58', 'link a una imagen', 'Bebida de  manzana. ', 10),
(12, '466932', 813, '8.82', 'link a una imagen', 'Bebida de  emparejar. ', 4),
(13, '776580', 506, '9.22', 'link a una imagen', 'Maquina de dientes. ', 11),
(14, '610267', 751, '4.09', 'link a una imagen', 'Interruptor para emparejar. ', 11),
(15, '555623', 674, '2.95', 'link a una imagen', 'Maquina de manzana. ', 3),
(16, '529765', 660, '8.22', 'link a una imagen', 'Interruptor para manzana. ', 10),
(17, '946970', 254, '6.46', 'link a una imagen', 'Maquina de emparejar. ', 1),
(18, '534814', 514, '3.13', 'link a una imagen', 'Bebida de  emparejar. ', 1),
(19, '804529', 362, '3.41', 'link a una imagen', 'Maquina de montar tubos. ', 11),
(20, '995804', 378, '7.48', 'link a una imagen', 'Maquina de manzana. ', 9),
(21, '745091', 894, '56.00', 'link a una imagen', 'Interruptor para manzana. ', 2),
(22, '780406', 2, '3.88', 'link a una imagen', 'Libro de dientes. ', 4),
(23, '255849', 503, '9.00', 'link a una imagen', 'Bebida de  emparejar. ', 11),
(24, '132002', 104, '4.76', 'link a una imagen', 'Libro de montar tubos. ', 12),
(25, '780901', 11, '1.92', 'link a una imagen', 'Maquina de dientes. ', 9),
(26, '288323', 64, '8.01', 'link a una imagen', 'Interruptor para montar tubos. ', 10),
(27, '204286', 995, '92.00', 'link a una imagen', 'Maquina de montar tubos. ', 4),
(28, '912489', 866, '2.08', 'link a una imagen', 'Maquina de manzana. ', 3),
(29, '779020', 502, '4.98', 'link a una imagen', 'Interruptor para manzana. ', 12),
(30, '373365', 218, '2.56', 'link a una imagen', 'Interruptor para manzana. ', 9),
(31, '224188', 464, '4.22', 'link a una imagen', 'Bebida de  dientes. ', 9),
(32, '367543', 684, '4.66', 'link a una imagen', 'Interruptor para montar tubos. ', 10),
(33, '525289', 455, '5.71', 'link a una imagen', 'Libro de montar tubos. ', 7),
(34, '821252', 609, '88.00', 'link a una imagen', 'Bebida de  dientes. ', 1),
(35, '726887', 853, '40.00', 'link a una imagen', 'Bebida de  montar tubos. ', 8),
(36, '147095', 291, '8.85', 'link a una imagen', 'Interruptor para dientes. ', 1),
(37, '601013', 327, '7.90', 'link a una imagen', 'Interruptor para manzana. ', 3),
(38, '657797', 619, '2.55', 'link a una imagen', 'Bebida de  emparejar. ', 4),
(39, '209842', 816, '1.04', 'link a una imagen', 'Interruptor para manzana. ', 7),
(40, '656988', 945, '8.57', 'link a una imagen', 'Interruptor para montar tubos. ', 5),
(41, '756858', 860, '2.66', 'link a una imagen', 'Bebida de  emparejar. ', 10),
(42, '935549', 426, '69.00', 'link a una imagen', 'Bebida de  dientes. ', 3),
(43, '237015', 176, '5.89', 'link a una imagen', 'Interruptor para emparejar. ', 3),
(44, '301187', 526, '7.55', 'link a una imagen', 'Bebida de  dientes. ', 5),
(45, '753333', 854, '2.50', 'link a una imagen', 'Libro de emparejar. ', 6),
(46, '358616', 619, '2.86', 'link a una imagen', 'Libro de montar tubos. ', 5),
(47, '364955', 481, '5.55', 'link a una imagen', 'Interruptor para manzana. ', 12),
(48, '438139', 871, '2.37', 'link a una imagen', 'Bebida de  emparejar. ', 1),
(49, '169827', 689, '9.74', 'link a una imagen', 'Interruptor para montar tubos. ', 10),
(50, '441368', 695, '9.33', 'link a una imagen', 'Maquina de montar tubos. ', 7),
(51, '104024', 425, '7.03', 'link a una imagen', 'Bebida de  emparejar. ', 10),
(52, '234496', 75, '8.62', 'link a una imagen', 'Bebida de  dientes. ', 9),
(53, '659139', 265, '5.60', 'link a una imagen', 'Bebida de  manzana. ', 1),
(54, '671726', 14, '9.61', 'link a una imagen', 'Interruptor para montar tubos. ', 12),
(55, '479228', 638, '7.54', 'link a una imagen', 'Maquina de manzana. ', 5),
(56, '474391', 179, '9.00', 'link a una imagen', 'Interruptor para montar tubos. ', 1),
(57, '399480', 727, '4.36', 'link a una imagen', 'Maquina de montar tubos. ', 6),
(58, '824733', 542, '6.09', 'link a una imagen', 'Interruptor para emparejar. ', 2),
(59, '230107', 136, '9.54', 'link a una imagen', 'Maquina de emparejar. ', 11),
(60, '957487', 502, '8.26', 'link a una imagen', 'Maquina de emparejar. ', 1),
(61, '870858', 137, '4.52', 'link a una imagen', 'Maquina de emparejar. ', 3),
(62, '347122', 487, '72.00', 'link a una imagen', 'Bebida de  manzana. ', 8),
(63, '364133', 439, '7.65', 'link a una imagen', 'Bebida de  manzana. ', 6),
(64, '193982', 526, '7.23', 'link a una imagen', 'Maquina de montar tubos. ', 9),
(65, '857852', 975, '5.91', 'link a una imagen', 'Libro de dientes. ', 10),
(66, '708566', 624, '8.60', 'link a una imagen', 'Interruptor para dientes. ', 10),
(67, '853067', 124, '5.32', 'link a una imagen', 'Interruptor para dientes. ', 10),
(68, '479791', 65, '6.17', 'link a una imagen', 'Libro de emparejar. ', 7),
(69, '955677', 139, '9.75', 'link a una imagen', 'Libro de montar tubos. ', 1),
(70, '190343', 922, '9.42', 'link a una imagen', 'Libro de manzana. ', 4),
(71, '936743', 345, '6.75', 'link a una imagen', 'Libro de dientes. ', 2),
(72, '510098', 177, '9.35', 'link a una imagen', 'Libro de manzana. ', 4),
(73, '231528', 785, '5.84', 'link a una imagen', 'Maquina de manzana. ', 9),
(74, '957072', 788, '5.43', 'link a una imagen', 'Bebida de  montar tubos. ', 1),
(75, '773704', 573, '7.27', 'link a una imagen', 'Bebida de  manzana. ', 9),
(76, '664486', 14, '1.16', 'link a una imagen', 'Maquina de emparejar. ', 2),
(77, '668141', 229, '8.57', 'link a una imagen', 'Bebida de  emparejar. ', 1),
(78, '332288', 19, '2.09', 'link a una imagen', 'Bebida de  montar tubos. ', 5),
(79, '153176', 589, '2.37', 'link a una imagen', 'Interruptor para montar tubos. ', 5),
(80, '871843', 580, '81.00', 'link a una imagen', 'Libro de emparejar. ', 9),
(81, '591534', 729, '1.12', 'link a una imagen', 'Interruptor para dientes. ', 11),
(82, '973484', 280, '5.08', 'link a una imagen', 'Bebida de  emparejar. ', 3),
(83, '557805', 493, '3.71', 'link a una imagen', 'Bebida de  emparejar. ', 6),
(84, '438252', 90, '9.38', 'link a una imagen', 'Libro de montar tubos. ', 2),
(85, '359861', 844, '4.52', 'link a una imagen', 'Libro de dientes. ', 9),
(86, '617394', 719, '4.75', 'link a una imagen', 'Bebida de  dientes. ', 12),
(87, '441633', 251, '7.36', 'link a una imagen', 'Maquina de dientes. ', 4),
(88, '896065', 396, '8.86', 'link a una imagen', 'Libro de dientes. ', 10),
(89, '165361', 737, '5.94', 'link a una imagen', 'Libro de manzana. ', 2),
(90, '141167', 11, '6.57', 'link a una imagen', 'Libro de manzana. ', 7),
(91, '362745', 46, '7.45', 'link a una imagen', 'Libro de emparejar. ', 11),
(92, '107371', 692, '58.00', 'link a una imagen', 'Libro de emparejar. ', 3),
(93, '176330', 582, '7.81', 'link a una imagen', 'Bebida de  montar tubos. ', 8),
(94, '960163', 947, '3.90', 'link a una imagen', 'Libro de montar tubos. ', 6),
(95, '185060', 458, '5.67', 'link a una imagen', 'Interruptor para montar tubos. ', 7),
(96, '730042', 443, '8.11', 'link a una imagen', 'Libro de emparejar. ', 3),
(97, '421081', 959, '7.10', 'link a una imagen', 'Maquina de emparejar. ', 5),
(98, '358077', 389, '6.51', 'link a una imagen', 'Maquina de montar tubos. ', 9),
(99, '938701', 242, '4.55', 'link a una imagen', 'Libro de montar tubos. ', 12),
(100, '129595', 246, '6.83', 'link a una imagen', 'Interruptor para montar tubos. ', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id`, `descripcion`) VALUES
(1, 'Higiene de la empresa. '),
(2, 'Juguetes para centros educativos. '),
(3, 'Juguetes de la empresa. '),
(4, 'Juguetes del hogar. '),
(5, 'Alimentación para centros educativos. '),
(6, 'Alimentación sanitaria. '),
(7, 'Alimentación de la empresa. '),
(8, 'Electronica sanitaria. '),
(9, 'Higiene de la empresa. '),
(10, 'Alimentación del hogar. '),
(11, 'Higiene para centros educativos. '),
(12, 'Electronica del hogar. '),
(13, 'Electronica de la empresa. '),
(14, 'Higiene de la empresa. '),
(15, 'Alimentación sanitaria. '),
(16, 'Juguetes del hogar. '),
(17, 'Alimentación para centros educativos. '),
(18, 'Alimentación sanitaria. '),
(19, 'Juguetes de la empresa. '),
(20, 'Electronica sanitaria. '),
(21, 'Electronica sanitaria. '),
(22, 'Electronica de la empresa. '),
(23, 'Higiene sanitaria. '),
(24, 'Juguetes del hogar. '),
(25, 'Electronica sanitaria. '),
(26, 'Alimentación para centros educativos. '),
(27, 'Juguetes de la empresa. '),
(28, 'Higiene del hogar. '),
(29, 'Juguetes sanitaria. '),
(30, 'Electronica para centros educativos. '),
(31, 'Higiene del hogar. '),
(32, 'Electronica para centros educativos. '),
(33, 'Electronica para centros educativos. '),
(34, 'Alimentación del hogar. '),
(35, 'Electronica de la empresa. '),
(36, 'Higiene sanitaria. '),
(37, 'Electronica de la empresa. '),
(38, 'Alimentación sanitaria. '),
(39, 'Alimentación del hogar. '),
(40, 'Alimentación de la empresa. '),
(41, 'Higiene para centros educativos. '),
(42, 'Electronica para centros educativos. '),
(43, 'Higiene del hogar. '),
(44, 'Electronica del hogar. '),
(45, 'Alimentación del hogar. '),
(46, 'Electronica sanitaria. '),
(47, 'Alimentación para centros educativos. '),
(48, 'Alimentación sanitaria. '),
(49, 'Juguetes del hogar. '),
(50, 'Alimentación para centros educativos. '),
(51, 'Alimentación sanitaria. '),
(52, 'Higiene de la empresa. '),
(53, 'Electronica del hogar. '),
(54, 'Higiene del hogar. '),
(55, 'Electronica de la empresa. '),
(56, 'Juguetes para centros educativos. '),
(57, 'Electronica de la empresa. '),
(58, 'Electronica del hogar. '),
(59, 'Electronica sanitaria. '),
(60, 'Higiene del hogar. '),
(61, 'Higiene sanitaria. '),
(62, 'Juguetes del hogar. '),
(63, 'Electronica de la empresa. '),
(64, 'Juguetes de la empresa. '),
(65, 'Juguetes de la empresa. '),
(66, 'Juguetes para centros educativos. '),
(67, 'Alimentación de la empresa. '),
(68, 'Juguetes sanitaria. '),
(69, 'Higiene sanitaria. '),
(70, 'Juguetes sanitaria. '),
(71, 'Electronica sanitaria. '),
(72, 'Alimentación de la empresa. '),
(73, 'Higiene sanitaria. '),
(74, 'Juguetes para centros educativos. '),
(75, 'Electronica de la empresa. '),
(76, 'Juguetes sanitaria. '),
(77, 'Alimentación sanitaria. '),
(78, 'Juguetes del hogar. '),
(79, 'Juguetes de la empresa. '),
(80, 'Higiene de la empresa. '),
(81, 'Alimentación para centros educativos. '),
(82, 'Electronica para centros educativos. '),
(83, 'Higiene para centros educativos. '),
(84, 'Juguetes del hogar. '),
(85, 'Alimentación de la empresa. '),
(86, 'Juguetes sanitaria. '),
(87, 'Electronica de la empresa. '),
(88, 'Alimentación para centros educativos. '),
(89, 'Electronica sanitaria. '),
(90, 'Electronica sanitaria. '),
(91, 'Juguetes sanitaria. '),
(92, 'Alimentación sanitaria. '),
(93, 'Alimentación para centros educativos. '),
(94, 'Electronica del hogar. '),
(95, 'Electronica del hogar. '),
(96, 'Juguetes para centros educativos. '),
(97, 'Alimentación de la empresa. '),
(98, 'Juguetes sanitaria. '),
(99, 'Higiene de la empresa. '),
(100, 'Electronica para centros educativos. ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `dni`, `nombre`, `apellido1`, `apellido2`, `login`, `password`, `email`, `tipo_usuario_id`) VALUES
(1, '12345678A', 'Troll', 'Eyes', 'Daw', 'trolleyes', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'troll@eyes.com', 1),
(2, '30380657O', 'Marcel·li', 'de les', 'Palla', 'madepa5597', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madepa5597@trolleyes.com', 2),
(3, '74207971O', 'Marcel·li', 'de la', 'Llobarro', 'madell4582', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madell4582@trolleyes.com', 2),
(4, '33315126O', 'Maurici', 'dels', 'Murallot', 'mademu8479', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mademu8479@trolleyes.com', 2),
(5, '42548227O', 'Cirili', 'Ca la', 'Palla', 'cicapa9140', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cicapa9140@trolleyes.com', 2),
(6, '30420869O', 'Pepet', 'dels', 'Clapés', 'pedecl9073', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pedecl9073@trolleyes.com', 2),
(7, '59725402O', 'Josepa', 'de Cal', 'Murallot', 'jodemu6421', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jodemu6421@trolleyes.com', 2),
(8, '76459525O', 'Pepet', 'de la', 'Cigrons', 'pedeci7586', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pedeci7586@trolleyes.com', 2),
(9, '24376494O', 'Pompeu', 'Pacoco', 'Palla', 'popapa5989', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'popapa5989@trolleyes.com', 2),
(10, '34535786O', 'Maurici', 'de les', 'Pacoco', 'madepa2921', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madepa2921@trolleyes.com', 2),
(11, '11176664O', 'Eudald', 'de Cal', 'Cebes', 'eudece5161', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'eudece5161@trolleyes.com', 2),
(12, '71510920O', 'Marcel·li', 'Ca la', 'Palla', 'macapa4348', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'macapa4348@trolleyes.com', 2),
(13, '77369616O', 'Marcel·li', 'de Can', 'Trencapins', 'madetr3520', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madetr3520@trolleyes.com', 2),
(14, '53149178O', 'Vidal', 'de les', 'Cigrons', 'videci7492', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'videci7492@trolleyes.com', 2),
(15, '62531407O', 'Marcel·li', 'de Can', 'Faves', 'madefa4924', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madefa4924@trolleyes.com', 2),
(16, '66385893O', 'Maurici', 'de Can', 'Palla', 'madepa8109', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madepa8109@trolleyes.com', 2),
(17, '93599057O', 'Pompeu', 'de la', 'Trencapins', 'podetr4688', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'podetr4688@trolleyes.com', 2),
(18, '31279111O', 'Miqueleta', 'de Can', 'Murallot', 'midemu9127', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'midemu9127@trolleyes.com', 2),
(19, '52165377O', 'Cirili', 'de les', 'Murallot', 'cidemu7887', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cidemu7887@trolleyes.com', 2),
(20, '35029836O', 'Jaumet', 'dels', 'Murallot', 'jademu4189', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jademu4189@trolleyes.com', 2),
(21, '79660819O', 'Pepet', 'de Can', 'Palla', 'pedepa9099', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pedepa9099@trolleyes.com', 2),
(22, '79294744O', 'Jaumet', 'de la', 'Freda', 'jadefr3182', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadefr3182@trolleyes.com', 2),
(23, '51348820O', 'Domènec', 'dels', 'Trencapins', 'dodetr7706', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodetr7706@trolleyes.com', 2),
(24, '50953490O', 'Jaumet', 'de Cal', 'Metge', 'jademe1777', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jademe1777@trolleyes.com', 2),
(25, '85559217O', 'Vidal', 'de Can', 'Faves', 'videfa6818', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'videfa6818@trolleyes.com', 2),
(26, '50833168O', 'Marcel·li', 'de la', 'Llobarro', 'madell1523', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madell1523@trolleyes.com', 2),
(27, '91749104O', 'Domènec', 'el de', 'Murallot', 'doelmu8256', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'doelmu8256@trolleyes.com', 2),
(28, '41656754O', 'Cirili', 'el de', 'Palla', 'cielpa8060', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cielpa8060@trolleyes.com', 2),
(29, '36755685O', 'Maurici', 'de la', 'Cargols', 'madeca7795', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madeca7795@trolleyes.com', 2),
(30, '71910358O', 'Pepet', 'de Cal', 'Porrons', 'pedepo7314', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pedepo7314@trolleyes.com', 2),
(31, '72903037O', 'Maurici', 'Ca la', 'Cargols', 'macaca6133', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'macaca6133@trolleyes.com', 2),
(32, '29375286O', 'Jaumet', 'de les', 'Llobarro', 'jadell3132', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadell3132@trolleyes.com', 2),
(33, '74825449O', 'Maurici', 'de les', 'Pacoco', 'madepa4315', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madepa4315@trolleyes.com', 2),
(34, '13922528O', 'Miqueleta', 'el de', 'Cargols', 'mielca5676', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mielca5676@trolleyes.com', 2),
(35, '42323360O', 'Cirili', 'dels', 'Murallot', 'cidemu3248', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cidemu3248@trolleyes.com', 2),
(36, '12716205O', 'Eudald', 'de les', 'Cargols', 'eudeca1591', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'eudeca1591@trolleyes.com', 2),
(37, '58092589O', 'Vidal', 'de Cal', 'Metge', 'videme4623', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'videme4623@trolleyes.com', 2),
(38, '40333672O', 'Marcel·li', 'Ca la', 'Pacoco', 'macapa2552', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'macapa2552@trolleyes.com', 2),
(39, '58550440O', 'Bernat', 'el de', 'Murallot', 'beelmu8331', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'beelmu8331@trolleyes.com', 2),
(40, '96317634O', 'Cirili', 'de Cal', 'Faves', 'cidefa6483', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cidefa6483@trolleyes.com', 2),
(41, '80479290O', 'Marcel·li', 'dels', 'Metge', 'mademe6846', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mademe6846@trolleyes.com', 2),
(42, '42382270O', 'Bernat', 'de Cal', 'Cigrons', 'bedeci2595', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'bedeci2595@trolleyes.com', 2),
(43, '11044053O', 'Pompeu', 'de Cal', 'Cebes', 'podece3240', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'podece3240@trolleyes.com', 2),
(44, '11672627O', 'Pompeu', 'de la', 'Porrons', 'podepo7311', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'podepo7311@trolleyes.com', 2),
(45, '84607772O', 'Eudald', 'dels', 'Cigrons', 'eudeci2285', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'eudeci2285@trolleyes.com', 2),
(46, '23114704O', 'Cirili', 'Pacoco', 'Pacoco', 'cipapa9259', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cipapa9259@trolleyes.com', 2),
(47, '20331748O', 'Jaumet', 'el de', 'Palla', 'jaelpa9623', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jaelpa9623@trolleyes.com', 2),
(48, '81701399O', 'Jaumet', 'el de', 'Murallot', 'jaelmu3209', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jaelmu3209@trolleyes.com', 2),
(49, '93933671O', 'Paco', 'dels', 'Cigrons', 'padeci5265', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'padeci5265@trolleyes.com', 2),
(50, '91465056O', 'Cirili', 'Ca la', 'Metge', 'cicame8520', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cicame8520@trolleyes.com', 2),
(51, '27289219O', 'Vidal', 'de les', 'Trencapins', 'videtr9792', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'videtr9792@trolleyes.com', 2),
(52, '94536665O', 'Paco', 'dels', 'Clapés', 'padecl2213', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'padecl2213@trolleyes.com', 2),
(53, '38367331O', 'Jaumet', 'de Cal', 'Llobarro', 'jadell8926', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadell8926@trolleyes.com', 2),
(54, '18950548O', 'Pompeu', 'de les', 'Faves', 'podefa1648', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'podefa1648@trolleyes.com', 2),
(55, '11824549O', 'Marcel·li', 'de Cal', 'Faves', 'madefa1452', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madefa1452@trolleyes.com', 2),
(56, '68305208O', 'Jaumet', 'el de', 'Palla', 'jaelpa3569', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jaelpa3569@trolleyes.com', 2),
(57, '38454736O', 'Maurici', 'Ca la', 'Trencapins', 'macatr4580', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'macatr4580@trolleyes.com', 2),
(58, '60839022O', 'Miqueleta', 'de Can', 'Faves', 'midefa5415', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'midefa5415@trolleyes.com', 2),
(59, '58572293O', 'Eudald', 'dels', 'Clapés', 'eudecl9464', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'eudecl9464@trolleyes.com', 2),
(60, '58444683O', 'Josepa', 'de Can', 'Cigrons', 'jodeci4540', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jodeci4540@trolleyes.com', 2),
(61, '64742535O', 'Cirili', 'dels', 'Murallot', 'cidemu2684', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cidemu2684@trolleyes.com', 2),
(62, '21369463O', 'Cirili', 'dels', 'Palla', 'cidepa7815', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cidepa7815@trolleyes.com', 2),
(63, '40474717O', 'Maurici', 'dels', 'Porrons', 'madepo4810', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madepo4810@trolleyes.com', 2),
(64, '92288022O', 'Domènec', 'de les', 'Cargols', 'dodeca4918', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodeca4918@trolleyes.com', 2),
(65, '21441833O', 'Miqueleta', 'de la', 'Cigrons', 'mideci3911', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mideci3911@trolleyes.com', 2),
(66, '78768627O', 'Domènec', 'de Can', 'Pacoco', 'dodepa9973', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodepa9973@trolleyes.com', 2),
(67, '40336597O', 'Paco', 'el de', 'Trencapins', 'paeltr4573', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'paeltr4573@trolleyes.com', 2),
(68, '82278669O', 'Jaumet', 'de la', 'Porrons', 'jadepo9583', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadepo9583@trolleyes.com', 2),
(69, '46933174O', 'Pepet', 'de Can', 'Palla', 'pedepa8368', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pedepa8368@trolleyes.com', 2),
(70, '20406548O', 'Pepet', 'de la', 'Cebes', 'pedece5368', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pedece5368@trolleyes.com', 2),
(71, '95586406O', 'Domènec', 'Ca la', 'Cigrons', 'docaci4006', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'docaci4006@trolleyes.com', 2),
(72, '99248194O', 'Jaumet', 'Pacoco', 'Murallot', 'japamu7959', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'japamu7959@trolleyes.com', 2),
(73, '48020380O', 'Miqueleta', 'de Cal', 'Llobarro', 'midell5681', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'midell5681@trolleyes.com', 2),
(74, '91470682O', 'Pompeu', 'de Can', 'Cebes', 'podece8722', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'podece8722@trolleyes.com', 2),
(75, '72560744O', 'Jaumet', 'dels', 'Cigrons', 'jadeci9575', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadeci9575@trolleyes.com', 2),
(76, '80693759O', 'Domènec', 'de les', 'Pacoco', 'dodepa9982', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodepa9982@trolleyes.com', 2),
(77, '70143611O', 'Maurici', 'Pacoco', 'Metge', 'mapame7394', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mapame7394@trolleyes.com', 2),
(78, '82013176O', 'Paco', 'de Cal', 'Trencapins', 'padetr5086', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'padetr5086@trolleyes.com', 2),
(79, '73650292O', 'Maurici', 'de Can', 'Cargols', 'madeca5263', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madeca5263@trolleyes.com', 2),
(80, '35936223O', 'Pepet', 'de Cal', 'Murallot', 'pedemu9415', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pedemu9415@trolleyes.com', 2),
(81, '52002288O', 'Cirili', 'de la', 'Porrons', 'cidepo7996', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cidepo7996@trolleyes.com', 2),
(82, '27137752O', 'Paco', 'Ca la', 'Cigrons', 'pacaci6543', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pacaci6543@trolleyes.com', 2),
(83, '13604647O', 'Josepa', 'dels', 'Clapés', 'jodecl2480', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jodecl2480@trolleyes.com', 2),
(84, '70420524O', 'Vidal', 'dels', 'Pacoco', 'videpa9804', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'videpa9804@trolleyes.com', 2),
(85, '70216233O', 'Pompeu', 'el de', 'Murallot', 'poelmu2806', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'poelmu2806@trolleyes.com', 2),
(86, '53442394O', 'Jaumet', 'Ca la', 'Metge', 'jacame1819', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jacame1819@trolleyes.com', 2),
(87, '80189763O', 'Pepet', 'el de', 'Cebes', 'peelce1484', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'peelce1484@trolleyes.com', 2),
(88, '25238387O', 'Vidal', 'Pacoco', 'Palla', 'vipapa5260', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'vipapa5260@trolleyes.com', 2),
(89, '87768609O', 'Cirili', 'de les', 'Faves', 'cidefa3974', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cidefa3974@trolleyes.com', 2),
(90, '71621081O', 'Bernat', 'dels', 'Faves', 'bedefa1686', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'bedefa1686@trolleyes.com', 2),
(91, '19225818O', 'Cirili', 'de la', 'Trencapins', 'cidetr7465', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cidetr7465@trolleyes.com', 2),
(92, '45209218O', 'Paco', 'de Cal', 'Porrons', 'padepo2404', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'padepo2404@trolleyes.com', 2),
(93, '29026990O', 'Vidal', 'Pacoco', 'Porrons', 'vipapo1016', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'vipapo1016@trolleyes.com', 2),
(94, '40352436O', 'Marcel·li', 'de Cal', 'Murallot', 'mademu9569', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mademu9569@trolleyes.com', 2),
(95, '34804738O', 'Bernat', 'de Can', 'Freda', 'bedefr9201', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'bedefr9201@trolleyes.com', 2),
(96, '99548414O', 'Domènec', 'dels', 'Cargols', 'dodeca9397', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodeca9397@trolleyes.com', 2),
(97, '54129128O', 'Domènec', 'dels', 'Faves', 'dodefa9469', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodefa9469@trolleyes.com', 2),
(98, '30265267O', 'Paco', 'dels', 'Pacoco', 'padepa4093', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'padepa4093@trolleyes.com', 2),
(99, '42195625O', 'Paco', 'dels', 'Porrons', 'padepo5614', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'padepo5614@trolleyes.com', 2),
(100, '83283202O', 'Maurici', 'de la', 'Metge', 'mademe5824', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mademe5824@trolleyes.com', 2),
(101, '76447700O', 'Bernat', 'el de', 'Murallot', 'beelmu2597', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'beelmu2597@trolleyes.com', 2),
(102, '78870592O', 'Jaumet', 'dels', 'Cebes', 'jadece8460', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadece8460@trolleyes.com', 2),
(103, '93592810O', 'Domènec', 'Pacoco', 'Murallot', 'dopamu8517', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dopamu8517@trolleyes.com', 2),
(104, '25144437O', 'Vidal', 'el de', 'Cebes', 'vielce9424', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'vielce9424@trolleyes.com', 2),
(105, '98713566O', 'Jaumet', 'de les', 'Cargols', 'jadeca3469', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadeca3469@trolleyes.com', 2),
(106, '57886850O', 'Bernat', 'de Cal', 'Cigrons', 'bedeci4627', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'bedeci4627@trolleyes.com', 2),
(107, '65445241O', 'Domènec', 'de les', 'Cigrons', 'dodeci7441', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodeci7441@trolleyes.com', 2),
(108, '38668700O', 'Eudald', 'de la', 'Murallot', 'eudemu4269', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'eudemu4269@trolleyes.com', 2),
(109, '16179820O', 'Jaumet', 'de Cal', 'Pacoco', 'jadepa2245', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadepa2245@trolleyes.com', 2),
(110, '13359575O', 'Pompeu', 'dels', 'Metge', 'podeme7042', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'podeme7042@trolleyes.com', 2),
(111, '50627400O', 'Miqueleta', 'de les', 'Murallot', 'midemu1571', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'midemu1571@trolleyes.com', 2),
(112, '87688349O', 'Pompeu', 'de Cal', 'Pacoco', 'podepa3859', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'podepa3859@trolleyes.com', 2),
(113, '38949087O', 'Josepa', 'de les', 'Pacoco', 'jodepa5083', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jodepa5083@trolleyes.com', 2),
(114, '66389007O', 'Bernat', 'el de', 'Pacoco', 'beelpa7497', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'beelpa7497@trolleyes.com', 2),
(115, '29170918O', 'Miqueleta', 'Pacoco', 'Trencapins', 'mipatr6623', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mipatr6623@trolleyes.com', 2),
(116, '35268072O', 'Domènec', 'el de', 'Trencapins', 'doeltr1880', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'doeltr1880@trolleyes.com', 2),
(117, '20264362O', 'Jaumet', 'de Can', 'Llobarro', 'jadell4762', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadell4762@trolleyes.com', 2),
(118, '28128589O', 'Paco', 'de Can', 'Faves', 'padefa7119', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'padefa7119@trolleyes.com', 2),
(119, '87672580O', 'Maurici', 'dels', 'Cigrons', 'madeci6823', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madeci6823@trolleyes.com', 2),
(120, '86464809O', 'Miqueleta', 'de les', 'Freda', 'midefr1981', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'midefr1981@trolleyes.com', 2),
(121, '73178790O', 'Bernat', 'de les', 'Cebes', 'bedece4921', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'bedece4921@trolleyes.com', 2),
(122, '47004553O', 'Josepa', 'de Can', 'Cebes', 'jodece1989', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jodece1989@trolleyes.com', 2),
(123, '99828309O', 'Paco', 'Pacoco', 'Metge', 'papame9107', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'papame9107@trolleyes.com', 2),
(124, '80043833O', 'Pepet', 'de la', 'Murallot', 'pedemu5848', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pedemu5848@trolleyes.com', 2),
(125, '74572646O', 'Miqueleta', 'Pacoco', 'Freda', 'mipafr7667', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mipafr7667@trolleyes.com', 2),
(126, '98831298O', 'Maurici', 'de Can', 'Cigrons', 'madeci7076', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madeci7076@trolleyes.com', 2),
(127, '88814320O', 'Cirili', 'el de', 'Trencapins', 'cieltr2218', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cieltr2218@trolleyes.com', 2),
(128, '62477052O', 'Pepet', 'de les', 'Cargols', 'pedeca9160', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pedeca9160@trolleyes.com', 2),
(129, '82975897O', 'Maurici', 'de Can', 'Cargols', 'madeca6280', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'madeca6280@trolleyes.com', 2),
(130, '11659420O', 'Paco', 'Ca la', 'Metge', 'pacame8295', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pacame8295@trolleyes.com', 2),
(131, '16445521O', 'Josepa', 'Ca la', 'Freda', 'jocafr5508', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jocafr5508@trolleyes.com', 2),
(132, '59180556O', 'Domènec', 'de Can', 'Cebes', 'dodece5630', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodece5630@trolleyes.com', 2),
(133, '55082570O', 'Paco', 'Ca la', 'Murallot', 'pacamu6792', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'pacamu6792@trolleyes.com', 2),
(134, '26792866O', 'Paco', 'de les', 'Freda', 'padefr6372', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'padefr6372@trolleyes.com', 2),
(135, '24187765O', 'Bernat', 'Ca la', 'Porrons', 'becapo7983', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'becapo7983@trolleyes.com', 2),
(136, '53016688O', 'Domènec', 'el de', 'Faves', 'doelfa9322', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'doelfa9322@trolleyes.com', 2),
(137, '25208282O', 'Vidal', 'de Cal', 'Clapés', 'videcl6414', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'videcl6414@trolleyes.com', 2),
(138, '35448788O', 'Miqueleta', 'de Cal', 'Pacoco', 'midepa6045', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'midepa6045@trolleyes.com', 2),
(139, '97184566O', 'Jaumet', 'de les', 'Cargols', 'jadeca4466', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadeca4466@trolleyes.com', 2),
(140, '98591870O', 'Jaumet', 'dels', 'Trencapins', 'jadetr3750', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'jadetr3750@trolleyes.com', 2),
(141, '42245098O', 'Domènec', 'dels', 'Trencapins', 'dodetr6960', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodetr6960@trolleyes.com', 2),
(142, '77008254O', 'Pompeu', 'Pacoco', 'Cebes', 'popace7672', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'popace7672@trolleyes.com', 2),
(143, '14480292O', 'Cirili', 'Ca la', 'Murallot', 'cicamu2652', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'cicamu2652@trolleyes.com', 2),
(144, '12824702O', 'Domènec', 'Ca la', 'Clapés', 'docacl7916', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'docacl7916@trolleyes.com', 2),
(145, '19908080O', 'Domènec', 'de la', 'Pacoco', 'dodepa6847', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dodepa6847@trolleyes.com', 2),
(146, '49718119O', 'Miqueleta', 'de Cal', 'Clapés', 'midecl1838', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'midecl1838@trolleyes.com', 2),
(147, '76580937O', 'Miqueleta', 'de les', 'Cargols', 'mideca8388', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mideca8388@trolleyes.com', 2),
(148, '77639751O', 'Domènec', 'Pacoco', 'Faves', 'dopafa7478', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'dopafa7478@trolleyes.com', 2),
(149, '98245637O', 'Marcel·li', 'Pacoco', 'Palla', 'mapapa8613', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'mapapa8613@trolleyes.com', 2),
(150, '58053984O', 'Eudald', 'de les', 'Faves', 'eudefa1808', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'eudefa1808@trolleyes.com', 2),
(151, '15389997O', 'Bernat', 'de les', 'Metge', 'bedeme2561', 'da8ab09ab4889c6208116a675cad0b13e335943bd7fc418782d054b32fdfba04', 'bedeme2561@trolleyes.com', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`,`factura_id`,`producto_id`),
  ADD KEY `fk_compra_factura_idx` (`factura_id`),
  ADD KEY `fk_compra_producto_idx` (`producto_id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`,`usuario_id`),
  ADD KEY `fk_factura_usuario_idx` (`usuario_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`,`tipo_producto_id`),
  ADD KEY `fk_producto_tipo_producto_idx` (`tipo_producto_id`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`,`tipo_usuario_id`),
  ADD KEY `fk_usuario_tipo_usuario_idx` (`tipo_usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_factura` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_compra_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_tipo_producto` FOREIGN KEY (`tipo_producto_id`) REFERENCES `tipo_producto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tipo_usuario` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

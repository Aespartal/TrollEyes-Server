-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2019 a las 23:34:01
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

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
  `cantidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `iva` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `existencias` int(10) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FK_tipo_producto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `existencias`, `precio`, `imagen`, `descripcion`, `FK_tipo_producto`) VALUES
(1, '0D48KN8IV4', 490, '826.46', 'imagenrandom', 'Panatalon decoches electricos', 4),
(2, 'UKHSVBJ739', 406, '2758.71', 'imagenrandom', 'Vaso depapel higienico', 9),
(3, '8BH7F6W4PK', 929, '716.42', 'imagenrandom', 'Ordenador de tubos de escape', 4),
(4, 'OL4W46PSG8', 423, '2306.24', 'imagenrandom', 'Ordenador de fuertaco', 3),
(5, '0OZZA9HA1N', 397, '2114.81', 'imagenrandom', 'Procesdor de hacer velas', 5),
(6, '1P92MTXNJC', 502, '1599.55', 'imagenrandom', 'Ordenador de plastico', 10),
(7, 'GPYHJ52VVH', 910, '1430.99', 'imagenrandom', 'Panatalon deplastico', 11),
(8, '4LQV88JN7L', 110, '1069.36', 'imagenrandom', 'Ordenador de tubos de escape', 6),
(9, 'TT2C1AGICJ', 244, '1985.93', 'imagenrandom', 'Pendrive defuertaco', 7),
(10, '337X4TJ5I3', 152, '339.87', 'imagenrandom', 'Procesdor de  oro', 9),
(11, 'XM02GBOVOO', 132, '464.38', 'imagenrandom', 'Piscina dehacer velas', 5),
(12, 'MMTXMDVQ6W', 295, '579.14', 'imagenrandom', 'Botella decoches electricos', 3),
(13, '77QF4G8F8I', 93, '964.22', 'imagenrandom', 'Piscina detubos de escape', 6),
(14, 'CZO7PG9DLL', 450, '242.17', 'imagenrandom', 'Panatalon deplastico', 4),
(15, '1RTLPJLB4Q', 191, '781.72', 'imagenrandom', 'Pendrive depapel higienico', 6),
(16, '2AX1LSKO89', 56, '2381.28', 'imagenrandom', 'Pendrive decoches electricos', 4),
(17, 'HG0DG9JJZY', 72, '1755.33', 'imagenrandom', 'Botella detubos de escape', 6),
(18, 'HTXFLA68W1', 477, '2375.20', 'imagenrandom', 'Nevera de pisapapel', 9),
(19, '24ZNZK4QLI', 502, '1865.25', 'imagenrandom', 'Nevera demortadelos', 3),
(20, 'GE8QDMEX7U', 749, '380.34', 'imagenrandom', 'Pendrive detubos de escape', 4),
(21, '3Q5GBUMZU8', 34, '1492.76', 'imagenrandom', 'Ordenador de papel higienico', 6),
(22, 'A7YL3JSM7G', 591, '188.99', 'imagenrandom', 'Piscina de pisapapel', 5),
(23, 'BFSA95PBXD', 117, '1048.45', 'imagenrandom', 'Maquina de tubos de escape', 6),
(24, 'SB7M157IE1', 837, '1469.73', 'imagenrandom', 'Puerta dehacer velas', 6),
(25, 'XUMAPTQ6TE', 122, '1307.86', 'imagenrandom', 'Zapatilla decoches electricos', 4),
(26, '6N3VZPJUIS', 41, '2959.72', 'imagenrandom', 'Panatalon de oro', 8),
(27, '7RLHLNTXVU', 275, '1985.39', 'imagenrandom', 'Puerta depapel higienico', 11),
(28, '5Q19DLZ32J', 479, '936.71', 'imagenrandom', 'Maquina de  pisapapel', 7),
(29, 'OXSN4NFX9F', 198, '2642.56', 'imagenrandom', 'Pendrive defuertaco', 11),
(30, 'OIPW50MFTX', 584, '805.48', 'imagenrandom', 'Ordenador de coches electricos', 3),
(31, '5IF1R1JSZ5', 521, '1699.93', 'imagenrandom', 'Puerta depepinos', 4),
(32, 'PJ6JIG7801', 974, '2579.29', 'imagenrandom', 'Zapatilla decoches electricos', 9),
(33, 'KH56CFZ0M5', 362, '957.58', 'imagenrandom', 'Procesdor de pepinos', 3),
(34, '08ZTYOC8FF', 730, '1249.25', 'imagenrandom', 'Procesdor de papel higienico', 7),
(35, 'WHK0TCQO55', 367, '897.63', 'imagenrandom', 'Procesdor de papel higienico', 7),
(36, 'ITJBL9W47Z', 276, '18.42', 'imagenrandom', 'Procesdor de hacer velas', 9),
(37, 'CBHTBAV29C', 422, '2012.35', 'imagenrandom', 'Pendrive deplastico', 5),
(38, '6URFF4PB5Q', 296, '274.72', 'imagenrandom', 'Nevera deplastico', 10),
(39, 'UXPOCENJWU', 331, '1294.27', 'imagenrandom', 'Nevera dehacer velas', 9),
(40, 'KH3F81R5U5', 504, '2154.49', 'imagenrandom', 'Vaso dehacer velas', 10),
(41, 'W4MDHJXR66', 170, '1730.43', 'imagenrandom', 'Maquina de papel higienico', 6),
(42, '9M5F7I6TVG', 154, '2147.35', 'imagenrandom', 'Puerta dehacer deporte', 6),
(43, '8PFLSA6FN5', 39, '524.17', 'imagenrandom', 'Vaso detubos de escape', 11),
(44, '3QSYBAPCR5', 756, '2329.41', 'imagenrandom', 'Nevera de pisapapel', 8),
(45, 'FZQY7HFT32', 611, '2711.07', 'imagenrandom', 'Panatalon defuertaco', 9),
(46, 'GN3IASZVUR', 232, '283.43', 'imagenrandom', 'Puerta decoches electricos', 7),
(47, 'LAKV7H27NS', 618, '1796.26', 'imagenrandom', 'Pendrive detubos de escape', 2),
(48, 'RAUUUVT7PT', 394, '1268.92', 'imagenrandom', 'Zapatilla deplastico', 3),
(49, '59FCUJS773', 983, '2865.56', 'imagenrandom', 'Botella decoches electricos', 10),
(50, '31SR1JHDNH', 240, '866.57', 'imagenrandom', 'Vaso detubos de escape', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id`, `descripcion`) VALUES
(1, 'Ropa'),
(2, 'Belleza'),
(3, 'Banca'),
(4, 'Electrodomestico'),
(5, 'Decoracion'),
(6, 'Software'),
(7, 'Turismo y Ocio'),
(8, 'Material deportivo'),
(9, 'Servicios'),
(10, 'Automocion'),
(11, 'Libros'),
(12, 'Restauracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `descripcion`) VALUES
(1, 'Admin'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `FK_tipo_usuario` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `dni`, `email`, `nombre`, `apellido1`, `apellido2`, `login`, `password`, `FK_tipo_usuario`) VALUES
(1, '31655585F', '0QHIEI0GHX@gmail.com', 'Nacho', 'Castorena', 'Broncano', 'NCB20', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(2, '18432259V', 'VTG29VK1OH@gmail.com', 'Vicente', 'Broncano', 'Fiera', 'VBF50', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(3, '81052602W', 'MN0623TP53@gmail.com', 'Vicente', 'Grande', 'Dominguez ', 'VGD19', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(4, '64469194E', 'NB65NAZ3AO@gmail.com', 'Carlos', 'Grande', 'Castorena', 'CGC63', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(5, '29755909M', 'PGRSD6FMY9@gmail.com', 'David', 'Castiyo', 'Castro', 'DCC31', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(6, '45812460J', '3NFHB7OZ26@gmail.com', 'Pancracio', 'Castiyo', 'Dominguez ', 'PCD85', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(7, '34040054G', '0HMZ8GGWVD@gmail.com', 'David', 'Castiyo', 'Fiera', 'DCF87', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(8, '88476077E', 'T5913RSM57@gmail.com', 'David', 'La Piedra', 'Castiyo', 'DLC79', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(9, '14790964D', 'JH8RO85XQ5@gmail.com', 'Ivan', 'Castorena', 'Dominguez ', 'ICD35', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(10, '38113102K', '18MD8YWVJU@gmail.com', 'Alejandro', 'Castiyo', 'Fiera', 'ACF67', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(11, '25442039S', 'EBIDE353QU@gmail.com', 'Vicente', 'La Piedra', 'La Piedra', 'VLL41', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(12, '19051301W', '1YRCBXPCDJ@gmail.com', 'Carlos', 'Castorena', 'Castro', 'CCC75', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(13, '27916664R', 'JXV942FP9O@gmail.com', 'Carlos', 'Dominguez ', 'Dominguez ', 'CDD62', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(14, '47011055B', '7938QHT06M@gmail.com', 'Alejandro', 'Grande', 'Dominguez ', 'AGD20', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(15, '85992760J', 'KO9CEGUVMC@gmail.com', 'Sonia', 'Castorena', 'Castorena', 'SCC74', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(16, '18119353J', 'LRERBRQ7U5@gmail.com', 'Raul', 'Castiyo', 'Dominguez ', 'RCD50', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(17, '95417022Q', 'UVNPYBPU4P@gmail.com', 'Pancracio', 'Fiera', 'Castiyo', 'PFC42', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(18, '42527040D', '601GZ6NX61@gmail.com', 'Vicente', 'Dominguez ', 'Grande', 'VDG70', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(19, '29071213H', '3OMKLF84WD@gmail.com', 'David', 'Castro', 'Grande', 'DCG57', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(20, '20692369J', 'JCCG1XKU7C@gmail.com', 'David', 'La Piedra', 'La Piedra', 'DLL23', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(21, '83529862W', '9B1SJ095NQ@gmail.com', 'Sonia', 'Castiyo', 'Fiera', 'SCF76', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(22, '84212288L', 'L696834ZSQ@gmail.com', 'Lucia', 'Castro', 'La Piedra', 'LCL42', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(23, '20448462S', '4SBU8YPPLS@gmail.com', 'Mastodonte', 'Fiera', 'La Piedra', 'MFL45', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(24, '50963703M', 'M5NH1PYNK7@gmail.com', 'Raul', 'Grande', 'Castiyo', 'RGC49', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(25, '22383242C', 'LNCVNXMG8W@gmail.com', 'David', 'Castro', 'Fiera', 'DCF30', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(26, '56260357W', 'JHTLJP10KT@gmail.com', 'Pancracio', 'La Piedra', 'La Piedra', 'PLL27', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(27, '97868303C', 'CSFYTR2N7P@gmail.com', 'Nacho', 'Grande', 'Castorena', 'NGC56', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(28, '87736821E', 'ZZRPZXF9AI@gmail.com', 'Nacho', 'La Piedra', 'La Piedra', 'NLL95', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(29, '14862938D', '8CE93AIGMD@gmail.com', 'Alejandro', 'Grande', 'Castorena', 'AGC82', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(30, '11739423T', '5GJ8SF77IT@gmail.com', 'Pancracio', 'La Piedra', 'Fiera', 'PLF64', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(31, '85031620C', 'C4OMVNVC83@gmail.com', 'Raul', 'Castorena', 'La Piedra', 'RCL71', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(32, '63134834J', '1VDNGBHMHP@gmail.com', 'Vicente', 'Grande', 'La Piedra', 'VGL66', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(33, '83731234S', 'A478KZYS57@gmail.com', 'Vicente', 'Broncano', 'Castro', 'VBC29', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(34, '78640382S', 'Q0JFP54JP0@gmail.com', 'Raul', 'Castiyo', 'Dominguez ', 'RCD52', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(35, '62054714G', 'DALHM37B6R@gmail.com', 'Mastodonte', 'Grande', 'Castiyo', 'MGC60', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(36, '16035995A', 'UTCQVFR0O9@gmail.com', 'Carlos', 'Grande', 'Grande', 'CGG60', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(37, '17817396Z', 'NQ8WMBMKF8@gmail.com', 'Pancracio', 'Castiyo', 'Grande', 'PCG24', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(38, '27936071F', '60TO9CVGPA@gmail.com', 'Carlos', 'Castiyo', 'Fiera', 'CCF66', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(39, '91971972X', 'MGRN74481D@gmail.com', 'Pancracio', 'Fiera', 'Castro', 'PFC29', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(40, '39180437X', 'DG3YQISLV3@gmail.com', 'Pancracio', 'La Piedra', 'Castiyo', 'PLC93', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(41, '65600089B', 'HIK5KEIJN4@gmail.com', 'Raul', 'Castorena', 'La Piedra', 'RCL9', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(42, '21346868M', 'W3HY93126B@gmail.com', 'Mastodonte', 'Castro', 'Castro', 'MCC45', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(43, '40353147F', 'KTEQ8NLD4Y@gmail.com', 'Vicente', 'Dominguez ', 'La Piedra', 'VDL60', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(44, '86393522Z', 'BTOLU5RPEK@gmail.com', 'Alejandro', 'Fiera', 'Dominguez ', 'AFD35', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(45, '62002103A', '2W189B75PG@gmail.com', 'Pancracio', 'Castorena', 'Castro', 'PCC68', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(46, '74008074E', '2RLJO0DHIF@gmail.com', 'Pancracio', 'Castiyo', 'Broncano', 'PCB91', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(47, '32605567L', '5S4MPQRUYN@gmail.com', 'Mastodonte', 'Broncano', 'La Piedra', 'MBL87', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(48, '43871042K', 'NHTFGMXLWM@gmail.com', 'Raul', 'Castiyo', 'Grande', 'RCG22', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(49, '41717645F', 'GUP29CO7YM@gmail.com', 'Mastodonte', 'Dominguez ', 'Fiera', 'MDF5', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(50, '64734314W', 'JU2Y0ULGMR@gmail.com', 'Carlos', 'Castorena', 'Broncano', 'CCB77', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(51, '59892545Y', 'BJQ4KEJ3FI@gmail.com', 'Mastodonte', 'Grande', 'Castro', 'MGC17', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(52, '34076296Y', '7ED79UVY9Y@gmail.com', 'Pancracio', 'Broncano', 'Castiyo', 'PBC67', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(53, '81211731C', 'RCO6FKJ4KO@gmail.com', 'Mastodonte', 'Castorena', 'Castro', 'MCC54', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(54, '61461786N', 'EBUHGQS4RA@gmail.com', 'Carlos', 'Fiera', 'La Piedra', 'CFL9', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(55, '68477694F', '7WYBBKAEXT@gmail.com', 'Pancracio', 'Castiyo', 'Dominguez ', 'PCD35', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(56, '37865246Q', 'X1QZEJG7X3@gmail.com', 'Nacho', 'Broncano', 'Castorena', 'NBC86', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(57, '84783362P', 'RRSNG4EMLV@gmail.com', 'Nacho', 'Grande', 'Fiera', 'NGF40', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(58, '25658464N', 'BCSI0ZSHQT@gmail.com', 'Raul', 'Fiera', 'Castorena', 'RFC74', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(59, '44075986J', 'JYQIPVO2TB@gmail.com', 'Pancracio', 'Castro', 'Fiera', 'PCF52', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(60, '61440340N', 'FL1RQ49MLN@gmail.com', 'Carlos', 'Castiyo', 'La Piedra', 'CCL5', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(61, '33185997P', 'ITRTMJHHHA@gmail.com', 'Carlos', 'Broncano', 'Fiera', 'CBF99', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(62, '17415144C', 'TJJDHLWH3Q@gmail.com', 'Raul', 'Grande', 'Fiera', 'RGF52', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(63, '90603130H', 'VCBZGYIBZ9@gmail.com', 'Alejandro', 'Fiera', 'La Piedra', 'AFL33', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(64, '27254404K', '12OVC1TNBX@gmail.com', 'Ivan', 'Castorena', 'Castorena', 'ICC15', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(65, '24442786Q', 'JV6P5XUZF9@gmail.com', 'Vicente', 'Castorena', 'Castro', 'VCC50', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(66, '57396105V', '3P3F2BSVFD@gmail.com', 'Carlos', 'Fiera', 'Castorena', 'CFC50', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(67, '37582598S', '8ROI5B0K64@gmail.com', 'Sonia', 'Castorena', 'Castiyo', 'SCC7', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(68, '86053239M', 'B7VEP786T3@gmail.com', 'Raul', 'Castorena', 'Fiera', 'RCF18', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(69, '22548935M', 'J7SGRY703H@gmail.com', 'Ivan', 'Castro', 'Castiyo', 'ICC41', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2),
(70, '27584567D', 'LDAUDSQWVO@gmail.com', 'Ivan', 'Castro', 'Grande', 'ICG33', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

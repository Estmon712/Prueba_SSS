-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2023 a las 03:59:43
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chatapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `mensajes` (
  `msg_id` int(11) NOT NULL,
  `id_msg_in` int(255) NOT NULL,
  `id_msg_out` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `mensajes` (`msg_id`, `id_msg_in`, `id_msg_out`, `msg`) VALUES
(1, 463831092, 576390103, 'Hola Felipe, ¿como vas?'),
(2, 576390103, 463831092, 'Hola Andrea, ¿muy bien y tú?'),
(3, 463831092, 576390103, 'Muy bien, te quería hacer una pregunta'),
(4, 1237880058, 463831092, 'Oe parce que más, si te llegó la transferencia?'),
(5, 1237880058, 576390103, 'Juan hola, ¿Me puedes hacer el favor que te comenté ayer?'),
(6, 1237880058, 576390103, 'Que pena contigo estar de cansona pero de verdad lo necesito');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `usuarios` (
  `user_id` int(11) NOT NULL,
  `unique_id` int(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `usuarios` (`user_id`, `unique_id`, `nombre`, `apellidos`, `mail`, `pass`, `img`, `status`) VALUES
(1, 576390103, 'Andrea', 'Ramirez', 'andremi@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Andrea.jpg', 'Offline'),
(2, 463831092, 'Felipe', 'Perez', 'fep@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Felipe.jpg', 'Offline'),
(3, 1237880058, 'Juan', 'Acevedo', 'juanac@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Juan.jpg', 'Offline');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `messages`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `mensajes`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `usuarios`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

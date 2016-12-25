-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 25 2016 г., 23:21
-- Версия сервера: 10.1.9-MariaDB
-- Версия PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `src`
--

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `phone` varchar(20) CHARACTER SET latin1 NOT NULL,
  `address` text NOT NULL,
  `comment` text CHARACTER SET latin1 NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `address`, `comment`, `time`) VALUES
(1, 'Антон', '1232', '123', '321', '2016-12-23 00:00:00'),
(2, 'Антон', '1232', '123', '321', '2015-12-23 00:00:00'),
(3, 'Антон', '1232', '123', '321', '2013-12-23 00:00:00'),
(4, 'Антон', '1232', '123', '321', '2014-12-23 00:00:00'),
(5, 'Антон', '1232', '123', '321', '2012-12-23 00:00:00'),
(6, 'Антон', '1232', '123', '321', '2016-12-23 00:00:00'),
(7, 'Антон', '1232', '123', '321', '2015-12-23 00:00:00'),
(8, 'Антон', '1232', '123', '321', '2015-12-23 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_products`
--

CREATE TABLE `orders_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` double(7,2) NOT NULL,
  `quant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `price`, `quant`) VALUES
(1, 1, 2, 5555.00, 4),
(2, 2, 2, 5555.00, 4),
(3, 3, 2, 5555.00, 4),
(4, 4, 2, 5555.00, 4),
(5, 5, 2, 5555.00, 4),
(6, 6, 2, 5555.00, 4),
(7, 7, 2, 5555.00, 4),
(8, 8, 2, 5555.00, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `tiresinfo`
--

CREATE TABLE `tiresinfo` (
  `id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `w_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  `index_m` int(11) NOT NULL,
  `index_v` varchar(10) NOT NULL,
  `season` enum('зима','лето','всесезонная','') CHARACTER SET utf8 NOT NULL,
  `ship` int(11) NOT NULL,
  `quant` int(11) NOT NULL,
  `price` double(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tiresinfo`
--

INSERT INTO `tiresinfo` (`id`, `model_id`, `w_id`, `h_id`, `r_id`, `index_m`, `index_v`, `season`, `ship`, `quant`, `price`) VALUES
(1, 1, 1, 1, 1, 100, 'T', 'зима', 1, 40, 3976.00),
(2, 1, 2, 2, 1, 50, 'V', 'лето', 0, 37, 5967.00),
(3, 2, 2, 1, 2, 70, 'N', 'лето', 0, 43, 2968.00);

-- --------------------------------------------------------

--
-- Структура таблицы `tiresmarks`
--

CREATE TABLE `tiresmarks` (
  `id` int(11) NOT NULL,
  `name` varchar(512) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tiresmarks`
--

INSERT INTO `tiresmarks` (`id`, `name`) VALUES
(1, 'Кама'),
(2, 'Continental');

-- --------------------------------------------------------

--
-- Структура таблицы `tiresmodels`
--

CREATE TABLE `tiresmodels` (
  `id` int(11) NOT NULL,
  `mark_id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tiresmodels`
--

INSERT INTO `tiresmodels` (`id`, `mark_id`, `name`) VALUES
(1, 2, 'ContiViking Contact 6'),
(2, 2, 'ContiViking Contact 8'),
(3, 1, '204'),
(4, 1, '205');

-- --------------------------------------------------------

--
-- Структура таблицы `tires_h`
--

CREATE TABLE `tires_h` (
  `id` int(11) NOT NULL,
  `name` double(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tires_h`
--

INSERT INTO `tires_h` (`id`, `name`) VALUES
(1, 70.00),
(2, 80.00);

-- --------------------------------------------------------

--
-- Структура таблицы `tires_r`
--

CREATE TABLE `tires_r` (
  `id` int(11) NOT NULL,
  `name` double(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tires_r`
--

INSERT INTO `tires_r` (`id`, `name`) VALUES
(1, 13.00),
(2, 14.00);

-- --------------------------------------------------------

--
-- Структура таблицы `tires_w`
--

CREATE TABLE `tires_w` (
  `id` int(11) NOT NULL,
  `name` double(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tires_w`
--

INSERT INTO `tires_w` (`id`, `name`) VALUES
(1, 145.00),
(2, 155.00);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `tiresinfo`
--
ALTER TABLE `tiresinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `tiresmarks`
--
ALTER TABLE `tiresmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `tiresmodels`
--
ALTER TABLE `tiresmodels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `tires_h`
--
ALTER TABLE `tires_h`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `tires_r`
--
ALTER TABLE `tires_r`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `tires_w`
--
ALTER TABLE `tires_w`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `tiresinfo`
--
ALTER TABLE `tiresinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `tiresmarks`
--
ALTER TABLE `tiresmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `tiresmodels`
--
ALTER TABLE `tiresmodels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `tires_h`
--
ALTER TABLE `tires_h`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `tires_r`
--
ALTER TABLE `tires_r`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `tires_w`
--
ALTER TABLE `tires_w`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

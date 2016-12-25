-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 25 2016 г., 23:22
-- Версия сервера: 10.1.9-MariaDB
-- Версия PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dest`
--

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `address` text NOT NULL,
  `comment` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `address`, `comment`, `time`) VALUES
(1, '123', '321', '2016-12-23 00:00:00'),
(2, '123', '321', '2015-12-23 00:00:00'),
(3, '123', '321', '2013-12-23 00:00:00'),
(4, '123', '321', '2014-12-23 00:00:00'),
(5, '123', '321', '2012-12-23 00:00:00'),
(6, '123', '321', '2014-12-23 00:00:00'),
(7, '123', '321', '2015-12-23 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `mark` varchar(512) NOT NULL,
  `model` varchar(512) NOT NULL,
  `w` double(5,2) NOT NULL,
  `h` double(5,2) NOT NULL,
  `r` double(5,2) NOT NULL,
  `season` enum('зима','лето','всесезонные','') NOT NULL,
  `ship` int(11) NOT NULL,
  `index_m` int(11) NOT NULL,
  `index_v` varchar(20) NOT NULL,
  `price` double(7,2) NOT NULL,
  `quant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `mark`, `model`, `w`, `h`, `r`, `season`, `ship`, `index_m`, `index_v`, `price`, `quant`) VALUES
(1, 'Continental', 'ContiViking Contact 6', 145.00, 70.00, 13.00, 'зима', 1, 100, 'T', 3976.00, 40),
(2, 'Continental', 'ContiViking Contact 6', 155.00, 80.00, 13.00, 'лето', 0, 50, 'V', 5967.00, 37),
(3, 'Continental', 'ContiViking Contact 8', 155.00, 70.00, 14.00, 'лето', 0, 70, 'N', 2968.00, 43);

-- --------------------------------------------------------

--
-- Структура таблицы `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quant` int(11) NOT NULL,
  `price` double(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `user_id`, `order_id`, `quant`, `price`) VALUES
(1, 2, 1, 1, 4, 5555.00),
(2, 2, 1, 2, 4, 5555.00),
(3, 2, 1, 3, 4, 5555.00),
(4, 2, 1, 4, 4, 5555.00),
(5, 2, 1, 5, 4, 5555.00),
(6, 2, 1, 6, 4, 5555.00),
(7, 2, 1, 7, 4, 5555.00);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `phone`) VALUES
(1, 'Антон', '1232');

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
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

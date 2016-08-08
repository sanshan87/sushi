-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 08 2016 г., 16:08
-- Версия сервера: 10.1.10-MariaDB
-- Версия PHP: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sushi`
--

-- --------------------------------------------------------

--
-- Структура таблицы `s_blog`
--

CREATE TABLE `s_blog` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `url` varchar(255) NOT NULL,
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `annotation` text NOT NULL,
  `text` longtext NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_blog`
--

INSERT INTO `s_blog` (`id`, `name`, `url`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`, `visible`, `date`) VALUES
(1, 'Что нового в этой версии симплы', 'chto-novogo-v-etoj-versii-simply', 'Что нового в этой версии симплы', 'Что нового в этой версии симплы', '', '', '<p>&nbsp;</p><div><p>Сортировка товаров и других списков перетаскиванием, в том числе перетаскивание в другую категорию или бренд<br />Указание "бесконечного" количество товара на складе<br />Акционная цена (указание старой цены товара)<br />Авторесайз изображений imagick<br />Поддержка jpg, png и gif, в том сисле с анимацией и прозрачностью<br />Водяной знак для изображений<br />Модерация комментариев к товарам</p><h2>Снаружи</h2><p>Аяксовая корзина<br />Фильтр товаров по характеристикам с учетом существования товаров<br />Сортировка товаров по цене и названию</p><h2>Заказы</h2><p>Полное редактирование заказов<br />Примечания администратора к заказам<br />Возможность не включать в заказ стоимость доставки<br />Статистика заказов по дням</p><h2>Блог</h2><p>Блог вместо статей и новостей<br />Комментарии к записям в блоге<br />Модерация комментариев к записям в блоге</p><h2>Импорт</h2><p>Импорт характеристик товаров<br />Импорт изображений с другого сервера<br />Снято ограничение на объем импортируемого файла (теперь ограничение только в настройках сервера)</p><h2>Экспорт</h2><p>Экспорт характеристик товаров<br />Снято ограничение на объем экспорта</p><h2>Редактирование шаблонов</h2><p>Сохранение изменений без перезагрузки страницы<br />Размер изображений задаётся на месте их вывода в шаблоне</p><h2>Валюты</h2><p>Указание формата валют и возможность округления до рублей</p><h2>1C</h2><p>Синхронизация с 1С (товары и заказы)</p></div><p>&nbsp;</p>', 1, '2011-10-22 20:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `s_brands`
--

CREATE TABLE `s_brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_categories`
--

CREATE TABLE `s_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `external_id` varchar(36) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_categories`
--

INSERT INTO `s_categories` (`id`, `parent_id`, `name`, `meta_title`, `meta_keywords`, `meta_description`, `description`, `url`, `image`, `position`, `visible`, `external_id`) VALUES
(12, 0, 'Другие блюда', 'Другие блюда', 'Другие блюда', '', '', 'drugie-blyuda', '', 12, 1, ''),
(10, 0, 'Салаты', 'Салаты', 'Салаты', '', '', 'salaty', '', 10, 1, ''),
(11, 0, 'Напитки', 'Напитки', 'Напитки', '', '', 'napitki', '', 11, 1, ''),
(9, 0, 'Соусы', 'Соусы', 'Соусы', '', '', 'sousy', '', 9, 1, ''),
(8, 0, 'Лапша', 'Лапша', 'Лапша', '', '', 'lapsha', '', 8, 1, ''),
(6, 0, 'Суши', 'Суши', 'Суши', '', '', 'sushi', '', 6, 1, ''),
(7, 0, 'Роллы', 'Роллы', 'Роллы', '', '', 'rolly', '', 7, 1, ''),
(13, 0, 'Закуски', 'Закуски', 'Закуски', '', '', 'zakuski', '', 13, 1, ''),
(14, 7, 'Ассорти', 'Ассорти', 'Ассорти', '', '', 'rolly-assorti', '', 14, 1, ''),
(15, 7, 'Жареные', 'Жареные', 'Жареные', '', '', 'rolly-zharenye', '', 15, 1, ''),
(16, 7, 'Запечёные', 'Запечёные', 'Запечёные', '', '', 'rolly-zapechenye', '', 16, 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `s_categories_features`
--

CREATE TABLE `s_categories_features` (
  `category_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_categories_features`
--

INSERT INTO `s_categories_features` (`category_id`, `feature_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(3, 7),
(3, 73),
(3, 74),
(3, 75),
(3, 76),
(3, 77),
(3, 78),
(3, 79),
(3, 80),
(3, 81),
(3, 82),
(3, 83),
(3, 84),
(3, 85),
(3, 86),
(3, 87),
(3, 88),
(3, 89),
(4, 2),
(4, 6),
(4, 7),
(4, 83),
(4, 90),
(4, 91),
(4, 92),
(4, 93),
(4, 94),
(4, 95),
(4, 96),
(4, 97),
(4, 98),
(4, 99),
(5, 7),
(5, 25),
(5, 32),
(5, 35),
(5, 58),
(5, 83),
(5, 100),
(5, 101),
(5, 102),
(5, 103),
(5, 104),
(5, 105),
(5, 106),
(5, 107),
(5, 108),
(5, 109),
(5, 110),
(5, 111),
(5, 112),
(5, 113),
(5, 114),
(5, 115),
(5, 116),
(5, 117),
(5, 118),
(5, 119),
(5, 120),
(5, 121),
(5, 122),
(5, 123),
(5, 124),
(5, 125),
(5, 126),
(5, 127),
(5, 128),
(5, 129),
(5, 130),
(5, 131),
(5, 132),
(5, 133),
(5, 134),
(5, 135),
(5, 136),
(5, 137),
(5, 138),
(5, 139),
(5, 140),
(5, 141),
(5, 142),
(5, 143),
(5, 144),
(5, 145),
(5, 146),
(5, 147),
(5, 148);

-- --------------------------------------------------------

--
-- Структура таблицы `s_comments`
--

CREATE TABLE `s_comments` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `type` enum('product','blog') NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_coupons`
--

CREATE TABLE `s_coupons` (
  `id` bigint(20) NOT NULL,
  `code` varchar(256) NOT NULL,
  `expire` timestamp NULL DEFAULT NULL,
  `type` enum('absolute','percentage') NOT NULL DEFAULT 'absolute',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_order_price` decimal(10,2) DEFAULT NULL,
  `single` int(1) NOT NULL DEFAULT '0',
  `usages` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_coupons`
--

INSERT INTO `s_coupons` (`id`, `code`, `expire`, `type`, `value`, `min_order_price`, `single`, `usages`) VALUES
(11, 'THANKYOU', '2015-05-31 20:00:00', 'absolute', '5.00', '50000.00', 1, 0),
(15, 'SIMPLACMS', NULL, 'absolute', '10.00', '150000.00', 0, 0),
(17, 'TESTCOUPON', '2010-05-31 20:00:00', 'percentage', '0.10', '0.00', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `s_currencies`
--

CREATE TABLE `s_currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `sign` varchar(20) NOT NULL,
  `code` char(3) NOT NULL DEFAULT '',
  `rate_from` decimal(10,2) NOT NULL DEFAULT '1.00',
  `rate_to` decimal(10,2) NOT NULL DEFAULT '1.00',
  `cents` int(1) NOT NULL DEFAULT '2',
  `position` int(11) NOT NULL,
  `enabled` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_currencies`
--

INSERT INTO `s_currencies` (`id`, `name`, `sign`, `code`, `rate_from`, `rate_to`, `cents`, `position`, `enabled`) VALUES
(2, 'рубли', 'р.', 'RUR', '3.75', '3.75', 0, 1, 1),
(1, 'доллары', '$', 'USD', '1.00', '30.00', 2, 2, 1),
(3, 'вебмани wmz', 'wmz', 'WMZ', '0.15', '3.75', 2, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `s_delivery`
--

CREATE TABLE `s_delivery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `free_from` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `separate_payment` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_delivery`
--

INSERT INTO `s_delivery` (`id`, `name`, `description`, `free_from`, `price`, `enabled`, `position`, `separate_payment`) VALUES
(1, 'Курьерская доставка по Москве', '<p><span>Курьерская доставка осуществляется на следующий день после оформления заказа, если товар есть в наличии. Курьерская доставка осуществляется в пределах Томска и Северска ежедневно с 10.00 до 21.00. Заказ на сумму свыше 300 рублей доставляется бесплатно.&nbsp;<br /><br />Стоимость бесплатной доставки раcсчитывается от суммы заказа с учтенной скидкой. В случае если сумма заказа после применения скидки менее 300р, осуществляется платная доставка.&nbsp;<br /><br />При сумме заказа менее 300 рублей стоимость доставки составляет от 50 рублей.</span></p>', '5000.00', '120.00', 1, 2, 1),
(2, 'Самовывоз', '<p>Удобный, бесплатный и быстрый способ получения заказа.</p><p>Адрес офиса: Адрес офиса: Москва, ул. Арбат, 1/3, офис 419</p>', '0.00', '0.00', 1, 3, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `s_delivery_payment`
--

CREATE TABLE `s_delivery_payment` (
  `delivery_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Связка способом оплаты и способов доставки';

--
-- Дамп данных таблицы `s_delivery_payment`
--

INSERT INTO `s_delivery_payment` (`delivery_id`, `payment_method_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),
(3, 2),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `s_features`
--

CREATE TABLE `s_features` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `in_filter` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_features`
--

INSERT INTO `s_features` (`id`, `name`, `position`, `in_filter`) VALUES
(1, 'Стандарт', 1, 0),
(2, 'Тип', 2, 1),
(3, 'Платформа', 3, 0),
(4, 'Операционная система', 4, 1),
(5, 'Тип корпуса', 5, 1),
(6, 'Материал корпуса', 6, 0),
(7, 'Вес', 7, 0),
(8, 'Размеры (ШxВxТ)', 8, 0),
(9, 'Тип экрана', 9, 0),
(10, 'Тип сенсорного экрана', 10, 0),
(11, 'Диагональ', 11, 0),
(12, 'Размер изображения', 12, 0),
(13, 'Автоматический поворот экрана', 13, 0),
(14, 'Тип мелодий', 14, 0),
(15, 'Виброзвонок', 15, 0),
(16, 'Фотокамера', 16, 0),
(17, 'Запись видеороликов', 17, 0),
(18, 'Макс. частота кадров видео', 18, 0),
(19, 'Воспроизведение видео', 19, 0),
(20, 'Аудио', 20, 0),
(21, 'Диктофон', 21, 0),
(22, 'Игры', 22, 0),
(23, 'Java-приложения', 23, 0),
(24, 'Разъем для наушников', 24, 0),
(25, 'Интерфейсы', 25, 0),
(26, 'Зарядка от USB', 26, 0),
(27, 'Встроенный GPS-приемник', 27, 0),
(28, 'Cистема A-GPS', 28, 0),
(29, 'Доступ в интернет', 29, 0),
(30, 'Синхронизация с компьютером', 30, 0),
(31, 'Использование в качестве USB-накопителя', 31, 0),
(32, 'Объем встроенной памяти', 32, 0),
(33, 'MMS', 33, 0),
(34, 'Тип аккумулятора', 34, 0),
(35, 'Емкость аккумулятора', 35, 0),
(36, 'Время разговора', 36, 0),
(37, 'Время ожидания', 37, 0),
(38, 'Громкая связь (встроенный динамик)', 38, 0),
(39, 'Режим полета', 39, 0),
(40, 'Датчики', 40, 0),
(41, 'Поиск по книжке', 41, 0),
(42, 'Обмен между SIM-картой и внутренней памятью', 42, 0),
(43, 'Органайзер', 43, 0),
(44, 'Комплектация', 44, 0),
(45, 'Дата анонсирования (г-м-д)', 45, 0),
(46, 'Русификация', 46, 0),
(47, 'Распознавание', 47, 0),
(48, 'Макс. разрешение видео', 48, 0),
(49, 'Geo Tagging', 49, 0),
(50, 'Фронтальная камера', 50, 0),
(51, 'Видеовыход', 51, 0),
(52, 'Модем', 52, 0),
(53, 'Объем постоянной памяти (ROM)', 53, 0),
(54, 'Процессор', 54, 0),
(55, 'Время работы в режиме прослушивания музыки', 55, 0),
(56, 'Управление', 56, 0),
(57, 'Автодозвон', 57, 0),
(58, 'Особенности', 58, 0),
(59, 'Поддержка DLNA', 59, 0),
(60, 'Объем оперативной памяти (RAM)', 60, 0),
(61, 'Дополнительные функции SMS', 61, 0),
(62, 'Профиль A2DP', 62, 0),
(63, 'Дата начала продаж (г-м-д)', 63, 0),
(64, 'QWERTY-клавиатура', 64, 0),
(65, 'VoIP-клиент', 65, 0),
(66, 'Push-To-Talk', 66, 0),
(67, 'Режимы кодирования звука HR, FR, EFR', 67, 0),
(68, 'Записная книжка в аппарате', 68, 0),
(69, 'Уровень SAR', 69, 0),
(70, 'Официальная поставка в Россию', 70, 0),
(71, 'Mobile Tracker', 71, 0),
(72, 'Поддержка двух SIM-карт', 72, 0),
(73, 'Уборка', 73, 0),
(74, 'Потребляемая мощность', 74, 0),
(75, 'Пылесборник', 75, 0),
(76, 'Регулятор мощности', 76, 0),
(77, 'Фильтр тонкой очистки', 77, 0),
(78, 'Источник питания', 78, 0),
(79, 'Уровень шума', 79, 0),
(80, 'Длина сетевого шнура', 80, 0),
(81, 'Функции и возможности', 81, 0),
(82, 'Размеры пылесоса (ШxГxВ)', 82, 0),
(83, 'Дополнительная информация', 83, 0),
(84, 'Труба всасывания', 84, 0),
(85, 'Возможность подключения электрощетки', 85, 0),
(86, 'Дополнительные насадки в комплекте', 86, 0),
(87, 'Турбощетка в комплекте', 87, 0),
(88, 'Мощность всасывания', 88, 0),
(89, 'Электрощетка в комплекте', 89, 0),
(90, 'Чаша', 90, 0),
(91, 'Мощность', 91, 0),
(92, 'Число скоростей', 92, 0),
(93, 'Дополнительные режимы', 93, 0),
(94, 'Количество насадок', 94, 0),
(95, 'Насадки', 95, 0),
(96, 'Кнопка отсоединения насадок', 96, 0),
(97, 'Защитная крышка на чашу', 97, 0),
(98, 'Прорезиненная ручка', 98, 0),
(99, 'Приспособление для хранения насадок', 99, 0),
(100, 'Общее число пикселов', 100, 0),
(101, 'Число эффективных пикселов', 101, 0),
(102, 'Физический размер', 102, 0),
(103, 'Кроп-фактор', 103, 0),
(104, 'Тип матрицы', 104, 0),
(105, 'Чувствительность', 105, 0),
(106, 'Баланс белого', 106, 0),
(107, 'Вспышка', 107, 0),
(108, 'Макросъёмка', 108, 0),
(109, 'Таймер', 109, 0),
(110, 'Время работы таймера', 110, 0),
(111, 'Формат кадра (фотосъемка)', 111, 0),
(112, 'Фокусное расстояние (35 мм эквивалент)', 112, 0),
(113, 'Оптический Zoom', 113, 0),
(114, 'Диафрагма', 114, 0),
(115, 'Видоискатель', 115, 0),
(116, 'ЖК-экран', 116, 0),
(117, 'Тип ЖК-экрана', 117, 0),
(118, 'Ручная настройка выдержки и диафрагмы', 118, 0),
(119, 'Экспокоррекция ', 119, 0),
(120, 'Минимальное расстояние съемки', 120, 0),
(121, 'Тип карт памяти', 121, 0),
(122, 'Форматы изображения', 122, 0),
(123, 'Формат аккумуляторов', 123, 0),
(124, 'Количество аккумуляторов', 124, 0),
(125, 'Запись видео', 125, 0),
(126, 'Формат записи видео', 126, 0),
(127, 'Максимальное разрешение роликов', 127, 0),
(128, 'Цифровой Zoom', 128, 0),
(129, 'Дополнительные возможности', 129, 0),
(130, 'Дата анонсирования', 130, 0),
(131, 'Дата начала продаж', 131, 0),
(132, 'Размер', 132, 0),
(133, 'Стабилизатор изображения (фотосъемка)', 133, 0),
(134, 'Режим серийной съемки', 134, 0),
(135, 'Подсветка автофокуса', 135, 0),
(136, 'Фокусировка по лицу', 136, 0),
(137, 'Разъем питания', 137, 0),
(138, 'Запись звука', 138, 0),
(139, 'Название объектива', 139, 0),
(140, 'Максимальная частота кадров видеоролика', 140, 0),
(141, 'Максимальная частота кадров при съемке HD-видео', 141, 0),
(142, 'Электронная стабилизация при видеосъемке', 142, 0),
(143, 'Скорость съемки', 143, 0),
(144, 'Число оптических элементов', 144, 0),
(145, 'Число групп оптических элементов', 145, 0),
(146, 'Выдержка', 146, 0),
(147, 'Замер экспозиции', 147, 0),
(148, 'Автоматическая обработка экспозиции', 148, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `s_feedbacks`
--

CREATE TABLE `s_feedbacks` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_groups`
--

CREATE TABLE `s_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_groups`
--

INSERT INTO `s_groups` (`id`, `name`, `discount`) VALUES
(1, 'Постоянный покупатель', '2.00');

-- --------------------------------------------------------

--
-- Структура таблицы `s_images`
--

CREATE TABLE `s_images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_images`
--

INSERT INTO `s_images` (`id`, `name`, `product_id`, `filename`, `position`) VALUES
(135, '', 51, 'filadelfiya-premium_mini.jpeg', 135),
(134, '', 50, 'zapechenyj-roll-yakitoriya_mini.jpeg', 134),
(133, '', 49, 'roll-kido_mini.jpeg', 133),
(129, '', 47, 'filadelfiya-s-ogurtsom_mini.jpeg', 129),
(130, '', 48, 'spajs-s-midiyami_mini.jpeg', 130),
(132, '', 46, 'syake-unagi_mini.jpeg', 132);

-- --------------------------------------------------------

--
-- Структура таблицы `s_labels`
--

CREATE TABLE `s_labels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(6) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_labels`
--

INSERT INTO `s_labels` (`id`, `name`, `color`, `position`) VALUES
(4, 'перезвонить', 'ff00ff', 4),
(5, 'ожидается товар', '00d5fa', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `s_menu`
--

CREATE TABLE `s_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_menu`
--

INSERT INTO `s_menu` (`id`, `name`, `position`) VALUES
(1, 'Основное меню', 1),
(2, 'Другие страницы', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `s_options`
--

CREATE TABLE `s_options` (
  `product_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `value` varchar(1024) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_orders`
--

CREATE TABLE `s_orders` (
  `id` bigint(20) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `delivery_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method_id` int(11) DEFAULT NULL,
  `paid` int(1) NOT NULL DEFAULT '0',
  `payment_date` datetime NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `comment` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `payment_details` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `note` varchar(1024) NOT NULL,
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(255) NOT NULL,
  `separate_delivery` int(1) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_orders`
--

INSERT INTO `s_orders` (`id`, `delivery_id`, `delivery_price`, `payment_method_id`, `paid`, `payment_date`, `closed`, `date`, `user_id`, `name`, `address`, `phone`, `email`, `comment`, `status`, `url`, `payment_details`, `ip`, `total_price`, `note`, `discount`, `coupon_discount`, `coupon_code`, `separate_delivery`, `modified`) VALUES
(1, 1, '4.00', 0, 0, '0000-00-00 00:00:00', 0, '2012-05-09 15:27:27', 0, 'Артемий Иванов', 'Москва, Шоссе Энтузиастов 56', '545-65-34', 'ai@mail.ru', '', 0, '3bc6d5763e8fd5a3ec784c8561402498', '', '', '35439.00', '', '5.00', '0.00', '', 0, '2013-03-27 07:20:11'),
(2, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2011-11-09 15:29:04', 0, 'Константин Мельников', 'Москва, ул. Строителей 3', '333-23-23', 'mmk@yandex.ru', '', 0, 'e30a721505aed9c376595d729b1ab3f1', '', '', '19200.00', '', '0.00', '0.00', '', 0, '2013-03-27 07:20:03');

-- --------------------------------------------------------

--
-- Структура таблицы `s_orders_labels`
--

CREATE TABLE `s_orders_labels` (
  `order_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_orders_labels`
--

INSERT INTO `s_orders_labels` (`order_id`, `label_id`) VALUES
(1, 5),
(2, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `s_pages`
--

CREATE TABLE `s_pages` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `body` longtext NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `header` varchar(1024) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_pages`
--

INSERT INTO `s_pages` (`id`, `url`, `name`, `meta_title`, `meta_description`, `meta_keywords`, `body`, `menu_id`, `position`, `visible`, `header`) VALUES
(3, 'dostavka-i-oplata', 'Доставка и оплата', 'Доставка и оплата', 'Доставка и оплата', 'Доставка и оплата', '<h2>Курьерская доставка по&nbsp;Москве</h2><p>Курьерская доставка осуществляется на следующий день после оформления заказа<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>если товар есть в&nbsp;наличии. Курьерская доставка осуществляется в&nbsp;пределах Томска и&nbsp;Северска ежедневно с&nbsp;10.00 до&nbsp;21.00. Заказ на&nbsp;сумму свыше 300 рублей доставляется бесплатно. <br /><br />Стоимость бесплатной доставки раcсчитывается от&nbsp;суммы заказа с&nbsp;учтенной скидкой. В&nbsp;случае если сумма заказа после применения скидки менее 300р<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>осуществляется платная доставка. <br /><br />При сумме заказа менее 300 рублей стоимость доставки составляет от 50 рублей.</p><h2>Самовывоз</h2><p>Удобный<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>бесплатный и быстрый способ получения заказа.<br />Адрес офиса: Москва<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>ул. Арбат<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>1/3<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>офис 419.</p><h2>Доставка с&nbsp;помощью предприятия<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo;</h2><p>Удобный и быстрый способ доставки в крупные города России. Посылка доставляется в офис<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo; в&nbsp;Вашем городе. Для получения необходимо предъявить паспорт и&nbsp;номер грузовой декларации<span style="margin-right: 0.3em;"> </span><span style="margin-left: -0.3em;">(</span>сообщит наш менеджер после отправки). Посылку желательно получить в&nbsp;течение 24 часов с&nbsp;момента прихода груза<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>иначе компания<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo; может взыскать с Вас дополнительную оплату за хранение. Срок доставки и стоимость Вы можете рассчитать на сайте компании.</p><h2>Наложенным платежом</h2><p>При доставке заказа наложенным платежом с помощью<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Почты России&raquo;, вы&nbsp;сможете оплатить заказ непосредственно в&nbsp;момент получения товаров.</p>', 1, 4, 1, 'Доставка и оплата'),
(2, 'skidki', 'Скидки', 'Скидки', 'Скидки', 'Скидки', '<h2><span>Наличными курьеру</span></h2><p>Вы можете оплатить заказ курьеру в гривнах непосредственно в момент доставки. Курьерская доставка осуществляется по Москве на следующий день после принятия заказа.</p><h2>Яндекс.Деньги</h2><p><span>Яндекс</span><span>.</span><span>Деньги</span><span>&nbsp;&mdash; доступный и безопасный способ платить за товары и услуги через интернет</span>.</p><h2>Банковская карта</h2><p><span>Оплата банковской картой Visa или MasterCard через систему Яндекс.Деньги.</span></p><h2>Через терминал</h2><p><span>Оплатита наличными через многочисленные терминалы в любом городе России. Можно заплатить и с банковской карты через многие банкоматы. Для этого найдите в меню терминала или банкомата логотип Яндекса и укажите код платежа.</span></p><h2>Со счета мобильного телефона</h2><p><span>Оплата со&nbsp;счета мобильного телефона&nbsp;через систему Яндекс.Деньги.</span></p><h2>Webmoney</h2><p>После оформления заказа вы сможете перейти на сайт webmoney для оплаты заказа, где сможете оплатить заказ в автоматическом режиме, а так же проверить наш сертификат продавца.</p><h2>Квитанция</h2><p><span>Вы можете распечатать квитанцию и оплатить её в любом отделении банка.</span></p><h2>Робокасса</h2><p><span>ROBOKASSA &ndash; сервис для организации приема платежей на сайте, интернет магазине и социальных сетях. Прием платежей осуществляется при минимальных комиссиях.</span></p><h2>PayPal</h2><p><span>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</span></p><h2>Оплата через Интеркассу</h2><p><span>Это удобный в использовании сервис, подключение к которому позволит Интернет-магазинам, веб-сайтам и прочим торговым площадкам принимать все возможные формы оплаты в максимально короткие сроки.</span></p><h2>Оплата картой через Liqpay.com</h2><p><span>Благодаря своей открытости и универсальности LiqPAY стремительно интегрируется со многими платежными системами и платформами и становится стандартом платежных операций.</span></p><h2>Оплата через Pay2Pay</h2><p><span>Универсальный платежный сервис Pay2Pay призван облегчить и максимально упростить процесс приема электронных платежей на Вашем сайте. Мы открыты для всего нового и сверхсовременного.</span></p><h2>Оплатить через QIWI</h2><p><span>QIWI &mdash; удобный сервис для оплаты повседневных услуг.</span></p><h2><span style="font-size: 20px;">Наличными в офисе Автолюкса</span></h2><p>При доставке заказа системой Автолюкс, вы сможете оплатить заказ в их офисе непосредственно в момент получения товаров.</p>', 1, 3, 1, 'Скидки'),
(1, '', 'Главная', 'Интернет-магазин Сушитория', 'Интернет-магазин Сушитория', 'Интернет-магазин Сушитория', '', 1, 1, 1, 'Главная'),
(4, 'shares', 'Акции', 'Акции', '', 'Акции', '', 1, 2, 1, 'Акции'),
(5, '404', '', 'Страница не найдена', 'Страница не найдена', 'Страница не найдена', '<p>Страница не найдена</p>', 2, 5, 1, 'Страница не найдена'),
(6, 'contacts', 'Контакты', 'Контакты', 'Контакты', 'Контакты', '<p>Москва, шоссе Энтузиастов 45/31, офис 453.</p><p><a href="http://maps.yandex.ru/?text=%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D1%8F%2C%20%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0%2C%20%D0%AD%D0%BD%D1%82%D1%83%D0%B7%D0%B8%D0%B0%D1%81%D1%82%D0%BE%D0%B2%20%D1%88%D0%BE%D1%81%D1%81%D0%B5%2C%2051&amp;sll=37.823314%2C55.773034&amp;sspn=0.021955%2C0.009277&amp;ll=37.826161%2C55.77356&amp;spn=0.019637%2C0.006461&amp;l=map">Посмотреть на&nbsp;Яндекс.Картах</a></p><p>Телефон 345-45-54</p>', 1, 6, 1, 'Контакты'),
(7, 'products', 'Все товары', 'Все товары', '', 'Все товары', '', 2, 7, 1, 'Все товары');

-- --------------------------------------------------------

--
-- Структура таблицы `s_payment_methods`
--

CREATE TABLE `s_payment_methods` (
  `id` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `currency_id` float NOT NULL,
  `settings` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_payment_methods`
--

INSERT INTO `s_payment_methods` (`id`, `module`, `name`, `description`, `currency_id`, `settings`, `enabled`, `position`) VALUES
(1, 'Receipt', 'Квитанция', '<p>Вы можете распечатать квитанцию и оплатить её в любом отделении банка.</p>', 2, 'a:10:{s:9:"recipient";s:65:"ООО "Великолепный интернет-магазин"";s:3:"inn";s:5:"12345";s:7:"account";s:6:"223456";s:4:"bank";s:18:"Альфабанк";s:3:"bik";s:6:"556677";s:21:"correspondent_account";s:11:"77777755555";s:8:"banknote";s:7:"руб.";s:5:"pense";s:7:"коп.";s:5:"purse";s:2:"ru";s:10:"secret_key";s:0:"";}', 1, 6),
(2, 'Webmoney', 'Webmoney wmz', '<p><span></span></p><div><p>Оплата через платежную систему&nbsp;<a href="http://www.webmoney.ru">WebMoney</a>. У вас должен быть счет в этой системе для того, чтобы произвести оплату. Сразу после оформления заказа вы будете перенаправлены на специальную страницу системы WebMoney, где сможете произвести платеж в титульных знаках WMZ.</p></div><p>&nbsp;</p>', 3, 'a:10:{s:9:"recipient";s:0:"";s:3:"inn";s:0:"";s:7:"account";s:0:"";s:4:"bank";s:0:"";s:3:"bik";s:0:"";s:21:"correspondent_account";s:0:"";s:8:"banknote";s:7:"руб.";s:5:"pense";s:0:"";s:5:"purse";s:13:"Z111111111111";s:10:"secret_key";s:13:"testsecretkey";}', 1, 5),
(3, 'Robokassa', 'Робокасса', '<p><span>ROBOKASSA &ndash; сервис для организации приема платежей на сайте, интернет магазине и социальных сетях. Прием платежей осуществляется при минимальных комиссиях.</span></p>', 3, 'a:4:{s:5:"login";s:0:"";s:9:"password1";s:0:"";s:9:"password2";s:0:"";s:8:"language";s:2:"ru";}', 1, 7),
(4, 'Paypal', 'PayPal', '<p>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</p>', 1, 'a:2:{s:8:"business";s:0:"";s:4:"mode";s:7:"sandbox";}', 1, 8),
(5, 'Interkassa', 'Оплата через Интеркассу', '<p><span>Это удобный в использовании сервис, подключение к которому позволит Интернет-магазинам, веб-сайтам и прочим торговым площадкам принимать все возможные формы оплаты в максимально короткие сроки.</span></p>', 2, 'a:2:{s:18:"interkassa_shop_id";s:3:"123";s:21:"interkassa_secret_key";s:3:"123";}', 1, 9),
(6, 'Liqpay', 'Оплата картой через Liqpay.com', '<p><span>Благодаря своей открытости и универсальности LiqPAY стремительно интегрируется со многими платежными системами и платформами и становится стандартом платежных операций.</span></p>', 2, 'a:5:{s:9:"liqpay_id";s:3:"123";s:11:"liqpay_sign";s:3:"123";s:12:"pay_way_card";s:1:"1";s:14:"pay_way_liqpay";s:1:"1";s:15:"pay_way_delayed";s:1:"1";}', 1, 10),
(7, 'Pay2Pay', 'Оплата через Pay2Pay', '<p>Универсальный платежный сервис Pay2Pay призван облегчить и максимально упростить процесс приема электронных платежей на Вашем сайте. Мы открыты для всего нового и сверхсовременного.</p>', 2, 'a:5:{s:18:"pay2pay_merchantid";s:3:"123";s:14:"pay2pay_secret";s:3:"123";s:14:"pay2pay_hidden";s:3:"123";s:15:"pay2pay_paymode";s:3:"123";s:16:"pay2pay_testmode";s:1:"1";}', 1, 11),
(8, 'Qiwi', 'Оплатить через QIWI', '<p><span>QIWI &mdash; удобный сервис для оплаты повседневных услуг.</span></p>', 2, 'a:2:{s:10:"qiwi_login";s:3:"123";s:13:"qiwi_password";s:3:"123";}', 1, 12),
(9, 'YandexMoney', 'Яндекс.Деньги', '<p><span>Яндекс</span><span>.</span><span>Деньги</span><span>&nbsp;&mdash; доступный и безопасный способ платить за товары и услуги через интернет.</span></p>', 2, 'a:5:{s:13:"yandex_shopid";s:2:"90";s:11:"yandex_scid";s:5:"50938";s:15:"yandex_password";s:20:"rVOs4ZDVkfkqgpRlyXqn";s:18:"yandex_paymenttype";s:2:"PC";s:15:"yandex_testmode";s:1:"1";}', 1, 1),
(10, 'YandexMoney', 'Банковская карта', '<p><span>Оплата банковской картой Visa или MasterCard через систему Яндекс.Деньги.</span></p>', 2, 'a:5:{s:13:"yandex_shopid";s:2:"90";s:11:"yandex_scid";s:5:"50938";s:15:"yandex_password";s:20:"rVOs4ZDVkfkqgpRlyXqn";s:18:"yandex_paymenttype";s:2:"AC";s:15:"yandex_testmode";s:1:"1";}', 1, 2),
(11, 'YandexMoney', 'Через терминал', '<p>Оплатита наличными через многочисленные терминалы в любом городе России. Можно заплатить и с банковской карты через многие банкоматы. Для этого найдите в меню терминала или банкомата логотип Яндекса и укажите код платежа.</p>', 2, 'a:5:{s:13:"yandex_shopid";s:2:"90";s:11:"yandex_scid";s:5:"50938";s:15:"yandex_password";s:20:"rVOs4ZDVkfkqgpRlyXqn";s:18:"yandex_paymenttype";s:2:"GP";s:15:"yandex_testmode";s:1:"1";}', 1, 3),
(12, 'YandexMoney', 'Со счета мобильного телефона', '<p><span>Оплата со&nbsp;счета мобильного телефона&nbsp;через систему Яндекс.Деньги</span></p>', 2, 'a:5:{s:13:"yandex_shopid";s:2:"90";s:11:"yandex_scid";s:5:"50938";s:15:"yandex_password";s:20:"rVOs4ZDVkfkqgpRlyXqn";s:18:"yandex_paymenttype";s:2:"MC";s:15:"yandex_testmode";s:1:"1";}', 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `s_products`
--

CREATE TABLE `s_products` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `brand_id` int(11) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `annotation` text NOT NULL,
  `body` longtext NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '0',
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `featured` tinyint(1) DEFAULT NULL,
  `external_id` varchar(36) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_products`
--

INSERT INTO `s_products` (`id`, `url`, `brand_id`, `name`, `annotation`, `body`, `visible`, `position`, `meta_title`, `meta_keywords`, `meta_description`, `created`, `featured`, `external_id`) VALUES
(46, 'syake-unagi', 0, 'Сяке-унаги', '<p>Рис, сыр, креветка, окунь, тунец,лосось, угорь, лосось х/к</p>', '', 1, 46, 'Сяке-унаги', 'Сяке-унаги, Ассорти', 'Рис, сыр, креветка, окунь, тунец,лосось, угорь, лосось х/к', '2016-08-07 16:42:57', 1, ''),
(47, 'filadelfiya-s-ogurtsom', 0, 'Филадельфия с огурцом', '<p>Рис, сыр филадельфия, огурец, лосось</p>', '', 1, 48, 'Филадельфия с огурцом', 'Филадельфия с огурцом, Ассорти', 'Рис, сыр филадельфия, огурец, лосось', '2016-08-07 18:56:42', 1, ''),
(48, 'spajs-s-midiyami', 0, 'Спайс с мидиями', '<p>рис,мидии</p>', '', 1, 47, 'Спайс с мидиями', 'Спайс с мидиями, Ассорти', 'рис,мидии', '2016-08-07 19:12:13', 1, ''),
(49, 'roll-kido', 0, 'Ролл кидо', '<p><span>Принг тесто,лосось х/к,сыр сливочный,огурец,рис</span></p>', '', 1, 49, 'Ролл кидо', 'Ролл кидо, Ассорти', 'Принг тесто,лосось х/к,сыр сливочный,огурец,рис', '2016-08-08 12:55:38', 1, ''),
(50, 'yakitoriya', 0, 'Якитория', '<p>Куриное филе,спайси соус,майонез,кунжут,жареные шампиньоны,сыр сливочный,под соусом терияки</p>', '', 1, 50, 'Якитория', 'Якитория, Суши', 'Куриное филе,спайси соус,майонез,кунжут,жареные шампиньоны,сыр сливочный,под соусом терияки', '2016-08-08 12:56:57', 1, ''),
(51, 'filadelfiya-premium', 0, 'Филадельфия премиум', '<p><span>Лосось,икра лососевая,спринг тесто,сыр сливочный</span></p>', '', 1, 51, 'Филадельфия премиум', 'Филадельфия премиум, Ассорти', 'Лосось,икра лососевая,спринг тесто,сыр сливочный', '2016-08-08 12:58:08', 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `s_products_categories`
--

CREATE TABLE `s_products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_products_categories`
--

INSERT INTO `s_products_categories` (`product_id`, `category_id`, `position`) VALUES
(51, 14, 0),
(50, 6, 0),
(49, 14, 0),
(48, 14, 0),
(47, 14, 0),
(46, 14, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `s_purchases`
--

CREATE TABLE `s_purchases` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `variant_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `variant_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_purchases`
--

INSERT INTO `s_purchases` (`id`, `order_id`, `product_id`, `variant_id`, `product_name`, `variant_name`, `price`, `amount`, `sku`) VALUES
(1, 1, NULL, NULL, 'Nokia 701', '', '17000.00', 1, ''),
(2, 1, NULL, NULL, 'HTC Sensation', '', '20300.00', 1, ''),
(3, 2, NULL, NULL, 'Samsung Galaxy S II', '', '19200.00', 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `s_related_products`
--

CREATE TABLE `s_related_products` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_settings`
--

CREATE TABLE `s_settings` (
  `setting_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_settings`
--

INSERT INTO `s_settings` (`setting_id`, `name`, `value`) VALUES
(8, 'site_name', 'Великолепный интернет-магазин'),
(9, 'company_name', 'ООО "Великолепный интернет-магазин"'),
(50, 'units', 'шт'),
(53, 'date_format', 'd.m.Y'),
(54, 'order_email', 'me@example.com'),
(55, 'comment_email', 'me@example.com'),
(56, 'notify_from_email', 'me@example.com'),
(57, 'decimals_point', ','),
(58, 'thousands_separator', ' '),
(59, 'products_num', '24'),
(60, 'products_num_admin', '20'),
(30, 'theme', 'default'),
(33, 'products_num', '24'),
(34, 'products_num_admin', '20'),
(111, 'last_1c_orders_export_date', '2011-07-30 21:31:56'),
(112, 'license', 'bhbcfgkhfe iomjlglmpl rqwqxrtpz6 898495c7 cfee'),
(113, 'max_order_amount', '50'),
(114, 'watermark_offset_x', '50'),
(115, 'watermark_offset_y', '50'),
(116, 'watermark_transparency', '50'),
(117, 'images_sharpen', '15'),
(119, 'admin_email', 'me@example.com');

-- --------------------------------------------------------

--
-- Структура таблицы `s_users`
--

CREATE TABLE `s_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_variants`
--

CREATE TABLE `s_variants` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `compare_price` decimal(14,2) DEFAULT NULL,
  `stock` mediumint(9) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `external_id` varchar(36) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_variants`
--

INSERT INTO `s_variants` (`id`, `product_id`, `sku`, `name`, `price`, `compare_price`, `stock`, `position`, `attachment`, `external_id`) VALUES
(61, 51, '', '', '280.00', '0.00', NULL, 61, '', ''),
(60, 50, '', '', '160.00', '0.00', NULL, 60, '', ''),
(59, 49, '', '', '160.00', '0.00', NULL, 59, '', ''),
(58, 48, '', '', '200.00', '0.00', NULL, 58, '', ''),
(56, 46, '', '', '180.00', '0.00', NULL, 56, '', ''),
(57, 47, '', '', '200.00', '0.00', NULL, 57, '', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `s_blog`
--
ALTER TABLE `s_blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled` (`visible`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `s_brands`
--
ALTER TABLE `s_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `s_categories`
--
ALTER TABLE `s_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `position` (`position`),
  ADD KEY `visible` (`visible`),
  ADD KEY `external_id` (`external_id`);

--
-- Индексы таблицы `s_categories_features`
--
ALTER TABLE `s_categories_features`
  ADD PRIMARY KEY (`category_id`,`feature_id`);

--
-- Индексы таблицы `s_comments`
--
ALTER TABLE `s_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`object_id`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `s_coupons`
--
ALTER TABLE `s_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `s_currencies`
--
ALTER TABLE `s_currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `s_delivery`
--
ALTER TABLE `s_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `s_delivery_payment`
--
ALTER TABLE `s_delivery_payment`
  ADD PRIMARY KEY (`delivery_id`,`payment_method_id`);

--
-- Индексы таблицы `s_features`
--
ALTER TABLE `s_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`),
  ADD KEY `in_filter` (`in_filter`);

--
-- Индексы таблицы `s_feedbacks`
--
ALTER TABLE `s_feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `s_groups`
--
ALTER TABLE `s_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `s_images`
--
ALTER TABLE `s_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filename` (`filename`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `s_labels`
--
ALTER TABLE `s_labels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `s_menu`
--
ALTER TABLE `s_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `s_options`
--
ALTER TABLE `s_options`
  ADD PRIMARY KEY (`product_id`,`feature_id`),
  ADD KEY `value` (`value`(333)),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `feature_id` (`feature_id`);

--
-- Индексы таблицы `s_orders`
--
ALTER TABLE `s_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`user_id`),
  ADD KEY `written_off` (`closed`),
  ADD KEY `date` (`date`),
  ADD KEY `status` (`status`),
  ADD KEY `code` (`url`),
  ADD KEY `payment_status` (`paid`);

--
-- Индексы таблицы `s_orders_labels`
--
ALTER TABLE `s_orders_labels`
  ADD PRIMARY KEY (`order_id`,`label_id`);

--
-- Индексы таблицы `s_pages`
--
ALTER TABLE `s_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_num` (`position`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `s_payment_methods`
--
ALTER TABLE `s_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `s_products`
--
ALTER TABLE `s_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `visible` (`visible`),
  ADD KEY `position` (`position`),
  ADD KEY `external_id` (`external_id`),
  ADD KEY `hit` (`featured`),
  ADD KEY `name` (`name`(333));

--
-- Индексы таблицы `s_products_categories`
--
ALTER TABLE `s_products_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `position` (`position`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `s_purchases`
--
ALTER TABLE `s_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Индексы таблицы `s_related_products`
--
ALTER TABLE `s_related_products`
  ADD PRIMARY KEY (`product_id`,`related_id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `s_settings`
--
ALTER TABLE `s_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `s_users`
--
ALTER TABLE `s_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Индексы таблицы `s_variants`
--
ALTER TABLE `s_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `sku` (`sku`),
  ADD KEY `price` (`price`),
  ADD KEY `stock` (`stock`),
  ADD KEY `position` (`position`),
  ADD KEY `external_id` (`external_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `s_blog`
--
ALTER TABLE `s_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `s_brands`
--
ALTER TABLE `s_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `s_categories`
--
ALTER TABLE `s_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `s_comments`
--
ALTER TABLE `s_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `s_coupons`
--
ALTER TABLE `s_coupons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `s_currencies`
--
ALTER TABLE `s_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `s_delivery`
--
ALTER TABLE `s_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `s_features`
--
ALTER TABLE `s_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT для таблицы `s_feedbacks`
--
ALTER TABLE `s_feedbacks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `s_groups`
--
ALTER TABLE `s_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `s_images`
--
ALTER TABLE `s_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT для таблицы `s_labels`
--
ALTER TABLE `s_labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `s_menu`
--
ALTER TABLE `s_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `s_orders`
--
ALTER TABLE `s_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `s_pages`
--
ALTER TABLE `s_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `s_payment_methods`
--
ALTER TABLE `s_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `s_products`
--
ALTER TABLE `s_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT для таблицы `s_purchases`
--
ALTER TABLE `s_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `s_settings`
--
ALTER TABLE `s_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT для таблицы `s_users`
--
ALTER TABLE `s_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `s_variants`
--
ALTER TABLE `s_variants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

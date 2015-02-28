-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
-- 
-- Хост: localhost
-- Время создания: Фев 28 2015 г., 14:28
-- Версия сервера: 5.5.36-34.0-632.precise
-- Версия PHP: 5.3.29
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
-- 
-- База данных: `serebrooo_csf`
-- 
-- --------------------------------------------------------
-- 
-- Структура таблицы `Cathedra`
-- 
CREATE TABLE IF NOT EXISTS `Cathedra` (
`id` int(11) NOT NULL,
`title` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- 
-- Дамп данных таблицы `Cathedra`
-- 
INSERT INTO `Cathedra` (`id`, `title`) VALUES
(1, 'ПИИТ'),
(2, 'ИСИТ');
-- --------------------------------------------------------
-- 
-- Структура таблицы `Classroom`
-- 
CREATE TABLE IF NOT EXISTS `Classroom` (
`title` varchar(50) NOT NULL,
`location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 
-- Дамп данных таблицы `Classroom`
-- 
INSERT INTO `Classroom` (`title`, `location`) VALUES
('291', '2nd floor'),
('292', '2nd floor 2');
-- --------------------------------------------------------
-- 
-- Структура таблицы `Group`
-- 
CREATE TABLE IF NOT EXISTS `Group` (
`id` int(11) NOT NULL,
`course` int(11) NOT NULL,
`number` float NOT NULL,
`capacity` int(11) DEFAULT NULL,
`profession` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- 
-- Структура таблицы `Lesson`
-- 
CREATE TABLE IF NOT EXISTS `Lesson` (
`id` int(11) NOT NULL,
`number` int(11) DEFAULT NULL,
`time` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- 
-- Дамп данных таблицы `Lesson`
-- 
INSERT INTO `Lesson` (`id`, `number`, `time`) VALUES
(1, 1, '8.00 - 9.35'),
(2, 2, '9.45 - 10.35');
-- --------------------------------------------------------
-- 
-- Структура таблицы `Schedule`
-- 
CREATE TABLE IF NOT EXISTS `Schedule` (
`id` int(11) NOT NULL,
`parity` enum('Числитель','Знаменатель','Всегда') NOT NULL,
`lesson_id` int(11) NOT NULL,
`weekday_title` varchar(50) NOT NULL,
`classrom_title` varchar(50) NOT NULL,
`subject_id` int(11) NOT NULL,
`group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- 
-- Структура таблицы `Student`
-- 
CREATE TABLE IF NOT EXISTS `Student` (
`id` int(11) NOT NULL,
`fio` varchar(255) NOT NULL,
`type` varchar(255) DEFAULT NULL COMMENT 'Бакалавр/магистр/специалист',
`group_id` int(11) NOT NULL,
`cathedra_id` int(11) NOT NULL,
`user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- 
-- Структура таблицы `Subject`
-- 
CREATE TABLE IF NOT EXISTS `Subject` (
`id` int(11) NOT NULL,
`title` varchar(255) NOT NULL,
`teacher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-- 
-- Дамп данных таблицы `Subject`
-- 
INSERT INTO `Subject` (`id`, `title`, `teacher_id`) VALUES
(1, 'Введение в программирвоание', 1);
-- --------------------------------------------------------
-- 
-- Структура таблицы `Teacher`
-- 
CREATE TABLE IF NOT EXISTS `Teacher` (
`id` int(11) NOT NULL,
`fio` varchar(255) NOT NULL,
`rank` varchar(255) DEFAULT NULL,
`cathedra_id` int(11) DEFAULT NULL,
`user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-- 
-- Дамп данных таблицы `Teacher`
-- 
INSERT INTO `Teacher` (`id`, `fio`, `rank`, `cathedra_id`, `user_id`) VALUES
(1, 'Тюкачев Николай Аркадиевич', 'Доцент', 1, NULL);
-- --------------------------------------------------------
-- 
-- Структура таблицы `User`
-- 
CREATE TABLE IF NOT EXISTS `User` (
`id` int(11) NOT NULL,
`username` varchar(255) NOT NULL,
`password` varchar(255) NOT NULL,
`auth_key` varchar(255) NOT NULL,
`password_reset_token` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-- 
-- Дамп данных таблицы `User`
-- 
INSERT INTO `User` (`id`, `username`, `password`, `auth_key`, `password_reset_token`) VALUES
(1, 'admin', 'admin', '', '');
-- --------------------------------------------------------
-- 
-- Структура таблицы `Weekday`
-- 
CREATE TABLE IF NOT EXISTS `Weekday` (
`title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 
-- Дамп данных таблицы `Weekday`
-- 
INSERT INTO `Weekday` (`title`) VALUES
('Воскресенье'),
('Вторник'),
('Понедельник'),
('Пятница'),
('Среда'),
('Суббота'),
('Четверг');
-- 
-- Индексы сохранённых таблиц
-- 
-- 
-- Индексы таблицы `Cathedra`
-- 
ALTER TABLE `Cathedra`
ADD PRIMARY KEY (`id`);
-- 
-- Индексы таблицы `Classroom`
-- 
ALTER TABLE `Classroom`
ADD PRIMARY KEY (`title`);
-- 
-- Индексы таблицы `Group`
-- 
ALTER TABLE `Group`
ADD PRIMARY KEY (`id`);
-- 
-- Индексы таблицы `Lesson`
-- 
ALTER TABLE `Lesson`
ADD PRIMARY KEY (`id`);
-- 
-- Индексы таблицы `Schedule`
-- 
ALTER TABLE `Schedule`
ADD PRIMARY KEY (`id`), ADD KEY `FK_Schedule_Lesson` (`lesson_id`), ADD KEY `FK_Schedule_Weekday` (`weekday_title`), ADD KEY `FK_Schedule_Classroom` (`classrom_title`), ADD KEY `FK_Schedule_Subject` (`subject_id`), ADD KEY `FK_Schedule_Group` (`group_id`);
-- 
-- Индексы таблицы `Student`
-- 
ALTER TABLE `Student`
ADD PRIMARY KEY (`id`), ADD KEY `FK_Student_Group` (`group_id`), ADD KEY `FK_Student_Cathedra` (`cathedra_id`), ADD KEY `FK_Student_User` (`user_id`);
-- 
-- Индексы таблицы `Subject`
-- 
ALTER TABLE `Subject`
ADD PRIMARY KEY (`id`), ADD KEY `FK_Subject_Teacher` (`teacher_id`);
-- 
-- Индексы таблицы `Teacher`
-- 
ALTER TABLE `Teacher`
ADD PRIMARY KEY (`id`), ADD KEY `FK_Teacher_Cathedra` (`cathedra_id`), ADD KEY `FK_Teacher_User` (`user_id`);
-- 
-- Индексы таблицы `User`
-- 
ALTER TABLE `User`
ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `login` (`username`);
-- 
-- Индексы таблицы `Weekday`
-- 
ALTER TABLE `Weekday`
ADD PRIMARY KEY (`title`);
-- 
-- AUTO_INCREMENT для сохранённых таблиц
-- 
-- 
-- AUTO_INCREMENT для таблицы `Cathedra`
-- 
ALTER TABLE `Cathedra`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
-- 
-- AUTO_INCREMENT для таблицы `Group`
-- 
ALTER TABLE `Group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
-- 
-- AUTO_INCREMENT для таблицы `Lesson`
-- 
ALTER TABLE `Lesson`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
-- 
-- AUTO_INCREMENT для таблицы `Schedule`
-- 
ALTER TABLE `Schedule`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
-- 
-- AUTO_INCREMENT для таблицы `Student`
-- 
ALTER TABLE `Student`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
-- 
-- AUTO_INCREMENT для таблицы `Subject`
-- 
ALTER TABLE `Subject`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
-- 
-- AUTO_INCREMENT для таблицы `Teacher`
-- 
ALTER TABLE `Teacher`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
-- 
-- AUTO_INCREMENT для таблицы `User`
-- 
ALTER TABLE `User`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
-- 
-- Ограничения внешнего ключа сохраненных таблиц
-- 
-- 
-- Ограничения внешнего ключа таблицы `Schedule`
-- 
ALTER TABLE `Schedule`
ADD CONSTRAINT `FK_Schedule_Classroom` FOREIGN KEY (`classrom_title`) REFERENCES `Classroom` (`title`),
ADD CONSTRAINT `FK_Schedule_Group` FOREIGN KEY (`group_id`) REFERENCES `Group` (`id`),
ADD CONSTRAINT `FK_Schedule_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `Lesson` (`id`),
ADD CONSTRAINT `FK_Schedule_Subject` FOREIGN KEY (`subject_id`) REFERENCES `Subject` (`id`),
ADD CONSTRAINT `FK_Schedule_Weekday` FOREIGN KEY (`weekday_title`) REFERENCES `Weekday` (`title`);
-- 
-- Ограничения внешнего ключа таблицы `Student`
-- 
ALTER TABLE `Student`
ADD CONSTRAINT `FK_Student_Cathedra` FOREIGN KEY (`cathedra_id`) REFERENCES `Cathedra` (`id`),
ADD CONSTRAINT `FK_Student_Group` FOREIGN KEY (`group_id`) REFERENCES `Group` (`id`),
ADD CONSTRAINT `FK_Student_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);
-- 
-- Ограничения внешнего ключа таблицы `Subject`
-- 
ALTER TABLE `Subject`
ADD CONSTRAINT `FK_Subject_Teacher` FOREIGN KEY (`teacher_id`) REFERENCES `Teacher` (`id`);
-- 
-- Ограничения внешнего ключа таблицы `Teacher`
-- 
ALTER TABLE `Teacher`
ADD CONSTRAINT `FK_Teacher_Cathedra` FOREIGN KEY (`cathedra_id`) REFERENCES `Cathedra` (`id`),
ADD CONSTRAINT `FK_Teacher_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

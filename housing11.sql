-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 20-06-16 13:27
-- 서버 버전: 10.4.11-MariaDB
-- PHP 버전: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `housing11`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `expert_reviews`
--

CREATE TABLE `expert_reviews` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `contents` text NOT NULL,
  `score` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `expert_reviews`
--

INSERT INTO `expert_reviews` (`id`, `uid`, `eid`, `contents`, `score`, `price`) VALUES
(7, 9, 1, 'qwe', 3, 10000),
(8, 9, 1, '123', 2, 123);

-- --------------------------------------------------------

--
-- 테이블 구조 `knowhows`
--

CREATE TABLE `knowhows` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `contents` text NOT NULL,
  `before_img` varchar(32) NOT NULL,
  `after_img` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `knowhows`
--

INSERT INTO `knowhows` (`id`, `uid`, `contents`, `before_img`, `after_img`, `created_at`) VALUES
(7, 9, 'qwe123', 'before_-1755978958.jpg', 'after_-1755978958.jpg', '0000-00-00 00:00:00'),
(8, 9, 'qwe123', 'before_1592303618.jpg', 'after_1592303618.png', '2020-06-16 10:33:38');

-- --------------------------------------------------------

--
-- 테이블 구조 `knowhow_reviews`
--

CREATE TABLE `knowhow_reviews` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `kid` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `knowhow_reviews`
--

INSERT INTO `knowhow_reviews` (`id`, `uid`, `kid`, `score`) VALUES
(5, 8, 7, 3),
(6, 1, 7, 2);

-- --------------------------------------------------------

--
-- 테이블 구조 `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `contents` text NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `requests`
--

INSERT INTO `requests` (`id`, `uid`, `sid`, `contents`, `start_date`) VALUES
(4, 9, 7, '1', '2020-06-19');

-- --------------------------------------------------------

--
-- 테이블 구조 `responses`
--

CREATE TABLE `responses` (
  `id` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `responses`
--

INSERT INTO `responses` (`id`, `qid`, `uid`, `price`) VALUES
(7, 4, 1, 123123),
(8, 4, 2, 2222);

-- --------------------------------------------------------

--
-- 테이블 구조 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `photo` varchar(30) NOT NULL,
  `auth` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `users`
--

INSERT INTO `users` (`id`, `user_id`, `password`, `user_name`, `photo`, `auth`) VALUES
(1, 'specialist1', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '전문가1', 'specialist1.jpg', 1),
(2, 'specialist2', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '전문가2', 'specialist2.jpg', 1),
(3, 'specialist3', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '전문가3', 'specialist3.jpg', 1),
(4, 'specialist4', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '전문가4', 'specialist4.jpg', 1),
(8, 'qwe123', '18138372fad4b94533cd4881f03dc6c69296dd897234e0cee83f727e2e6b1f63', 'qwe123', '1592303083.png', 0),
(9, 'id', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'name', '1592303182.jpg', 0);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `expert_reviews`
--
ALTER TABLE `expert_reviews`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `knowhows`
--
ALTER TABLE `knowhows`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `knowhow_reviews`
--
ALTER TABLE `knowhow_reviews`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `expert_reviews`
--
ALTER TABLE `expert_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `knowhows`
--
ALTER TABLE `knowhows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `knowhow_reviews`
--
ALTER TABLE `knowhow_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 테이블의 AUTO_INCREMENT `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 테이블의 AUTO_INCREMENT `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

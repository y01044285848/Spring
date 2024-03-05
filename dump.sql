-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.35 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- studydb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `studydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `studydb`;

-- 테이블 studydb.bookorder 구조 내보내기
CREATE TABLE IF NOT EXISTS `bookorder` (
  `orderNo` int DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `userId` varchar(10) DEFAULT NULL,
  `userName` varchar(10) DEFAULT NULL,
  `userAddr` varchar(50) DEFAULT NULL,
  `bookNo` int DEFAULT NULL,
  `bookName` varchar(20) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.bookorder:~7 rows (대략적) 내보내기
INSERT INTO `bookorder` (`orderNo`, `orderDate`, `userId`, `userName`, `userAddr`, `bookNo`, `bookName`, `count`, `price`) VALUES
	(10001, '2024-01-18', 'a101', '김유신', '김해', 101, '프로그래밍', 1, 28000),
	(10002, '2024-01-18', 'a102', '김춘추', '경주', 101, '프로그래밍', 1, 28000),
	(10002, '2024-01-18', 'a102', '김춘추', '경주', 102, '자료구조', 2, 32000),
	(10003, '2024-01-18', 'a103', '장보고', '완도', 102, '자료구조', 2, 32000),
	(10004, '2024-01-18', 'a104', '강감찬', '서울', 110, '데이터베이스', 1, 25000),
	(10005, '2024-01-18', 'a105', '이순신', '서울', 110, '데이터베이스', 1, 25000),
	(10005, '2024-01-18', 'a105', '이순신', '서울', 102, '자료구조', 1, 32000);

-- 테이블 studydb.child 구조 내보내기
CREATE TABLE IF NOT EXISTS `child` (
  `cid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `parent` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `hp` (`hp`),
  KEY `parent` (`parent`),
  CONSTRAINT `child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.child:~3 rows (대략적) 내보내기
INSERT INTO `child` (`cid`, `name`, `hp`, `parent`) VALUES
	('C101', '김철수', '010-1234-1001', 'P101'),
	('C102', '김영희', '010-1234-1002', 'P101'),
	('C103', '강철수', '010-1234-1003', 'P103');

-- 테이블 studydb.department 구조 내보내기
CREATE TABLE IF NOT EXISTS `department` (
  `depNo` tinyint NOT NULL,
  `name` varchar(10) NOT NULL,
  `tel` char(12) NOT NULL,
  PRIMARY KEY (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.department:~7 rows (대략적) 내보내기
INSERT INTO `department` (`depNo`, `name`, `tel`) VALUES
	(101, '영업1부', '051-512-1001'),
	(102, '영업2부', '051-512-1002'),
	(103, '영업3부', '051-512-1003'),
	(104, '영업4부', '051-512-1004'),
	(105, '영업5부', '051-512-1005'),
	(106, '영업지원부', '051-512-1006'),
	(107, '인사부', '051-512-1007');

-- 테이블 studydb.filetest 구조 내보내기
CREATE TABLE IF NOT EXISTS `filetest` (
  `fno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `oName` varchar(100) DEFAULT NULL,
  `sName` varchar(100) DEFAULT NULL,
  `rdate` datetime DEFAULT NULL,
  PRIMARY KEY (`fno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.filetest:~1 rows (대략적) 내보내기
INSERT INTO `filetest` (`fno`, `title`, `oName`, `sName`, `rdate`) VALUES
	(1, '제목1', 'OpenAPI활용가이드_부산시공공데이터_부산명소정보서비스.docx', '86b3180d-8af4-48a0-afe3-0ac919d3073a.docx', '2024-02-19 11:14:07');

-- 테이블 studydb.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `hp` char(13) NOT NULL,
  `pos` varchar(10) DEFAULT '사원',
  `dep` tinyint DEFAULT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.member:~12 rows (대략적) 내보내기
INSERT INTO `member` (`uid`, `name`, `hp`, `pos`, `dep`, `rdate`) VALUES
	('a101', '박혁거세', '010-1234-1001', '부장', 101, '2024-01-04 14:13:31'),
	('a102', '김유신', '010-1234-1002', '차장', 101, '2024-01-04 14:13:32'),
	('a103', '김춘추', '010-1234-1003', '사원', 101, '2024-01-04 14:13:33'),
	('a104', '장보고', '010-1234-1004', '대리', 102, '2024-01-04 14:13:34'),
	('a105', '강감찬', '010-1234-1005', '과장', 102, '2024-01-04 14:13:34'),
	('a106', '이성계', '010-1234-1006', '차장', 103, '2024-01-04 14:13:35'),
	('a107', '정철', '010-1234-1007', '차장', 103, '2024-01-04 14:13:36'),
	('a108', '이순신', '010-1234-1008', '부장', 104, '2024-01-04 14:13:36'),
	('a109', '허균', '010-1234-1009', '부장', 104, '2024-01-04 14:13:37'),
	('a110', '정약용', '010-1234-1010', '사원', 105, '2024-01-04 14:13:38'),
	('a111', '박지원', '010-1234-1011', '사원', 105, '2024-01-04 14:13:38'),
	('a112', '유관순', '010-1234-1012', '대리', 107, '2024-01-04 15:25:26');

-- 테이블 studydb.parent 구조 내보내기
CREATE TABLE IF NOT EXISTS `parent` (
  `pid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.parent:~5 rows (대략적) 내보내기
INSERT INTO `parent` (`pid`, `name`, `birth`, `addr`) VALUES
	('P101', '김유신', '1968-05-09', '경남 김해시'),
	('P102', '김춘추', '1972-11-23', '경남 경주시'),
	('P103', '장보고', '1978-03-01', '전남 완도군'),
	('P104', '강감찬', '1979-08-16', '서울시 관악구'),
	('P105', '이순신', '1981-05-23', '부산시 진구');

-- 테이블 studydb.sales 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `year` year NOT NULL,
  `month` tinyint NOT NULL,
  `sale` int NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.sales:~30 rows (대략적) 내보내기
INSERT INTO `sales` (`seq`, `uid`, `year`, `month`, `sale`) VALUES
	(1, 'a101', '2018', 1, 98100),
	(2, 'a102', '2018', 1, 136000),
	(3, 'a103', '2018', 1, 80100),
	(4, 'a104', '2018', 1, 78000),
	(5, 'a105', '2018', 1, 93000),
	(6, 'a101', '2018', 2, 23500),
	(7, 'a102', '2018', 2, 126000),
	(8, 'a103', '2018', 2, 18500),
	(9, 'a105', '2018', 2, 19000),
	(10, 'a106', '2018', 2, 53000),
	(11, 'a101', '2019', 1, 24000),
	(12, 'a102', '2019', 1, 109000),
	(13, 'a103', '2019', 1, 101000),
	(14, 'a104', '2019', 1, 53500),
	(15, 'a107', '2019', 1, 24000),
	(16, 'a102', '2019', 2, 160000),
	(17, 'a103', '2019', 2, 101000),
	(18, 'a104', '2019', 2, 43000),
	(19, 'a105', '2019', 2, 24000),
	(20, 'a106', '2019', 2, 109000),
	(21, 'a102', '2020', 1, 201000),
	(22, 'a104', '2020', 1, 63000),
	(23, 'a105', '2020', 1, 74000),
	(24, 'a106', '2020', 1, 122000),
	(25, 'a107', '2020', 1, 111000),
	(26, 'a102', '2020', 2, 120000),
	(27, 'a103', '2020', 2, 93000),
	(28, 'a104', '2020', 2, 84000),
	(29, 'a105', '2020', 2, 180000),
	(30, 'a108', '2020', 2, 76000);

-- 테이블 studydb.sales2 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales2` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `year` year NOT NULL,
  `month` tinyint NOT NULL,
  `sale` int NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.sales2:~30 rows (대략적) 내보내기
INSERT INTO `sales2` (`seq`, `uid`, `year`, `month`, `sale`) VALUES
	(1, 'a101', '2021', 1, 98100),
	(2, 'a102', '2021', 1, 136000),
	(3, 'a103', '2021', 1, 80100),
	(4, 'a104', '2021', 1, 78000),
	(5, 'a105', '2021', 1, 93000),
	(6, 'a101', '2021', 2, 23500),
	(7, 'a102', '2021', 2, 126000),
	(8, 'a103', '2021', 2, 18500),
	(9, 'a105', '2021', 2, 19000),
	(10, 'a106', '2021', 2, 53000),
	(11, 'a101', '2022', 1, 24000),
	(12, 'a102', '2022', 1, 109000),
	(13, 'a103', '2022', 1, 101000),
	(14, 'a104', '2022', 1, 53500),
	(15, 'a107', '2022', 1, 24000),
	(16, 'a102', '2022', 2, 160000),
	(17, 'a103', '2022', 2, 101000),
	(18, 'a104', '2022', 2, 43000),
	(19, 'a105', '2022', 2, 24000),
	(20, 'a106', '2022', 2, 109000),
	(21, 'a102', '2023', 1, 201000),
	(22, 'a104', '2023', 1, 63000),
	(23, 'a105', '2023', 1, 74000),
	(24, 'a106', '2023', 1, 122000),
	(25, 'a107', '2023', 1, 111000),
	(26, 'a102', '2023', 2, 120000),
	(27, 'a103', '2023', 2, 93000),
	(28, 'a104', '2023', 2, 84000),
	(29, 'a105', '2023', 2, 180000),
	(30, 'a108', '2023', 2, 76000);

-- 테이블 studydb.tblproduct 구조 내보내기
CREATE TABLE IF NOT EXISTS `tblproduct` (
  `prod_no` int DEFAULT NULL,
  `prod_name` varchar(10) DEFAULT NULL,
  `prod_price` int DEFAULT NULL,
  `prod_stock` int DEFAULT NULL,
  `prod_company` varchar(20) DEFAULT NULL,
  `prod_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.tblproduct:~6 rows (대략적) 내보내기
INSERT INTO `tblproduct` (`prod_no`, `prod_name`, `prod_price`, `prod_stock`, `prod_company`, `prod_date`) VALUES
	(1001, '냉장고', 800000, 25, 'LG전자', '2022-01-06'),
	(1002, '노트북', 1200000, 120, '삼성전자', '2022-01-07'),
	(1003, '모니터', 350000, 35, 'LG전자', '2022-01-13'),
	(1004, '세탁기', 1000000, 80, '삼성전자', '2022-01-01'),
	(1005, '컴퓨터', 1500000, 20, '삼성전자', '2022-10-01'),
	(1006, '휴대폰', 950000, 102, '삼성전자', '2024-01-01');

-- 테이블 studydb.tbluser 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbluser` (
  `user_id` varchar(10) DEFAULT NULL,
  `user_name` varchar(10) DEFAULT NULL,
  `user_hp` char(13) DEFAULT NULL,
  `user_age` int DEFAULT NULL,
  `user_addr` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.tbluser:~4 rows (대략적) 내보내기
INSERT INTO `tbluser` (`user_id`, `user_name`, `user_hp`, `user_age`, `user_addr`) VALUES
	('p101', '김유신', '010-1234-1001', 25, '경남 김해시'),
	('p102', '김춘추', '010-1234-1002', 23, '경남 경주시'),
	('p104', '강감찬', NULL, 42, '서울시 중구'),
	('p105', '이순신', '010-1234-1005', 50, '부산시 진구');

-- 테이블 studydb.user1 구조 내보내기
CREATE TABLE IF NOT EXISTS `user1` (
  `uid` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  KEY `idx_user1_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user1:~3 rows (대략적) 내보내기
INSERT INTO `user1` (`uid`, `name`, `birth`, `hp`, `age`) VALUES
	('P101', '김유신', '2024-02-13', '010-1234-0002', 26),
	('a103', '이순신', '2024-01-25', '010-1234-5689', 23),
	('a104', '홍길동', '2024-01-30', '010-1234-5678', 23);

-- 테이블 studydb.user1copy 구조 내보내기
CREATE TABLE IF NOT EXISTS `user1copy` (
  `uid` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user1copy:~1 rows (대략적) 내보내기
INSERT INTO `user1copy` (`uid`, `name`, `birth`, `hp`, `age`) VALUES
	('a102', '김춘추', NULL, '010-1234-2222', 23);

-- 테이블 studydb.user2 구조 내보내기
CREATE TABLE IF NOT EXISTS `user2` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user2:~4 rows (대략적) 내보내기
INSERT INTO `user2` (`uid`, `name`, `birth`, `addr`) VALUES
	('A101', '김유신', '1968-05-09', '경남 김해시'),
	('A102', '김춘추', '1972-11-23', '경남 경주시'),
	('A103', '장보고', '1978-03-01', '전남 완도군'),
	('A105', '테스트', '2024-03-05', '부산시 진구');

-- 테이블 studydb.user3 구조 내보내기
CREATE TABLE IF NOT EXISTS `user3` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user3:~6 rows (대략적) 내보내기
INSERT INTO `user3` (`uid`, `name`, `birth`, `hp`, `addr`) VALUES
	('A101', '김유신', '1968-05-09', '010-1234-1111', '경남 김해시'),
	('A102', '김춘추', '1972-11-23', '010-1234-2222', '경남 경주시'),
	('A103', '장보고', '1978-03-01', '010-1234-3333', '전남 완도군'),
	('A104', '강감찬', '1979-08-16', '010-1234-4444', '서울시 관악구'),
	('A105', '이순신', '1981-05-23', '010-1234-5555', '부산시 진구'),
	('A106', '안중근', '1981-05-23', '010-1234-1000', '부산시 진구');

-- 테이블 studydb.user4 구조 내보내기
CREATE TABLE IF NOT EXISTS `user4` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `age` int DEFAULT '1',
  `hp` char(13) DEFAULT NULL,
  `addr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user4:~7 rows (대략적) 내보내기
INSERT INTO `user4` (`uid`, `name`, `gender`, `age`, `hp`, `addr`) VALUES
	('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시'),
	('A102', '김춘추', 'M', 23, '010-1234-2222', '경남 경주시'),
	('A103', '장보고', 'M', 35, '010-1234-3333', '전남 완도시'),
	('A104', '강감찬', 'M', 42, '010-1234-4444', '서울시 관악구'),
	('A105', '이순신', 'M', 1, '010-1234-5555', '부산시 진구'),
	('A106', '신사임당', 'F', 32, NULL, '강릉시'),
	('A107', '허난설현', 'F', 27, NULL, '경기도 광주시');

-- 테이블 studydb.user5 구조 내보내기
CREATE TABLE IF NOT EXISTS `user5` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `age` int DEFAULT '1',
  `addr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  CONSTRAINT `user5_chk_1` CHECK ((`gender` in (_utf8mb4'M',_utf8mb4'F'))),
  CONSTRAINT `user5_chk_2` CHECK (((`age` > 0) and (`age` < 100)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user5:~6 rows (대략적) 내보내기
INSERT INTO `user5` (`uid`, `name`, `gender`, `age`, `addr`) VALUES
	(1, '김유신', 'M', 25, '경남 김해시'),
	(2, '김춘추', 'M', 23, '경남 경주시'),
	(3, '장보고', 'M', 35, '전남 완도시'),
	(4, '강감찬', 'M', 42, '서울시 관악구'),
	(5, '이순신', 'M', 51, '부산시 진구'),
	(6, '신사임당', 'F', 28, '강릉시');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

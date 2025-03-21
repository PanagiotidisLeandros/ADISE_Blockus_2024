-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for adise24_blokus
DROP DATABASE IF EXISTS `adise24_blokus`;
CREATE DATABASE IF NOT EXISTS `adise24_blokus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `adise24_blokus`;

-- Dumping structure for table adise24_blokus.board
DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `x` tinyint(5) NOT NULL,
  `y` tinyint(5) NOT NULL,
  `cell_status` enum('E','R','B','Y','G') NOT NULL DEFAULT 'E',
  `legal_move` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`x`,`y`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise24_blokus.board: ~36 rows (approximately)
INSERT INTO `board` (`x`, `y`, `cell_status`, `legal_move`) VALUES
	(1, 1, 'Y', NULL),
	(1, 2, 'E', NULL),
	(1, 3, 'E', NULL),
	(1, 4, 'E', NULL),
	(1, 5, 'E', NULL),
	(1, 6, 'R', NULL),
	(2, 1, 'E', NULL),
	(2, 2, 'E', NULL),
	(2, 3, 'E', NULL),
	(2, 4, 'E', NULL),
	(2, 5, 'E', NULL),
	(2, 6, 'E', NULL),
	(3, 1, 'E', NULL),
	(3, 2, 'E', NULL),
	(3, 3, 'E', NULL),
	(3, 4, 'E', NULL),
	(3, 5, 'E', NULL),
	(3, 6, 'E', NULL),
	(4, 1, 'E', NULL),
	(4, 2, 'E', NULL),
	(4, 3, 'E', NULL),
	(4, 4, 'E', NULL),
	(4, 5, 'E', NULL),
	(4, 6, 'E', NULL),
	(5, 1, 'E', NULL),
	(5, 2, 'E', NULL),
	(5, 3, 'E', NULL),
	(5, 4, 'E', NULL),
	(5, 5, 'E', NULL),
	(5, 6, 'E', NULL),
	(6, 1, 'B', NULL),
	(6, 2, 'E', NULL),
	(6, 3, 'E', NULL),
	(6, 4, 'E', NULL),
	(6, 5, 'E', NULL),
	(6, 6, 'G', NULL);

-- Dumping structure for procedure adise24_blokus.clean_board
DROP PROCEDURE IF EXISTS `clean_board`;
DELIMITER //
CREATE PROCEDURE `clean_board`()
BEGIN
	REPLACE INTO board SELECT * FROM clean_board;
END//
DELIMITER ;

-- Dumping structure for table adise24_blokus.clean_board
DROP TABLE IF EXISTS `clean_board`;
CREATE TABLE IF NOT EXISTS `clean_board` (
  `x` tinyint(5) NOT NULL,
  `y` tinyint(5) NOT NULL,
  `cell_status` enum('E','R','B','Y','G') NOT NULL DEFAULT 'E',
  `legal_move` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`x`,`y`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise24_blokus.clean_board: ~36 rows (approximately)
INSERT INTO `clean_board` (`x`, `y`, `cell_status`, `legal_move`) VALUES
	(1, 1, 'Y', NULL),
	(1, 2, 'E', NULL),
	(1, 3, 'E', NULL),
	(1, 4, 'E', NULL),
	(1, 5, 'E', NULL),
	(1, 6, 'R', NULL),
	(2, 1, 'E', NULL),
	(2, 2, 'E', NULL),
	(2, 3, 'E', NULL),
	(2, 4, 'E', NULL),
	(2, 5, 'E', NULL),
	(2, 6, 'E', NULL),
	(3, 1, 'E', NULL),
	(3, 2, 'E', NULL),
	(3, 3, 'E', NULL),
	(3, 4, 'E', NULL),
	(3, 5, 'E', NULL),
	(3, 6, 'E', NULL),
	(4, 1, 'E', NULL),
	(4, 2, 'E', NULL),
	(4, 3, 'E', NULL),
	(4, 4, 'E', NULL),
	(4, 5, 'E', NULL),
	(4, 6, 'E', NULL),
	(5, 1, 'E', NULL),
	(5, 2, 'E', NULL),
	(5, 3, 'E', NULL),
	(5, 4, 'E', NULL),
	(5, 5, 'E', NULL),
	(5, 6, 'E', NULL),
	(6, 1, 'B', NULL),
	(6, 2, 'E', NULL),
	(6, 3, 'E', NULL),
	(6, 4, 'E', NULL),
	(6, 5, 'E', NULL),
	(6, 6, 'G', NULL);

-- Dumping structure for table adise24_blokus.game_status
DROP TABLE IF EXISTS `game_status`;
CREATE TABLE IF NOT EXISTS `game_status` (
  `g_status` enum('not active','initialized one player connected','initialized two players connected','initialized three players connected','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('R','B','Y','G') DEFAULT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`result`)),
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Pieces_Blue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Pieces_Yellow` longtext DEFAULT NULL,
  `Pieces_Red` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Pieces_Red`)),
  `Pieces_Green` longtext DEFAULT NULL,
  `Legal_Moves` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bonus_points` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bonus_points`)),
  `flag_no_moves` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`flag_no_moves`)),
  `score` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`score`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise24_blokus.game_status: ~1 rows (approximately)
INSERT INTO `game_status` (`g_status`, `p_turn`, `result`, `last_change`, `Pieces_Blue`, `Pieces_Yellow`, `Pieces_Red`, `Pieces_Green`, `Legal_Moves`, `bonus_points`, `flag_no_moves`, `score`) VALUES
	('not active', 'G', NULL, '2024-12-25 09:45:28', '{"1":1,"2":1,"3":1,"4":1,"5":1,"6":1,"7":1,"8":1,"9":1,"10":1,"11":1,"12":1,"13":1,"14":1,"15":1,"16":1,"17":1,"18":1,"19":1,"20":1,"21":1}', '{"1":1,"2":1,"3":1,"4":1,"5":1,"6":1,"7":1,"8":1,"9":1,"10":1,"11":1,"12":1,"13":1,"14":1,"15":1,"16":1,"17":1,"18":1,"19":1,"20":1,"21":1}', '{"1":1,"2":1,"3":1,"4":1,"5":1,"6":1,"7":1,"8":1,"9":1,"10":1,"11":1,"12":1,"13":1,"14":1,"15":1,"16":1,"17":1,"18":1,"19":1,"20":1,"21":1}', '{"1":1,"2":1,"3":1,"4":1,"5":1,"6":1,"7":1,"8":1,"9":1,"10":1,"11":1,"12":1,"13":1,"14":1,"15":1,"16":1,"17":1,"18":1,"19":1,"20":1,"21":1}', NULL, '[0, 0, 0, 0]', '[0, 0, 0, 0]', '[0, 0, 0, 0]');

-- Dumping structure for procedure adise24_blokus.get_piece_coordinates
DROP PROCEDURE IF EXISTS `get_piece_coordinates`;
DELIMITER //
CREATE PROCEDURE `get_piece_coordinates`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE p_id INT;
    DECLARE line_1 VARCHAR(5);
    DECLARE line_2 VARCHAR(5);
    DECLARE line_3 VARCHAR(5);
    DECLARE line_4 VARCHAR(5);
    DECLARE line_5 VARCHAR(5);
    DECLARE cur CURSOR FOR 
        SELECT p_id, line_1, line_2, line_3, line_4, line_5 FROM piece;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    -- Loop through all pieces in the piece table
    read_loop: LOOP
        FETCH cur INTO p_id, line_1, line_2, line_3, line_4, line_5;
        
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Create the piece's coordinates based on the filled cells in the grid
        SET @coordinates = '';
        
        -- Check each line (line_1 to line_5)
        SET @x = 0;
        WHILE @x < 5 DO
            SET @y = 0;
            WHILE @y < 5 DO
                IF SUBSTRING(line_1, @y + 1, 1) = '1' THEN
                    SET @coordinates = CONCAT(@coordinates, '[', @x, ',', @y, '],');
                END IF;
                SET @y = @y + 1;
            END WHILE;
            SET @x = @x + 1;
        END WHILE;

        -- Return the result as a list of coordinates for each p_id
        SELECT CONCAT('m', p_id) AS piece_name, TRIM(TRAILING ',' FROM @coordinates) AS coordinates;
    END LOOP;

    CLOSE cur;
END//
DELIMITER ;

-- Dumping structure for procedure adise24_blokus.Is_Cell_Empty
DROP PROCEDURE IF EXISTS `Is_Cell_Empty`;
DELIMITER //
CREATE PROCEDURE `Is_Cell_Empty`(
	IN `x1` TINYINT,
	IN `y1` TINYINT,
	OUT `Is_Cell_Empty` BOOLEAN
)
BEGIN

DECLARE Status_Of_Selected_Cell CHAR(1);

SELECT cell_status
INTO Status_Of_Selected_Cell
FROM board
WHERE x=x1 AND Y=y1;

if Status_Of_Selected_Cell = 'E' then
	SET Is_Cell_Empty = TRUE;
	else
	SET Is_Cell_Empty = FALSE;
END if;	 
		 
END//
DELIMITER ;

-- Dumping structure for procedure adise24_blokus.Is_Cross_Cell_Owned_By_Player
DROP PROCEDURE IF EXISTS `Is_Cross_Cell_Owned_By_Player`;
DELIMITER //
CREATE PROCEDURE `Is_Cross_Cell_Owned_By_Player`(
	IN `x1` TINYINT,
	IN `y1` TINYINT,
	OUT `is_owned_by_player` BOOLEAN
)
BEGIN

DECLARE current_player CHAR(1);
DECLARE right_status CHAR(1);
DECLARE down_status CHAR(1);
DECLARE left_status CHAR(1);
DECLARE up_status CHAR(1);

SELECT p_turn
INTO current_player
FROM game_status;

SELECT cell_status
INTO right_status
FROM board
WHERE x = x1+1 AND y = y1;

SELECT cell_status
INTO down_status
FROM board
WHERE x = x1 AND y = y1-1;

SELECT cell_status
INTO left_status
FROM board
WHERE x = x1-1 AND y = y1;

SELECT cell_status
INTO up_status
FROM board
WHERE x = x1 AND y = y1+1;

if right_status     = current_player  OR
   down_status      = current_player  OR
   left_status      = current_player  OR
   up_status        = current_player  then
	SET is_owned_by_player = TRUE;
	else
	SET is_owned_by_player = FALSE;
	END if;
END//
DELIMITER ;

-- Dumping structure for procedure adise24_blokus.Is_Diagonal_Cell_Owned_By_Player
DROP PROCEDURE IF EXISTS `Is_Diagonal_Cell_Owned_By_Player`;
DELIMITER //
CREATE PROCEDURE `Is_Diagonal_Cell_Owned_By_Player`(
	IN `x1` TINYINT,
	IN `y1` TINYINT,
	OUT `is_owned_by_player` BOOLEAN
)
BEGIN

DECLARE current_player CHAR(1);
DECLARE top_left_status CHAR(1);
DECLARE top_right_status CHAR(1);
DECLARE bottom_left_status CHAR(1);
DECLARE bottom_right_status CHAR(1);

SELECT p_turn
INTO current_player
FROM game_status;

SELECT cell_status
INTO top_left_status
FROM board
WHERE x = x1-1 AND y = y1+1;

SELECT cell_status
INTO top_right_status
FROM board
WHERE x = x1+1 AND y = y1+1;

SELECT cell_status
INTO bottom_left_status
FROM board
WHERE x = x1-1 AND y = y1-1;

SELECT cell_status
INTO bottom_right_status
FROM board
WHERE x = x1+1 AND y = y1-1;

if top_left_status     = current_player  OR
   top_right_status    = current_player  OR
   bottom_left_status  = current_player  OR
   bottom_right_status = current_player  then
	SET is_owned_by_player = TRUE;
	else
	SET is_owned_by_player = FALSE;
	END if;
END//
DELIMITER ;

-- Dumping structure for procedure adise24_blokus.Next_Player
DROP PROCEDURE IF EXISTS `Next_Player`;
DELIMITER //
CREATE PROCEDURE `Next_Player`()
BEGIN

DECLARE Current_Player CHAR(1);
DECLARE Next_Player CHAR(1);

SELECT p_turn
INTO Current_Player
FROM game_status;

if Current_Player='B' THEN 
	SET Next_Player='Y';
ELSEIF Current_Player='Y' THEN
	SET Next_Player='R';
ELSEIF Current_Player='R' THEN
	SET Next_Player='G';
ELSEIF Current_Player='G' THEN
	SET Next_Player='B';	
END if; 			 

UPDATE game_status
SET p_turn = Next_Player;
END//
DELIMITER ;

-- Dumping structure for table adise24_blokus.piece
DROP TABLE IF EXISTS `piece`;
CREATE TABLE IF NOT EXISTS `piece` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `line_1` varchar(50) DEFAULT NULL,
  `line_2` varchar(50) DEFAULT NULL,
  `line_3` varchar(50) DEFAULT NULL,
  `line_4` varchar(50) DEFAULT NULL,
  `line_5` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise24_blokus.piece: ~21 rows (approximately)
INSERT INTO `piece` (`p_id`, `line_1`, `line_2`, `line_3`, `line_4`, `line_5`) VALUES
	(1, '10000', '00000', '00000', '00000', '00000'),
	(2, '11000', '00000', '00000', '00000', '00000'),
	(3, '11100', '00000', '00000', '00000', '00000'),
	(4, '11110', '00000', '00000', '00000', '00000'),
	(5, '11111', '00000', '00000', '00000', '00000'),
	(6, '11000', '10000', '00000', '00000', '00000'),
	(7, '11100', '1000', '00000', '00000', '00000'),
	(8, '10000', '11000', '1000', '00000', '00000'),
	(9, '11100', '100', '00000', '00000', '00000'),
	(10, '11000', '11000', '00000', '00000', '00000'),
	(11, '10000', '11000', '10000', '10000', '00000'),
	(12, '10000', '11100', '100', '00000', '00000'),
	(13, '1000', '11100', '1000', '00000', '00000'),
	(14, '100', '11100', '100', '00000', '00000'),
	(15, '1100', '11000', '10000', '00000', '00000'),
	(16, '1100', '11000', '1000', '00000', '00000'),
	(17, '11110', '10', '00000', '00000', '00000'),
	(18, '11000', '11100', '00000', '00000', '00000'),
	(19, '11100', '100', '100', '00000', '00000'),
	(20, '11100', '10100', '00000', '00000', '00000'),
	(21, '11000', '1110', '00000', '00000', '00000');

-- Dumping structure for table adise24_blokus.pieces
DROP TABLE IF EXISTS `pieces`;
CREATE TABLE IF NOT EXISTS `pieces` (
  `piece_id` int(11) DEFAULT NULL,
  `rotation` int(11) DEFAULT NULL,
  `piece` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`piece`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise24_blokus.pieces: ~84 rows (approximately)
INSERT INTO `pieces` (`piece_id`, `rotation`, `piece`) VALUES
	(1, 0, '[[0,0]]'),
	(2, 0, '[[0,0],[1,0]]'),
	(3, 0, '[[0,0],[1,0],[1,1]]'),
	(4, 0, '[[0,0],[1,0],[2,0]]'),
	(5, 0, '[[0,0],[1,0],[2,0],[3,0]]'),
	(6, 0, '[[0,0],[1,0],[2,0],[2,1]]'),
	(7, 0, '[[0,0],[1,0],[1,-1],[2,-1]]'),
	(8, 0, '[[0,0],[1,0],[0,1],[1,1]]'),
	(9, 0, '[[0,0],[1,0],[1,-1],[2,0]]'),
	(10, 0, '[[0,0],[1,0],[1,-1],[1,1],[2,1]]'),
	(11, 0, '[[0,0],[0,1],[0,2],[0,3],[0,4]]'),
	(12, 0, '[[0,0],[1,0],[0,1],[0,2],[0,3]]'),
	(13, 0, '[[0,0],[1,0],[2,0],[2,1],[3,1]]'),
	(14, 0, '[[0,0],[0,1],[1,1],[0,2],[1,2]]'),
	(15, 0, '[[0,0],[1,0],[2,0],[1,-1],[1,-2]]'),
	(16, 0, '[[0,0],[0,1],[1,0],[2,0],[2,1]]'),
	(17, 0, '[[0,0],[1,0],[2,0],[2,1],[2,2]]'),
	(18, 0, '[[0,0],[1,0],[1,1],[2,1],[2,2]]'),
	(19, 0, '[[0,0],[1,0],[1,1],[2,0],[1,-1]]'),
	(20, 0, '[[0,0],[1,0],[1,1],[1,-1],[1,-2]]'),
	(21, 0, '[[0,0],[1,0],[1,-1],[1,-2],[2,-2]]'),
	(1, 1, '[[0,0]]'),
	(2, 1, '[[0,0],[0,-1]]'),
	(3, 1, '[[0,0],[0,-1],[1,-1]]'),
	(4, 1, '[[0,0],[0,-1],[0,-2]]'),
	(5, 1, '[[0,0],[0,-1],[0,-2],[0,-3]]'),
	(6, 1, '[[0,0],[0,-1],[0,-2],[1,-2]]'),
	(7, 1, '[[0,0],[0,-1],[-1,-1],[-1,-2]]'),
	(8, 1, '[[0,0],[0,-1],[1,0],[1,-1]]'),
	(9, 1, '[[0,0],[0,-1],[-1,-1],[1,-1]]'),
	(10, 1, '[[0,0],[0,-1],[-1,-1],[1,-1],[1,-2]]'),
	(11, 1, '[[0,0],[1,0],[2,0],[3,0],[4,0]]'),
	(12, 1, '[[0,0],[1,0],[2,0],[2,-1],[3,0]]'),
	(13, 1, '[[0,0],[0,-1],[0,-2],[1,-2],[1,-3]]'),
	(14, 1, '[[0,0],[1,0],[1,-1],[2,0],[2,-1]]'),
	(15, 1, '[[0,0],[0,-1],[0,-2],[1,-1],[2,-1]]'),
	(16, 1, '[[0,0],[1,0],[0,-1],[0,-2],[1,-2]]'),
	(17, 1, '[[0,0],[0,-1],[0,-2],[1,-2],[2,-2]]'),
	(18, 1, '[[0,0],[0,-1],[1,-1],[1,-2],[2,-2]]'),
	(19, 1, '[[0,0],[0,-1],[1,-1],[0,-2],[-1,-1]]'),
	(20, 1, '[[0,0],[0,-1],[1,-1],[1,-2],[1,-3]]'),
	(21, 1, '[[0,0],[0,-1],[1,-1],[2,-1],[2,-2]]'),
	(1, 2, '[[0,0]]'),
	(2, 2, '[[0,0],[-1,0]]'),
	(3, 2, '[[0,0],[-1,0],[-1,-1]]'),
	(4, 2, '[[0,0],[-1,0],[-2,0]]'),
	(5, 2, '[[0,0],[-1,0],[-2,0],[-3,0]]'),
	(6, 2, '[[0,0],[-1,0],[-2,0],[-2,-1]]'),
	(7, 2, '[[0,0],[-1,0],[-1,1],[-2,1]]'),
	(8, 2, '[[0,0],[-1,0],[0,-1],[-1,-1]]'),
	(9, 2, '[[0,0],[-1,0],[-1,1],[-2,0]]'),
	(10, 2, '[[0,0],[-1,0],[-1,1],[-1,-1],[-2,-1]]'),
	(11, 2, '[[0,0],[0,-1],[0,-2],[0,-3],[0,-4]]'),
	(12, 2, '[[0,0],[-1,0],[0,-1],[0,-2],[0,-3]]'),
	(13, 2, '[[0,0],[-1,0],[-2,0],[-2,-1],[-3,-1]]'),
	(14, 2, '[[0,0],[0,-1],[-1,-1],[0,-2],[-1,-2]]'),
	(15, 2, '[[0,0],[-1,0],[-2,0],[-1,1],[-1,2]]'),
	(16, 2, '[[0,0],[0,-1],[-1,0],[-2,0],[-2,-1]]'),
	(17, 2, '[[0,0],[-1,0],[-2,0],[-2,-1],[-2,-2]]'),
	(18, 2, '[[0,0],[-1,0],[-1,-1],[-2,-1],[-2,-2]]'),
	(19, 2, '[[0,0],[-1,0],[-1,-1],[-2,0],[-1,1]]'),
	(20, 2, '[[0,0],[-1,0],[-1,-1],[-1,1],[-1,2]]'),
	(21, 2, '[[0,0],[-1,0],[-1,1],[-1,2],[-2,2]]'),
	(1, 3, '[[0,0]]'),
	(2, 3, '[[0,0],[0,1]]'),
	(3, 3, '[[0,0],[0,1],[-1,1]]'),
	(4, 3, '[[0,0],[0,1],[0,2]]'),
	(5, 3, '[[0,0],[0,1],[0,2],[0,3]]'),
	(6, 3, '[[0,0],[0,1],[0,2],[-1,2]]'),
	(7, 3, '[[0,0],[0,1],[-1,1],[-1,2]]'),
	(8, 3, '[[0,0],[0,1],[-1,0],[-1,1]]'),
	(9, 3, '[[0,0],[0,1],[-1,1],[1,0]]'),
	(10, 3, '[[0,0],[0,1],[-1,1],[1,1],[1,2]]'),
	(11, 3, '[[0,0],[-1,0],[-2,0],[-3,0],[-4,0]]'),
	(12, 3, '[[0,0],[0,1],[-1,0],[-2,0],[-3,0]]'),
	(13, 3, '[[0,0],[0,1],[0,2],[-1,2],[-1,3]]'),
	(14, 3, '[[0,0],[-1,0],[-1,1],[-2,0],[-2,1]]'),
	(15, 3, '[[0,0],[0,1],[0,2],[-1,1],[-2,1]]'),
	(16, 3, '[[0,0],[-1,0],[0,1],[0,2],[-1,2]]'),
	(17, 3, '[[0,0],[0,1],[0,2],[-1,2],[-2,2]]'),
	(18, 3, '[[0,0],[0,1],[-1,1],[-1,2],[-2,2]]'),
	(19, 3, '[[0,0],[0,1],[-1,1],[1,0],[-1,0]]'),
	(20, 3, '[[0,0],[0,1],[-1,1],[1,1],[2,1]]'),
	(21, 3, '[[0,0],[0,1],[-1,1],[-2,1],[-2,2]]');

-- Dumping structure for procedure adise24_blokus.place_blokus_piece
DROP PROCEDURE IF EXISTS `place_blokus_piece`;
DELIMITER //
CREATE PROCEDURE `place_blokus_piece`(IN piece JSON, IN base_x INT, IN base_y INT)
BEGIN
    -- Declare variables
    DECLARE x_coord INT;
    DECLARE y_coord INT;
    DECLARE coord_count INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    DECLARE current_player CHAR(1);

    -- Get the current player's symbol
    SELECT p_turn
    INTO current_player
    FROM game_status;

    -- Get the number of coordinates in the JSON array
    SET coord_count = JSON_LENGTH(piece);

    -- Loop through each coordinate in the JSON array
    WHILE i < coord_count DO
        -- Extract x and y coordinates from the JSON array
        SET x_coord = JSON_UNQUOTE(JSON_EXTRACT(piece, CONCAT('$[', i, '][0]')));
        SET y_coord = JSON_UNQUOTE(JSON_EXTRACT(piece, CONCAT('$[', i, '][1]')));

        -- Adjust the coordinates based on the base position
        SET x_coord = x_coord + base_x;
        SET y_coord = y_coord + base_y;

        -- Update the board
        UPDATE board
        SET cell_status = current_player
        WHERE x = x_coord AND y = y_coord;

        -- Increment the loop counter
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

-- Dumping structure for table adise24_blokus.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `username` varchar(50) DEFAULT NULL,
  `piece_color` enum('R','B','Y','G') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`piece_color`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise24_blokus.players: ~4 rows (approximately)
INSERT INTO `players` (`username`, `piece_color`, `token`, `last_action`) VALUES
	(NULL, 'R', '184e136e079827b3acef3766b276b933', NULL),
	(NULL, 'B', 'd0321b604131b12f7c36538def3bc427', NULL),
	(NULL, 'Y', '1b8ed5922ef7d3385e113b865fa9c1af', NULL),
	(NULL, 'G', '4373e1b8ccfe7b8a02a655b157ce39da', NULL);

-- Dumping structure for procedure adise24_blokus.Reset_game_status
DROP PROCEDURE IF EXISTS `Reset_game_status`;
DELIMITER //
CREATE PROCEDURE `Reset_game_status`()
BEGIN
    -- Reset flag_no_moves (array of zeros)
    UPDATE game_status 
    SET flag_no_moves = JSON_ARRAY(0, 0, 0, 0);
    
	 UPDATE game_status 
    SET bonus_points = JSON_ARRAY(0, 0, 0, 0);
    
    UPDATE game_status
    SET score = JSON_ARRAY(0,0,0,0);
    
    UPDATE players SET username = null WHERE piece_color = 'B'; 
    UPDATE players SET username = null WHERE piece_color = 'Y'; 
    UPDATE players SET username = null WHERE piece_color = 'R'; 
    UPDATE players SET username = null WHERE piece_color = 'G'; 
    
    UPDATE game_status SET g_status = 'not active';
    
    UPDATE game_status
    SET Pieces_Red = '{"1":1,"2":1,"3":1,"4":1,"5":1,"6":1,"7":1,"8":1,"9":1,"10":1,"11":1,"12":1,"13":1,"14":1,"15":1,"16":1,"17":1,"18":1,"19":1,"20":1,"21":1}';
	 UPDATE game_status
    SET Pieces_Blue = '{"1":1,"2":1,"3":1,"4":1,"5":1,"6":1,"7":1,"8":1,"9":1,"10":1,"11":1,"12":1,"13":1,"14":1,"15":1,"16":1,"17":1,"18":1,"19":1,"20":1,"21":1}';
    UPDATE game_status
    SET Pieces_Yellow = '{"1":1,"2":1,"3":1,"4":1,"5":1,"6":1,"7":1,"8":1,"9":1,"10":1,"11":1,"12":1,"13":1,"14":1,"15":1,"16":1,"17":1,"18":1,"19":1,"20":1,"21":1}';
    UPDATE game_status
    SET Pieces_Green = '{"1":1,"2":1,"3":1,"4":1,"5":1,"6":1,"7":1,"8":1,"9":1,"10":1,"11":1,"12":1,"13":1,"14":1,"15":1,"16":1,"17":1,"18":1,"19":1,"20":1,"21":1}';
	 UPDATE game_status
	 SET result = NULL;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

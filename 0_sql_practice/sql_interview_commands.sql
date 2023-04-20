-- Modulus of a number
MOD(x,y)

-- Length of a string
LENGTH()

-- Regular Expressions
WHERE city_name REGEXP '^[aeiou]' -- Finds cities starting with vowel

-- Extract last x characters from string, from the right
RIGHT('string', x)
RIGHT('Dylan', 3) --> 'lan'

-- Extract first x characters from string, from the left
LEFT('string', x)
LEFT('Dylan', 3) --> 'Dyl'

-- Rounding
FLOOR(num) -- Round down to lowest int
CEILING(num) -- Round up to the highest int
ROUND(num, x) -- Round to x decimal places
TRUNCATE(num, x) -- Truncates to x decimal places

-- Cast
CAST(120.0 AS SIGNED) -- Cast to signed integer

-- Replacing characters in strings
REPLACE("XYZ FGH XYZ", "X", "M");

-- Manhatten distance
P1(a,b) P2(c,d)
=
ABS(a - c) + (b - d)

-- Exponential and powers
POWER(num, 2) -- Square a number

-- Creating variables
SET @variable_name=1234;

-- Creating row numbers
SELECT *, ROW_NUMBER() OVER (ORDER BY column_name) AS row_num

-- Partitioning over counts
SELECT COUNT(gender) OVER (PARTITION BY gender)

-- Repeat a string
REPEAT('*', 2)

-- Creating a loop
DROP PROCEDURE IF EXISTS my_looper;

DELIMITER $$
CREATE PROCEDURE my_looper(R INT)
BEGIN
    DECLARE x INT;
    SET x = R;
    
    loop_label: LOOP
        IF x < 1 THEN
            LEAVE loop_label;
        END IF;
        
        SELECT CONCAT('*', REPEAT(' *', x - 1));
        
        SET x = x - 1;
    END LOOP;
END $$
DELIMITER ;

CALL my_looper(20);

-- IF THEN ELSE
IF condition1 THEN
   {...statements to execute when condition1 is TRUE...}

[ ELSEIF condition2 THEN
   {...statements to execute when condition1 is FALSE and condition2 is TRUE...} ]

[ ELSE
   {...statements to execute when both condition1 and condition2 are FALSE...} ]

END IF;
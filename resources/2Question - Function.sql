 CREATE FUNCTION initcap( word VARCHAR(255) ) RETURNS VARCHAR(255) 
BEGIN  
  DECLARE firstLetter CHAR(1);  
  DECLARE capitalized VARCHAR(255);  
  DECLARE i INT DEFAULT 1;  
  DECLARE found INT DEFAULT 1;  
  DECLARE exceptions CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';  

  SET capitalized = LCASE( word );  

    WHILE i < LENGTH( word ) DO  
        BEGIN  
        SET firstLetter = SUBSTRING( capitalized, i, 1 );  

        IF LOCATE( firstLetter, exceptions ) > 0 THEN
            BEGIN
            SET found = 1;  
            END;
        ELSEIF found = 1 THEN  
            BEGIN  
            IF firstLetter >= 'a' AND firstLetter <= 'z' THEN  
                BEGIN  
                SET capitalized = CONCAT(LEFT(capitalized,i-1),UCASE(firstLetter),SUBSTRING(capitalized,i+1));  
                SET found = 0;  
                END;  
            ELSEIF firstLetter >= '0' AND firstLetter <= '9' THEN  
                BEGIN
                SET found = 0;  
                END;
            END IF;  
            END;  
        END IF;  

        SET i = i+1;  
        END;  
    END WHILE;  

    RETURN capitalized;  
END ||  
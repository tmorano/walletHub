DROP PROCEDURE IF EXISTS getNames;

DELIMITER ||  

CREATE PROCEDURE getNames(IN p_id INT) 
BEGIN  
    DECLARE v_finished INTEGER DEFAULT 0;
    DECLARE v_found INT DEFAULT 0;  
    DECLARE v_name VARCHAR(50);
    DECLARE v_keep INT DEFAULT 1;
    DECLARE cursor_names CURSOR FOR 
        SELECT NAME 
          FROM sometbl
         WHERE id = p_id;
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;

    DROP TEMPORARY TABLE IF EXISTS sometbl_tmp;
    CREATE TEMPORARY TABLE sometbl_tmp (ID INT, NAME VARCHAR(50));    

    OPEN cursor_names;

    process_names: LOOP
        FETCH cursor_names INTO v_name;

        if v_finished = 1 THEN
            LEAVE process_names;
        END IF;

        WHILE v_keep = 1 DO  
            BEGIN  

            SET v_found = INSTR(v_name, '|');

            IF v_found = 0 THEN
                BEGIN

                INSERT INTO sometbl_tmp
                     VALUES (p_id, v_name);

                SET v_keep = 0;

                END;
            ELSE 
                BEGIN

                INSERT INTO sometbl_tmp
                     VALUES (p_id, SUBSTRING(v_name, 1, v_found - 1));

                SET v_name = SUBSTRING(v_name, v_found + 1);

                END;
            END IF;
            END;  
        END WHILE;  
    END LOOP;

    SELECT *
      FROM sometbl_tmp
     WHERE id = p_id;

    DROP TEMPORARY TABLE IF EXISTS sometbl_tmp;

END ||  

DELIMITER ; 
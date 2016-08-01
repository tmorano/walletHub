    CREATE TABLE bugs (id INT, open_date DATE, close_date DATE, severity VARCHAR(10));
INSERT INTO bugs
    VALUES  (1, '2016-09-30', '2016-10-17', 'low'),
        	(1, '2016-06-10', '2016-09-09', 'moderate'),
            (1, '2016-02-23', '2016-11-14', 'low'),
       	 	(1, '2016-03-11', '2016-04-20', 'normal'),
            (1, '2016-03-05', '2016-05-12', 'high');
               
     SET @startDate  = '2015-06-01';            
     SET @endDate    = '2015-12-02';

SELECT open_date, count(1) as openBugs
  FROM bugs
  WHERE open_date >= @startDate
    AND open_date <= @endDate
    AND close_date <= @endDate
  GROUP BY open_date;
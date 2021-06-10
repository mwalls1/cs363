UPDATE students
	SET name = "Scott"
	WHERE ssn = 746897816;
    
UPDATE major /*change name and level of registered major from given ssn, need a nested query*/
	SET name = "Computer Science", level = "MS"
    WHERE snum = (SELECT s.snum
					FROM students s
					WHERE s.ssn = 746897816);
                    
DELETE /*Had to change some settings for this one, delete can be dangerous*/
	FROM register
    WHERE regtime = "Spring2021";

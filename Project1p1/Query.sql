SELECT s.snum, s.ssn FROM students s /*Just need to search students*/
	WHERE name = "Becky";

SELECT m.name, m.level /*Need to check students for specific user's snum*/
	FROM major m
	JOIN students s on m.snum = s.snum
	WHERE s.ssn = 123097834;
    
SELECT c.name /*Need to link department code with department name*/
	FROM courses c
    JOIN departments d on c.department_code = d.code
    WHERE d.name = "Computer Science";

SELECT d.name, d.level /*Need to link department code with departmnent name*/
	FROM degrees d
    JOIN departments f on d.department_code = f.code
    WHERE f.name = "Computer Science";

SELECT s.name /*Print all students that apprear in the minor list*/
	FROM students s
    JOIN minor m on s.snum = m.snum;
    
SELECT COUNT(*) /*Simply count number of entries in minor*/
	FROM minor;

SELECT s.name, s.snum/*Joining three tables to link course name to course number to student number*/
	FROM students s
    JOIN register r on s.snum = r.snum
	JOIN courses c on r.course_number = c.number
    WHERE c.name = "Algorithm"; 

SELECT s.name, s.snum/*This one was tricky. Need to find MIN dob, then use that to search students table for name and snum*/
	FROM students s
    WHERE s.dob = (
					SELECT MIN(d.dob)
						FROM students d);
                        
SELECT s.name, s.snum/*Same as previous but MAX*/
	FROM students s
    WHERE s.dob = (
					SELECT MAX(d.dob)
						FROM students d);
                        
SELECT s.name, s.snum, s.ssn/*Using LIKE to check for patterns*/
	FROM students s
    WHERE s.name LIKE '%N%' or s.name LIKE '%n%';
    
SELECT s.name, s.snum, s.ssn/*Same as previous*/
	FROM students s
    WHERE s.name NOT LIKE '%N%' or s.name NOT LIKE '%n%';
    
SELECT c.number, c.name, COUNT(r.snum)/*Create a table that is all courses combined with matching records from register table, count student num per cours*/
	FROM courses c
    LEFT OUTER JOIN register r on c.number = r.course_number
    GROUP BY c.number;
    
SELECT s.name /*Link snum to register table to see regtime*/
	FROM students s
    JOIN register r on s.snum = r.snum
    WHERE r.regtime = "Fall2020";
    
SELECT c.number, c.name /*This is the same as a previous quesry, but printing course name and number now*/
	FROM courses c
    JOIN departments d on c.department_code = d.code
    WHERE d.name = "Computer Science";
    
SELECT c.number, c.name /*Using OR to find classes in both departments*/
	FROM courses c
    JOIN departments d on c.department_code = d.code
    WHERE d.name = "Computer Science" or d.name = "Landscape Architect";
    

    

    

	
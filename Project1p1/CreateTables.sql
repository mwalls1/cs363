CREATE TABLE students(
	snum int,
    ssn int,
    name varchar(10),
    gender varchar(1),
    dob datetime,
    c_addr varchar(20),
    c_phone varchar(10),
    p_addr varchar(20),
    p_phone varchar(10),
    PRIMARY KEY(ssn),
    UNIQUE(snum)
);
CREATE TABLE departments(
	code int,
    name varchar(50),
    phone varchar(10),
    college varchar(20),
    PRIMARY KEY(code),
    UNIQUE(name)
);
CREATE TABLE degrees(
	name varchar(50),
    level varchar(5),
    department_code int,
    PRIMARY KEY(name, level),
    FOREIGN KEY(department_code) REFERENCES departments(code)
);
CREATE TABLE courses(
	number integer,
    name varchar(50),
    description varchar(50),
    credithours integer,
    level varchar(20),
    department_code integer,
    PRIMARY KEY(number),
    UNIQUE(name),
    FOREIGN KEY(department_code) REFERENCES departments(code)
);
CREATE TABLE register(
	snum integer,
    course_number integer,
    regtime varchar(20),
    grade integer,
    PRIMARY KEY(snum, course_number),
    FOREIGN KEY(snum) REFERENCES students(snum),
    FOREIGN KEY(course_number) REFERENCES courses(number)
);
CREATE TABLE major(
	snum integer,
    name varchar(50),
    level varchar(5),
    PRIMARY KEY(snum, name, level),
    FOREIGN KEY(snum) REFERENCES students(snum),
    FOREIGN KEY(name) REFERENCES degrees(name)
);
CREATE TABLE minor(
	snum integer,
    name varchar(50),
    level varchar(5),
    PRIMARY KEY(snum, name, level),
    FOREIGN KEY(snum) REFERENCES students(snum),
    FOREIGN KEY(name) REFERENCES degrees(name)
);
    
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/user.csv'
INTO TABLE TwitterUser
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(screen_name,userName,sub_category,category,state,numFollowers,numFollowing);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/tweets.csv'
INTO TABLE tweets
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid,textbody,retweet_count,retweeted,@col5,posting_user)
set day_posted = day(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')),
month_posted = month(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')),
year_posted = year(str_to_date(@col5, '%Y-%m-%d %H:%i:%s'));

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/mentioned.csv'
INTO TABLE mentioned
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid,screen_name);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/tagged.csv'
INTO TABLE tagged
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid, hastagname);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/urlused.csv'
INTO TABLE urlused
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid,url);




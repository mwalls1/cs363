CREATE TABLE TwitterUser(
	screen_name varchar(50) NOT NULL,
    userName varchar(50),
    sub_category varchar(50),
    category varchar(50),
    state varchar(50),
    numFollowers int,
    numFollowing int,
    PRIMARY KEY(screen_name)
);

CREATE TABLE tweets(
	tid bigint NOT NULL,
    textbody text,
    retweet_count int DEFAULT NULL,
    retweeted int DEFAULT NULL,
    day_posted int,
    month_posted int,
    year_posted int,
    posting_user varchar(50),
    PRIMARY KEY(tid),
    FOREIGN KEY(posting_user) REFERENCES TwitterUser(screen_name)
);

CREATE TABLE mentioned(
	tid bigint,
    screen_name varchar(50),
    FOREIGN KEY(tid) references tweets(tid),
    FOREIGN KEY(screen_name) references TwitterUser(screen_name)
);

CREATE TABLE tagged(
	tid bigint,
    hastagname varchar(50),
    FOREIGN KEY(tid) REFERENCES tweets(tid)
);

CREATE TABLE urlused(
	tid bigint,
    url varchar(500),
    FOREIGN KEY(tid) REFERENCES tweets(tid)
);



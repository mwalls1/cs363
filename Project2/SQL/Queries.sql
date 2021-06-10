/*Query 1*/
SELECT t.retweet_count AS num_retweets, t.textbody AS tweet_text, u.screen_name, u.category, u.sub_category AS subcategory
FROM tweets t
JOIN TwitterUser u on t.posting_user = u.screen_name
WHERE t.month_posted = 1 AND t.year_posted = 2016
ORDER BY retweet_count 
DESC LIMIT 5;

/*Query 2*/
SELECT COUNT(DISTINCT u.state) AS statenum, group_concat(DISTINCT u.state) AS states, h.hastagname AS hashtag_text
FROM tagged h
INNER JOIN tweets t on h.tid = t.tid
JOIN twitteruser u on t.posting_user = u.screen_name
WHERE u.state != "na"
GROUP BY h.hastagname
ORDER BY COUNT(DISTINCT u.state) DESC
LIMIT 5;


/*Query 3*/
SELECT DISTINCT u.screen_name, u.state
FROM twitteruser u
JOIN tweets t on u.screen_name = t.posting_user
JOIN tagged h on t.tid = h.tid
WHERE h.hastagname = "HappyNewYear" OR h.hastagname = "NewYear" OR h.hastagname = "NewYears" OR h.hastagname = "NewYearsDay"
ORDER BY u.numFollowers
DESC LIMIT 12;

/*Query 4*/
SELECT u.screen_name, u.sub_category AS subcategory, u.numFollowers
FROM twitteruser u
WHERE u.sub_category = "GOP"
ORDER BY u.numFollowers
DESC LIMIT 5;
/*Query 4*/
SELECT u.screen_name, u.sub_category AS sub_category, u.numFollowers
FROM twitteruser u
WHERE u.sub_category = "DEMOCRAT"
ORDER BY u.numFollowers
DESC LIMIT 5;

/*Query 5*/
SELECT h.hastagname AS hashtag_text, group_concat(DISTINCT u.state) AS states
FROM tagged h
INNER JOIN tweets t on h.tid = t.tid
JOIN twitteruser u on t.posting_user = u.screen_name
WHERE t.month_posted = 1 AND t.year_posted = 2016 AND (u.state = "OHIO" OR u.state = "ALASKA" OR u.state = "Alabama")
GROUP BY h.hastagname;


/*Query 6*/
SELECT t.textBody AS tweet_text, h.hastagname AS hashtag_text, u.screen_name, u.sub_category AS subcategory
FROM twitteruser u
JOIN tweets t on u.screen_name = t.posting_user
JOIN tagged h on t.tid = h.tid
WHERE h.hastagname = "Ohio" AND (u.sub_category = "GOP" OR u.sub_category = "Democrat") AND u.state = "Ohio" AND t.month_posted = 1 AND t.year_posted = 2016
LIMIT 5;

/*Query 7*/
SELECT u.screen_name, u.state, group_concat(DISTINCT l.url) AS URLs
FROM twitteruser u
JOIN tweets t on u.screen_name = t.posting_user
JOIN urlused l on t.tid = l.tid
WHERE u.sub_category = "GOP" AND t.month_posted = 1 AND t.year_posted = 2016
group by u.screen_name;

/*Query 8*/
SELECT m.screen_name AS mentionedUser, r.state AS mentionedUserState, group_concat(DISTINCT u.screen_name) AS postingUser
FROM mentioned m
INNER JOIN tweets t on m.tid = t.tid
JOIN twitteruser u on t.posting_user = u.screen_name
JOIN twitteruser r on m.screen_name = r.screen_name
WHERE u.sub_category = "GOP" AND t.month_posted = 1 AND t.year_posted = 2016
GROUP BY m.screen_name
ORDER BY COUNT(m.screen_name) DESC
LIMIT 5;


/*Query 9*/
SELECT h.hastagname AS hashtag_text, count(*) AS num_uses
FROM tagged h
INNER JOIN tweets t on h.tid = t.tid
JOIN twitteruser u on t.posting_user = u.screen_name
WHERE (t.month_posted BETWEEN 1 AND 3) AND t.year_posted = 2016 AND u.sub_category = "GOP"
GROUP BY h.hastagname
ORDER BY count(*) DESC
LIMIT 5;

 






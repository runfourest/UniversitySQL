/* The below is SQL queries from the original 
moodle schema. We will be taking the queries and inserting them into new tables that we have created*/

/* BASE TABLES - These are the tables that are used in the below queries join criteria 

OVERVIEW OF TABLES: 
mdl_user - Included below
mdl_role_assignments- Included below
mdl_context - Included below
mdl_course - Included below
mdl_role - Included below
mdl_grade_grades -Included below
mdl_grade_items -included below
mdl_forum_posts -included below
mdl_forum_discussions-Included below
mdl_forum - Included below
mdl_user_enrolments - Included below
mdl_enrol - Included below

** Please disregard datatype and syntax variations between tables. If there are datatype mismatches (Int joining to BIGINT for example).















*/

/*

mdl_context

"id" BIGINT(10),
"contextlevel" BIGINT(10),
"instanceid" BIGINT(10),
"path" VARCHAR(10)

**PURPOSE OF TABLE IS TO SHOW CONTEXT WITHIN MOODLE. See docs for more information on context levels.






mdl_role_assignments

"roleid" BIGINT(10),
"contextid" BIGINT(10),
"userid" BIGINT(10),
"modifierid" BIGINT(10),
"itemid" BIGINT(10)

**PURPOSE OF THIS TABLE IS TO SHOW DIFFERENT ROLES IN MOODLE SYSTEM (Like Teachers or Students)




mdl_role


"id" BIGINT(10),
"name" VARCHAR(255),
"shortname" VARCHAR(255)






mdl_course

"id" BIGINT(10),
"category" BIGINT(10),
"sortorder" BIGINT(10),
"fullname" VARCHAR(255),
"idnumber" VARCHAR(100),
"summary" LONGTEXT,
"shortname" VARCHAR(255),
"idnumber" VARCHAR(255),
"startdate" DATETIME,
"enddate" DATETIME,
"showgrades" TINYINT,
"theme" VARCHAR(26),
"timecreated" DATETIME,
"TIMEMODIFIED" DATETIME,
"visible" TINYINT

**PURPOSE OF TABLE IS TO SHOW COURSES


/*


/*


mdl_grade_grades

"id" BIGINT(10),
"itemid" BIGINT(10),
"userid" BIGINT(10),
"rawgrade" DECIMAL(10,5),
"rawgrademin" DECIMAL(10,5),
"finalgrade" DECIMAL(10,5),
"exported" BIGINT(10),
"aggregationstatus" VARCHAR(10)
"aggregationweight" DECIMAL(10,5)

**PURPOSE OF TABLE IS TO DISPLAY STUDENT GRADES


/*
mdl_forum

"id" bigint(10),
"course" bigint(10),
"type" Varchar(50),
"name" varchar(255),
"intro" LONGTEXT,
"introformat" SMALLINT(5),
"assessed" BIGINT(10),
"assesstimestart" BIGINT(10),
"assesstimefinish BIGINT(10),
"scale" BIGINT(10),
"completiondiscussion" INT,
"completionreplies" INT,
"completionposts" INT,
displaywordcount TINYINT(1),
lockdiscussionafter BIGINT(10)

**PURPOSE OF TABLE IS TO SHOW FORUM OVERVIEW OF STUDENTS

/*
forum_discussions

"id" BIGINT,
"course" BIGINT,
"fourm" BIGINT,
"name" VARCHAR(255),
"firstpost" BIGINT(10),
"userid" BIGINT(10),
"groupid" BIGINT(10),
"assessed" TINYINT,
"timemodified" BIGINT(10),
"usermodified" BIGINT(10),
"timestart" BIGINT(10),
"timeend" BIGINT(10)

**PURPOSE OF TABLE IS TO SHOW FORUM DISCUSSIONS OF STUDENTS



/*
forum_posts

"id" BIGINT(10),
"discussion" BIGINT(10),
"parent" BIGINT(10),
"userid" BIGINT(10),
"created" BIGINT(10),
"modified" BIGINT(10),
"mailed" TINYINT(2),
"message" LONGTEXT,
"messageformat" TINYINT(2),
"attachment" VARCHAR(100),
"totalscore" SMALLINT(4)

**PURPOSE OF TABLE IS TO SHOW INDIVIDUAL POSTS OF STUDENTS IN FORUM







/*
mdl_user


"id" BIGINT NOT NULL,
"auth" NVARCHAR(20) NOT NULL,
"confirmed" SMALLINT NOT NULL,
"policyagreed" SMALLINT NOT NULL,
"deleted" SMALLINT NOT NULL,
"suspended" SMALLINT NOT NULL,
"mnethostid" BIGINT NOT NULL,
"username" NVARCHAR(100) NOT NULL,
"password" NVARCHAR(32) NOT NULL,
"idnumber" NVARCHAR(255) NOT NULL,
"firstname" NVARCHAR(100) NOT NULL,
"lastname" NVARCHAR(100) NOT NULL,
"email" NVARCHAR(100) NOT NULL,
"emailstop" SMALLINT NOT NULL,
"icq" NVARCHAR(15) NOT NULL,
"skype" NVARCHAR(50) NOT NULL,
"yahoo" NVARCHAR(50) NOT NULL,
"aim" NVARCHAR(50) NOT NULL,
"msn" NVARCHAR(50) NOT NULL,
"phone1" NVARCHAR(20) NOT NULL,
"phone2" NVARCHAR(20) NOT NULL,
"institution" NVARCHAR(40) NOT NULL,
"department" NVARCHAR(30) NOT NULL,
"address" NVARCHAR(70) NOT NULL,
"city" NVARCHAR(120) NOT NULL,
"country" NVARCHAR(2) NOT NULL,
"lang" NVARCHAR(30) NOT NULL,
"theme" NVARCHAR(50) NOT NULL,
"timezone" NVARCHAR(100) NOT NULL,
"firstaccess" BIGINT NOT NULL,
"lastaccess" BIGINT NOT NULL,
"lastlogin" BIGINT NOT NULL,
"currentlogin" BIGINT NOT NULL,
"lastip" NVARCHAR(45) NOT NULL,
"secret" NVARCHAR(15) NOT NULL,
"picture" BIGINT NOT NULL,
"url" NVARCHAR(255) NOT NULL,
"description" NVARCHAR(-1) NULL,
"descriptionformat" SMALLINT NOT NULL,
"mailformat" SMALLINT NOT NULL,
"maildigest" SMALLINT NOT NULL,
"maildisplay" SMALLINT NOT NULL,
"htmleditor" SMALLINT NOT NULL,
"autosubscribe" SMALLINT NOT NULL,
"trackforums" SMALLINT NOT NULL,
"timecreated" BIGINT NOT NULL,
"timemodified" BIGINT NOT NULL,
"trustbitmask" BIGINT NOT NULL,
"imagealt" NVARCHAR(255) NULL,
"screenreader" SMALLINT NOT NULL 

** PURPOSE OF TABLE IS TO SHOW ALL USERS IN MOODLE SYSTEM. THIS INCLUDES MORE THEN JUST STUDENTS
*/


/*

mdl_user_enrolments

"id" BIGINT NOT NULL,
"status" BIGINT NOT NULL,
"enrolid" BIGINT NOT NULL,
"userid" BIGINT NOT NULL,
"timestart" BIGINT NOT NULL,
"timeend" BIGINT NOT NULL,
"modifierid" BIGINT NOT NULL,
"timecreated" BIGINT NOT NULL,
"timemodified" BIGINT NOT NULL 

**PURPOSE OF TABLE IS TO SHOW ENROLMENTS OF STUDENTS

*/


/*
mdl_grade_items

"id BIGINT(10) NOT NULL"
"courseid BIGINT(10) NOT NULL"
"categoryid BIGINT(10) NOT NULL"
"itemname VARCHAR(255)"
"itemtype VARCHAR(255)"
"itemmodule VARCHAR(255)"
"iteminstance VARCHAR(255)"
"itemnumber BIGINT(10)"
"iteminfo VARCHAR(255)"
"idnumber VARCHAR(255)"
"calculation MEDIUMTEXT"
"gradetype SMALLINT(4)"
"grademax DECIMAL(10,5)"
"grademin DECIMAL(10,5)"
"scaleid BIGINT(10)"
"outcomeid BIGINT(10)"
"gradepass DECIMAL(10,5)"
"multfactor DECIMAL(10,5)"
"plusfactor DECIMAL(10,5)"

**PURPOSE OF TABLE IS TO SHOW GRADED ITEMS WITHIN MOODLE (LIKE QUIZES FOR EXAMPLE

mdl_user_enrolments

"id int(10)"
"status int(10)"
"enrolid int(10)"
"userid int(10)"
"timestart datetime"
timeend datetime"
timemodified datetime" 







CREATE TABLE IF NOT EXISTS STUDENTGRADING  (
  student_first_name VARCHAR(255),
  student_last_name VARCHAR(255),
  student_id INT NOT NULL, 
  school VARCHAR(255),
  coursename VARCHAR(255),
  finalgrade FLOAT,
  last_login DATETIME
 ) ENGINE = INNODB;
 

  CREATE TABLE IF NOT EXISTS FORUMPOSTS (
   forum_id INT NOT NULL,
   student_first_name VARCHAR(255),
   student_last_name VARCHAR(255),
   course_id INT,
   forum_name VARCHAR(255),
   discussion_name VARCHAR(255),
   date_of_post_creation DATE,
   time_of_post_creation TIME,
   post_modified_date DATE,
   post_modified_time TIME,
   post_subject VARCHAR(255),
   post_message LONGTEXT
  ENGINE=INNODB);
   
   
   
   
   
   
 
   
  
  
 
  








/*Original Base Queries */

SELECT
 u.firstname AS first,
 u.lastname AS last,
 u.idnumber AS ID,
 u.institution AS School,
 c.shortname AS coursefullname,
 COALESCE(ROUND(gg.finalgrade,0),0) as finalgrade,
CASE
WHEN DATEDIFF (NOW(), FROM_UNIXTIME(u.lastaccess))>200
THEN "never started"
ELSE
CONCAT (DATEDIFF (NOW(), FROM_UNIXTIME(u.lastaccess)), " ", "days")
END AS last_logged_in

FROM prefix_user u
INNER JOIN prefix_role_assignments ra ON ra.userid = u.id
INNER JOIN prefix_context ct ON ct.id = ra.contextid
INNER JOIN prefix_course c ON c.id = ct.instanceid
INNER JOIN prefix_role r ON r.id = ra.roleid
LEFT JOIN
(
SELECT
  u.id AS userid,c.id as courseid,
  g.finalgrade AS finalgrade
  FROM prefix_user u
  JOIN prefix_grade_grades g ON g.userid = u.id
  JOIN prefix_grade_items gi ON g.itemid =  gi.id
  JOIN prefix_course c ON c.id = gi.courseid where gi.itemtype = 'course'
) gg ON gg.userid = u.id and gg.courseid = c.id

WHERE r.id = 5 


/*Lists the name of every student enrolled, their course name, their grade and number of days since last login. THE BEST PART! It shows even students that have not started the course yet and gives them a zero. */







  SELECT fp.id, 
           usr.id AS UserID, 
           usr.firstname,
           usr.lastname, 
           c.id AS CourseID, 
           c.fullname AS CourseFullName, 
           f.name as ForumName, 
           fd.name AS DiscussionName,
           from_unixtime(fp.created, "%m/%d/%Y") AS DateofPost,
           from_unixtime(fp.created, "%H:%i.%s") AS TimeofPost,  
           from_unixtime(fp.modified, "%m/%d/%Y") AS PostModifiedDate,
           from_unixtime(fp.modified, "%H:%i.%s") AS PostModifiedTime,
           fp.subject, 
           fp.message
      FROM mdl_forum_posts fp
INNER JOIN mdl_forum_discussions fd ON fp.discussion = fd.id
INNER JOIN mdl_forum f ON f.id = fd.forum
INNER JOIN mdl_course c ON f.course = c.id 
INNER JOIN mdl_user usr ON fp.userid = usr.id
     WHERE EXISTS (SELECT 1 
                     FROM mdl_user_enrolments ue
               INNER JOIN mdl_enrol e ON ue.enrolid = e.id 
                    WHERE usr.id = ue.userid 
                      AND e.courseid = f.course)
     AND c.id = 528
ORDER BY Discussionname, Dateofpost, Timeofpost


/*all forum posts in a specific course with discussion names*/



                  
                  
                  
                  
 /* Inserting Queries into newly created Tables */
                  
                  
                  
INSERT INTO STUDENTGRADING (
   student_first_name ,
  student_last_name ,
  student_id , 
  school ,
  coursename ,
  finalgrade ,
  last_login)

SELECT
 u.firstname AS first,
 u.lastname AS last,
 u.idnumber AS ID,
 u.institution AS School,
 c.shortname AS coursefullname,
 COALESCE(ROUND(gg.finalgrade,0),0) as finalgrade,
CASE
WHEN DATEDIFF (NOW(), FROM_UNIXTIME(u.lastaccess))>200
THEN "never started"
ELSE
CONCAT (DATEDIFF (NOW(), FROM_UNIXTIME(u.lastaccess)), " ", "days")
END AS last_logged_in

FROM prefix_user u
INNER JOIN prefix_role_assignments ra ON ra.userid = u.id
INNER JOIN prefix_context ct ON ct.id = ra.contextid
INNER JOIN prefix_course c ON c.id = ct.instanceid
INNER JOIN prefix_role r ON r.id = ra.roleid
LEFT JOIN
(
SELECT
  u.id AS userid,c.id as courseid,
  g.finalgrade AS finalgrade
  FROM prefix_user u
  JOIN prefix_grade_grades g ON g.userid = u.id
  JOIN prefix_grade_items gi ON g.itemid =  gi.id
  JOIN prefix_course c ON c.id = gi.courseid where gi.itemtype = 'course'
) gg ON gg.userid = u.id and gg.courseid = c.id

WHERE r.id =  5
                  
                  
                  
                  
INSERT INTO FORUMPOSTS (
 
   forum_id ,
   student_first_name,
   student_last_name ,
   course_id ,
   forum_name ,
   discussion_name ,
   date_of_post_creation,
   time_of_post_creation ,
   post_modified_date ,
   post_modified_time ,
   post_subject ,
   post_message)
                  
                  
                  
  SELECT fp.id, 
           usr.id AS UserID, 
           usr.firstname,
           usr.lastname, 
           c.id AS CourseID, 
           c.fullname AS CourseFullName, 
           f.name as ForumName, 
           fd.name AS DiscussionName,
           from_unixtime(fp.created, "%m/%d/%Y") AS DateofPost,
           from_unixtime(fp.created, "%H:%i.%s") AS TimeofPost,  
           from_unixtime(fp.modified, "%m/%d/%Y") AS PostModifiedDate,
           from_unixtime(fp.modified, "%H:%i.%s") AS PostModifiedTime,
           fp.subject, 
           fp.message
      FROM mdl_forum_posts fp
INNER JOIN mdl_forum_discussions fd ON fp.discussion = fd.id
INNER JOIN mdl_forum f ON f.id = fd.forum
INNER JOIN mdl_course c ON f.course = c.id 
INNER JOIN mdl_user usr ON fp.userid = usr.id
     WHERE EXISTS (SELECT 1 
                     FROM mdl_user_enrolments ue
               INNER JOIN mdl_enrol e ON ue.enrolid = e.id 
                    WHERE usr.id = ue.userid 
                      AND e.courseid = f.course)
     AND c.id = 528
ORDER BY Discussionname, Dateofpost, Timeofpost
                  
                  

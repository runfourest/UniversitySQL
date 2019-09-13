
SELECT COUNT(*), c.fullname AS Course
FROM mdl_course_modules cm
JOIN mdl_course c ON c.id = cm.course
JOIN mdl_modules m ON m.id = cm.module
WHERE m.id = 13
GROUP BY c.id
HAVING COUNT(m.`id`) = 0;

/*Empty courses within a certain category*/



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



USE OES_TESTING
GO

declare @user_id int
SET @user_id = 2
select	
		COURSES.LOGO_LOCATION,
		COURSES.COURSE_NAME
		/*TEST_DETAILS.TEST_DETAIL_ID,
		USER_TEST_DETAILS.MARKS_RECEIVED,
		EVAL.EVALUATION_TYPE_NAME
		case 
			when exists (select USER_ID, COURSE_ID from STUDENT_COURSE_DETAILS 
			where user_id = @user_id and course_id = test_details.COURSE_ID )
			then 'yes'
			else 'no'
			end as 'IS_MODULAR', 
		case 
			when USER_TEST_DETAILS.MARKS_RECEIVED >=0
			then 'yes'
			ELSE 'no'
			END AS 'ATTEMPT'*/
	FROM USER_TEST_DETAILS
	JOIN TEST_DETAILS
	ON USER_TEST_DETAILS.TEST_DETAIL_ID = TEST_DETAILS.TEST_DETAIL_ID
		JOIN COURSES
		ON TEST_DETAILS.COURSE_ID = COURSES.COURSE_ID
			JOIN EVALUATION_TYPE EVAL
			ON COURSES.COURSE_ID = EVAL.EVALUATION_TYPE_ID
WHERE USER_TEST_DETAILS.USER_ID = @user_id
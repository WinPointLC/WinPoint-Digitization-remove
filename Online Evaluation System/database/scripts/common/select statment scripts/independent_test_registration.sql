USE OES_TESTING
GO

declare @course_id int
declare @user_id int

SELECT 
		UTD.USER_ID,
		CRS.COURSE_NAME,
		EVAL.EVALUATION_TYPE_NAME,
		TD.TEST_DETAIL_ID, 
		TD.TEST_FEES,
		UTD.FEE_STATUS,
		UTD.MARKS_RECEIVED
		FROM
		COURSES CRS JOIN EVALUATION_TYPE EVAL
		ON EVAL.EVALUATION_TYPE_ID =  CRS.EVALUATION_TYPE_ID
			JOIN TEST_DETAILS TD
			ON CRS.COURSE_ID = TD.COURSE_ID
				JOIN USER_TEST_DETAILS UTD
				ON TD.TEST_DETAIL_ID = UTD.TEST_DETAIL_ID
WHERE UTD.USER_ID = @user_id AND CRS.COURSE_ID = @course_id 
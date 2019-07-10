USE MASTER
GO
CREATE DATABASE OES_TESTING
GO
USE OES_TESTING
GO
CREATE TABLE CLIENT_CATEGORY(
	CLIENT_CATEGORY_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_CLIENT_CATEGORY_ID_PK PRIMARY KEY,
	CLIENT_CATEGORY_NAME VARCHAR(20),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE SECURITY_QUESTIONS(
	SECURITY_QUESTION_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_SECURITY_QUESTION_ID_PK PRIMARY KEY,
	SECURITY_QUESTION VARCHAR(50),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE USER_CATEGORY(
	USER_CATEGORY_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_USER_CATEGORY_ID_PK PRIMARY KEY,
	USER_CATEGORY_NAME VARCHAR(10),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)
CREATE TABLE EMPLOYEE_CATEGORY(
	EMPLOYEE_CATEGORY_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_EMPLOYEE_CATEGORY_ID_PK PRIMARY KEY,
	EMPLOYEE_CATEGORY_NAME VARCHAR(30),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE USER_PROFILE(
	USERID INT IDENTITY(1,1) CONSTRAINT OES_USER_ID_PK PRIMARY KEY,
	FIRST_NAME VARCHAR(20),
	LAST_NAME VARCHAR(20),
	EMAIL VARCHAR(100),
	MOBILE_NUMBER VARCHAR(15),
	ADDRESS VARCHAR(200) CONSTRAINT OES_USER_PROFILE_ADDRESS_MAX_200_CHAR DEFAULT ' ',
	BIRTHDATE DATE,
	COLLEGE VARCHAR(50),
	DEGREE VARCHAR(10),
	BRANCH VARCHAR(50),
	YEAR_OF_GRADUATION DATE,
	PHOTO IMAGE,
	PASSWORD VARCHAR(32) CONSTRAINT OES_USER_PROFILE_PASSWORD_MAX_32_CHAR NOT NULL,
	SECURITY_QUESTION_ID TINYINT FOREIGN KEY REFERENCES SECURITY_QUESTIONS(SECURITY_QUESTION_ID),
	SECURITY_ANSWER VARCHAR(20),
	USER_CATEGORY_ID TINYINT FOREIGN KEY REFERENCES USER_CATEGORY(USER_CATEGORY_ID),
	OCCUPATION VARCHAR(20),
	ORGANIZATION VARCHAR(100),
	DESIGNATION VARCHAR(20),
	DOMAIN VARCHAR(20),
	ROLE VARCHAR(20),
	EXPERIENCE TINYINT,
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE EVALUATION_TYPE(
	EVALUATION_TYPE_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_EVAL_TYPE_ID_PK PRIMARY KEY,
	EVALUATION_TYPE_NAME VARCHAR(100),
	OFFLINE_CHECK VARCHAR(3) CONSTRAINT OES_EVAL_TYPE_OFFLINE_CHECK_YESorNO CHECK (OFFLINE_CHECK IN('YES','NO')),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE STREAM(
	STREAM_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_STREAM_ID_PK PRIMARY KEY,
	STREAM_NAME VARCHAR(20),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE COURSE_TYPE(
	COURSE_TYPE_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_COURSE_TYPE_PK PRIMARY KEY,
	COURSE_TYPE_NAME VARCHAR(10),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE DIFFICULTY_LEVEL(
	DIFFICULTY_LEVEL_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_DIFFICULTY_LEVEL_ID_PK PRIMARY KEY,
	DIFFICULTY_LEVEL_NAME VARCHAR(10),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE EMPLOYEE_DETAILS(
	USERID INT FOREIGN KEY REFERENCES USER_PROFILE(USERID),
	SALARY DECIMAL(8,2),
	DATE_OF_JOINING DATE,
	EMPLOYEE_CATEGORY_ID TINYINT FOREIGN KEY REFERENCES EMPLOYEE_CATEGORY(EMPLOYEE_CATEGORY_ID),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE FACULTY_SKILLS(
	USERID INT FOREIGN KEY REFERENCES USER_PROFILE(USERID),
	SKILL_SET VARCHAR(150),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE USER_STUDENT(
	USERID INT FOREIGN KEY REFERENCES USER_PROFILE(USERID),
	PARENT_NAME VARCHAR(20),
	PARENT_MOB VARCHAR(15),
	CLIENT_CATEGORY_ID TINYINT FOREIGN KEY REFERENCES CLIENT_CATEGORY(CLIENT_CATEGORY_ID),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE FEEDBACK_QUESTIONS(
	FBQ_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_FBQ_ID_PK PRIMARY KEY,
	FBQ VARCHAR(200),
	FBQ_TYPE VARCHAR(20),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE RULES(
	RULE_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_RULE_ID_PK PRIMARY KEY,
	RULE_DESCRIPTION VARCHAR(200),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE GRADING_SYSTEM(
	GRADE_ID VARCHAR(2) CONSTRAINT OES_GRADE_ID_PK PRIMARY KEY,
	LOWER_LIMIT SMALLINT,
	HIGHER_LIMIT SMALLINT,
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE TOOL_TIPS(
	TOOL_TIP_ID TINYINT IDENTITY(1,1) CONSTRAINT OES_TOOL_TIP_ID_PK PRIMARY KEY,
	COURSE_TYPE_ID TINYINT FOREIGN KEY REFERENCES COURSE_TYPE(COURSE_TYPE_ID),
	TOOL_TIP_DESCRIPTION VARCHAR(200),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE COURSES(
	COURSE_ID SMALLINT IDENTITY(1,1) CONSTRAINT OES_COURSE_ID_PK PRIMARY KEY,
	COURSE_NAME VARCHAR(20),
	DURATION SMALLINT,
	FEES DECIMAL(7,2),
	STREAM_ID TINYINT FOREIGN KEY REFERENCES STREAM(STREAM_ID),
	COURSE_TYPE_ID TINYINT FOREIGN KEY REFERENCES COURSE_TYPE(COURSE_TYPE_ID),
	COURSEWARE_EXIST VARCHAR(3) CONSTRAINT OES_COURSES_COURSEWARE_EXIST_YESorNO CHECK (COURSEWARE_EXIST IN('YES','NO')),
	EVALUATION_TYPE_ID TINYINT FOREIGN KEY REFERENCES EVALUATION_TYPE(EVALUATION_TYPE_ID),
	TOTAL_TESTS TINYINT,
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE TOPICS(
	TOPIC_ID SMALLINT IDENTITY(1,1) CONSTRAINT OES_TOPIC_ID_PK PRIMARY KEY,
	COURSE_ID SMALLINT FOREIGN KEY REFERENCES COURSES(COURSE_ID),
	TOPIC_NAME VARCHAR(50),
	MIN_NO_OF_QUESTIONS_FOR_TEST TINYINT,
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE TEST_DETAILS(
	TEST_DETAIL_ID INT IDENTITY(1,1) CONSTRAINT OES_TEST_DETAIL_ID_PK PRIMARY KEY,
	COURSE_ID SMALLINT FOREIGN KEY REFERENCES COURSES(COURSE_ID),
	TEST_NO TINYINT,
	TOTAL_QUESTIONS TINYINT,
	TEST_FEES DECIMAL(6,2),
	NEGATIVE_MARKING VARCHAR(3),
	RULES VARCHAR(50),
	EVALUATION_TYPE_ID TINYINT FOREIGN KEY REFERENCES EVALUATION_TYPE(EVALUATION_TYPE_ID),
	CREATED_BY INT,
	CREATED_DATE DATETIME,
	UNIQUE(COURSE_ID,TEST_NO)
)

CREATE TABLE USER_TEST_DETAILS(
	USER_TEST_ID INT IDENTITY(1,1) CONSTRAINT OES_USER_TEST_ID_PK PRIMARY KEY,
	USERID INT  FOREIGN KEY REFERENCES USER_PROFILE(USERID),
	TEST_DETAIL_ID INT FOREIGN KEY REFERENCES TEST_DETAILS(TEST_DETAIL_ID),
	MARKS_RECEIVED SMALLINT,
	NO_OF_REGISTRATION TINYINT,
	FEE_STATUS VARCHAR(10),
	CREATED_BY INT,
	CREATED_DATE DATETIME,
	UNIQUE(USERID,TEST_DETAIL_ID,NO_OF_REGISTRATION)
)

CREATE TABLE BATCH_DETAILS(
	BATCH_ID VARCHAR(10) CONSTRAINT OES_BATCH_ID_PK PRIMARY KEY,
	COURSE_ID SMALLINT FOREIGN KEY REFERENCES COURSES(COURSE_ID),
	FACULTY INT FOREIGN KEY REFERENCES USER_PROFILE(USERID),
	BEGIN_DATE DATE,
	END_DATE DATE,
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE TEST_DIFFICULTY(
	TEST_DETAIL_ID INT FOREIGN KEY REFERENCES TEST_DETAILS(TEST_DETAIL_ID),
	TOPIC_ID SMALLINT FOREIGN KEY REFERENCES TOPICS,
	DIFFICULTY_LEVEL_ID TINYINT FOREIGN KEY REFERENCES DIFFICULTY_LEVEL(DIFFICULTY_LEVEL_ID),
	NO_OF_QUESTIONS SMALLINT,
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE STUDENT_COURSE_DETAILS(
	USERID INT FOREIGN KEY REFERENCES USER_PROFILE,
	EXTERNAL_STUDENT VARCHAR(3),
	BATCH_ID VARCHAR(10) FOREIGN KEY REFERENCES BATCH_DETAILS(BATCH_ID),
	FEEDBACK_GIVEN VARCHAR(3),
	CERTIFICATE_GIVEN VARCHAR(3),
	COURSE_AGGR SMALLINT,
	GRADE_ID VARCHAR(2) FOREIGN KEY REFERENCES GRADING_SYSTEM(GRADE_ID),
	FEE_STATUS VARCHAR(10),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

CREATE TABLE COURSE_FEEDBACK(
	USERID INT FOREIGN KEY REFERENCES USER_PROFILE(USERID),
	COURSE_ID SMALLINT FOREIGN KEY REFERENCES COURSES(COURSE_ID),
	FBQ_ID TINYINT FOREIGN KEY REFERENCES FEEDBACK_QUESTIONS(FBQ_ID),
	RESPONSE VARCHAR(150),
	MARK_FOR_REVIEW VARCHAR(3),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)
 CREATE TABLE TEST_FEEDBACK(
	USER_TEST_ID INT FOREIGN KEY REFERENCES USER_TEST_DETAILS(USER_TEST_ID),
	FBQ_ID TINYINT FOREIGN KEY REFERENCES FEEDBACK_QUESTIONS(FBQ_ID),
	RESPONSE VARCHAR(100),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)

/*CREATE TABLE STUDENT_TEST_RESULT_C(
	USER_TEST_ID INT FOREIGN KEY REFERENCES USER_TEST_DETAILS(USER_TEST_ID),
	Q_NO SMALLINT,
	TECH_Q_ID INT FOREIGN KEY REFERENCES TECHNICAL_QUESTION_BANK(TECH_Q_ID),
	STUDENT_RESPONSE VARCHAR(10),
	IS_CORRRECT VARCHAR(3),
	CREATED_BY INT,
	CREATED_DATE DATETIME
)*/






	

	
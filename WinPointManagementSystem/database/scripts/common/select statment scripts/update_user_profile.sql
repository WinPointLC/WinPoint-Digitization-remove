USE [OES_TESTING]
GO

UPDATE [dbo].[USER_PROFILE]
   SET [FIRST_NAME] = <@LAST_NAME>
      ,[LAST_NAME] = <@LAST_NAME>
      ,[EMAIL_ID] = <@EMAIL_ID>
      ,[MOBILE_NUMBER] = <@MOBILE_NUMBER>
      ,[ADDRESS] = <@ADDRESS>
      ,[BIRTHDATE] = <@BIRTHDATE>
      ,[COLLEGE] = <@COLLEGE>
      ,[DEGREE] = <@DEGREE>
      ,[BRANCH] = <@BRANCH>
      ,[YEAR_OF_GRADUATION] = <@YEAR_OF_GRADUATION>--('DD-MM-YYYY')IN QUOTES
      ,[PHOTO_LOCATION] = <@PHOTO_LOCATION>
      ,[PASSWORD] = <@PASSWORD>--32 CHARECTERS
      ,[SECURITY_QUESTION_ID] = <@SECURITY_QUESTION_ID>
      ,[SECURITY_ANSWER] = <@SECURITY_ANSWER>
      ,[USER_CATEGORY_ID] = <@USER_CATEGORY_ID>
      ,[OCCUPATION] = <@OCCUPATION>
      ,[ORGANIZATION] = <@ORGANIZATION>
      ,[DESIGNATION] = <@DESIGNATION>
      ,[DOMAIN] = <@DOMAIN>
      ,[ROLE] = <@ROLE>
      ,[EXPERIENCE] = <@EXPERIENCE>
      ,[CREATED_BY] = <@CREATED_BY>
      ,[CREATED_DATE] = <@CREATED_DATE>--('DD-MM-YYYY')IN QUOTES
 WHERE <user_id = @user_id>
GO


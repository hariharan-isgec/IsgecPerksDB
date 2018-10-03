USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyQuestionsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_ServeyQuestions].[Description] + ' [' + 
        STR([HRM_ServeyQuestions].[QuestionID])
        + ']', [HRM_ServeyQuestions].[QuestionID] 
			FROM [HRM_ServeyQuestions] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_ServeyQuestions].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_ServeyQuestions].[Description] + ' [' + 
        STR([HRM_ServeyQuestions].[QuestionID])
        + ']', [HRM_ServeyQuestions].[QuestionID] 
			FROM [HRM_ServeyQuestions] 
      WHERE QuestionID >= @PREFIX 
			ORDER BY [HRM_ServeyQuestions].[QuestionID] 
	  END
GO

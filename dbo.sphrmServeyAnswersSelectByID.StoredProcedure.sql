USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyAnswersSelectByID]
  @AnswerID Int
  AS
  SELECT
		[HRM_ServeyAnswers].[AnswerID],
		[HRM_ServeyAnswers].[ServeyID],
		[HRM_ServeyAnswers].[ServeySheetID],
		[HRM_ServeyAnswers].[QuestionID],
		[HRM_ServeyAnswers].[Answer1],
		[HRM_ServeyAnswers].[Answer2],
		[HRM_ServeyAnswers].[Answer3],
		[HRM_ServeyAnswers].[Answer4],
		[HRM_ServeyAnswers].[Answer5],
		[HRM_ServeyAnswers].[Answer6],
		[HRM_ServeyAnswers].[Answer7],
		[HRM_ServeyAnswers].[Answer8],
		[HRM_ServeyAnswers].[Answer9],
		[HRM_ServeyAnswers].[Answer10],
		[HRM_ServeyAnswers].[Answer11],
		[HRM_ServeyAnswers].[Answer12],
		[HRM_ServeyAnswers].[Answer13],
		[HRM_ServeyAnswers].[Answer14],
		[HRM_ServeyAnswers].[Answer15],
		[HRM_ServeyAnswers].[Answer16],
		[HRM_ServeyAnswers].[Answer17],
		[HRM_ServeyAnswers].[Answer18],
		[HRM_ServeyAnswers].[Answer19],
		[HRM_ServeyAnswers].[Answer20],
		[HRM_ServeyAnswers].[Answer21],
		[HRM_ServeyAnswers].[Answer22],
		[HRM_ServeyAnswers].[Answer23],
		[HRM_ServeyAnswers].[Answer24],
		[HRM_ServeyAnswers].[Answer25],
		[HRM_Serveys1].[ServeyID] AS HRM_Serveys1_ServeyID,
		[HRM_Serveys1].[Description] AS HRM_Serveys1_Description,
		[HRM_Serveys1].[AnsTag1] AS HRM_Serveys1_AnsTag1,
		[HRM_Serveys1].[AnsTag2] AS HRM_Serveys1_AnsTag2,
		[HRM_Serveys1].[AnsTag3] AS HRM_Serveys1_AnsTag3,
		[HRM_Serveys1].[AnsTag4] AS HRM_Serveys1_AnsTag4,
		[HRM_Serveys1].[AnsTag5] AS HRM_Serveys1_AnsTag5,
		[HRM_Serveys1].[AnsTag6] AS HRM_Serveys1_AnsTag6,
		[HRM_Serveys1].[AnsTag7] AS HRM_Serveys1_AnsTag7,
		[HRM_Serveys1].[AnsTag8] AS HRM_Serveys1_AnsTag8,
		[HRM_Serveys1].[AnsTag9] AS HRM_Serveys1_AnsTag9,
		[HRM_Serveys1].[AnsTag10] AS HRM_Serveys1_AnsTag10,
		[HRM_ServeySheets2].[ServeyID] AS HRM_ServeySheets2_ServeyID,
		[HRM_ServeySheets2].[ServeySheetID] AS HRM_ServeySheets2_ServeySheetID,
		[HRM_ServeySheets2].[Description] AS HRM_ServeySheets2_Description,
		[HRM_ServeySheets2].[CreatedOn] AS HRM_ServeySheets2_CreatedOn,
		[HRM_ServeyQuestions3].[QuestionID] AS HRM_ServeyQuestions3_QuestionID,
		[HRM_ServeyQuestions3].[Description] AS HRM_ServeyQuestions3_Description,
		[HRM_ServeyQuestions3].[ServeyID] AS HRM_ServeyQuestions3_ServeyID,
		[HRM_ServeyQuestions3].[Demography] AS HRM_ServeyQuestions3_Demography,
		[HRM_ServeyQuestions3].[UseCaption] AS HRM_ServeyQuestions3_UseCaption,
		[HRM_ServeyQuestions3].[AnsTag1] AS HRM_ServeyQuestions3_AnsTag1,
		[HRM_ServeyQuestions3].[AnsTag2] AS HRM_ServeyQuestions3_AnsTag2,
		[HRM_ServeyQuestions3].[AnsTag3] AS HRM_ServeyQuestions3_AnsTag3,
		[HRM_ServeyQuestions3].[AnsTag4] AS HRM_ServeyQuestions3_AnsTag4,
		[HRM_ServeyQuestions3].[AnsTag5] AS HRM_ServeyQuestions3_AnsTag5,
		[HRM_ServeyQuestions3].[AnsTag6] AS HRM_ServeyQuestions3_AnsTag6,
		[HRM_ServeyQuestions3].[AnsTag7] AS HRM_ServeyQuestions3_AnsTag7,
		[HRM_ServeyQuestions3].[AnsTag8] AS HRM_ServeyQuestions3_AnsTag8,
		[HRM_ServeyQuestions3].[AnsTag9] AS HRM_ServeyQuestions3_AnsTag9,
		[HRM_ServeyQuestions3].[AnsTag10] AS HRM_ServeyQuestions3_AnsTag10,
		[HRM_ServeyQuestions3].[AnsTag11] AS HRM_ServeyQuestions3_AnsTag11,
		[HRM_ServeyQuestions3].[AnsTag12] AS HRM_ServeyQuestions3_AnsTag12,
		[HRM_ServeyQuestions3].[AnsTag13] AS HRM_ServeyQuestions3_AnsTag13,
		[HRM_ServeyQuestions3].[AnsTag14] AS HRM_ServeyQuestions3_AnsTag14,
		[HRM_ServeyQuestions3].[AnsTag15] AS HRM_ServeyQuestions3_AnsTag15,
		[HRM_ServeyQuestions3].[AnsTag16] AS HRM_ServeyQuestions3_AnsTag16,
		[HRM_ServeyQuestions3].[AnsTag17] AS HRM_ServeyQuestions3_AnsTag17,
		[HRM_ServeyQuestions3].[AnsTag18] AS HRM_ServeyQuestions3_AnsTag18,
		[HRM_ServeyQuestions3].[AnsTag19] AS HRM_ServeyQuestions3_AnsTag19,
		[HRM_ServeyQuestions3].[AnsTag20] AS HRM_ServeyQuestions3_AnsTag20,
		[HRM_ServeyQuestions3].[AnsTag21] AS HRM_ServeyQuestions3_AnsTag21,
		[HRM_ServeyQuestions3].[AnsTag22] AS HRM_ServeyQuestions3_AnsTag22,
		[HRM_ServeyQuestions3].[AnsTag23] AS HRM_ServeyQuestions3_AnsTag23,
		[HRM_ServeyQuestions3].[AnsTag24] AS HRM_ServeyQuestions3_AnsTag24,
		[HRM_ServeyQuestions3].[AnsTag25] AS HRM_ServeyQuestions3_AnsTag25 
  FROM [HRM_ServeyAnswers] 
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeyAnswers].[ServeyID] = [HRM_Serveys1].[ServeyID]
  INNER JOIN [HRM_ServeySheets] AS [HRM_ServeySheets2]
    ON [HRM_ServeyAnswers].[ServeySheetID] = [HRM_ServeySheets2].[ServeySheetID]
  INNER JOIN [HRM_ServeyQuestions] AS [HRM_ServeyQuestions3]
    ON [HRM_ServeyAnswers].[QuestionID] = [HRM_ServeyQuestions3].[QuestionID]
  WHERE
  [HRM_ServeyAnswers].[AnswerID] = @AnswerID
GO

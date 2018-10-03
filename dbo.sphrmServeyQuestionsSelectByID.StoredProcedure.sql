USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyQuestionsSelectByID]
  @QuestionID Int
  AS
  SELECT
		[HRM_ServeyQuestions].[QuestionID],
		[HRM_ServeyQuestions].[Description],
		[HRM_ServeyQuestions].[ServeyID],
		[HRM_ServeyQuestions].[Demography],
		[HRM_ServeyQuestions].[UseCaption],
		[HRM_ServeyQuestions].[AnsTag1],
		[HRM_ServeyQuestions].[AnsTag2],
		[HRM_ServeyQuestions].[AnsTag3],
		[HRM_ServeyQuestions].[AnsTag4],
		[HRM_ServeyQuestions].[AnsTag5],
		[HRM_ServeyQuestions].[AnsTag6],
		[HRM_ServeyQuestions].[AnsTag7],
		[HRM_ServeyQuestions].[AnsTag8],
		[HRM_ServeyQuestions].[AnsTag9],
		[HRM_ServeyQuestions].[AnsTag10],
		[HRM_ServeyQuestions].[AnsTag11],
		[HRM_ServeyQuestions].[AnsTag12],
		[HRM_ServeyQuestions].[AnsTag13],
		[HRM_ServeyQuestions].[AnsTag14],
		[HRM_ServeyQuestions].[AnsTag15],
		[HRM_ServeyQuestions].[AnsTag16],
		[HRM_ServeyQuestions].[AnsTag17],
		[HRM_ServeyQuestions].[AnsTag18],
		[HRM_ServeyQuestions].[AnsTag19],
		[HRM_ServeyQuestions].[AnsTag20],
		[HRM_ServeyQuestions].[AnsTag21],
		[HRM_ServeyQuestions].[AnsTag22],
		[HRM_ServeyQuestions].[AnsTag23],
		[HRM_ServeyQuestions].[AnsTag24],
		[HRM_ServeyQuestions].[AnsTag25],
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
		[HRM_Serveys1].[AnsTag10] AS HRM_Serveys1_AnsTag10 
  FROM [HRM_ServeyQuestions] 
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeyQuestions].[ServeyID] = [HRM_Serveys1].[ServeyID]
  WHERE
  [HRM_ServeyQuestions].[QuestionID] = @QuestionID
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemeQuestionsSelectByID]
  @SerialNo Int
  AS
  SELECT
		[HRM_ServeyThemeQuestions].[SerialNo],
		[HRM_ServeyThemeQuestions].[ThemeID],
		[HRM_ServeyThemeQuestions].[QuestionID],
		[HRM_ServeyThemeQuestions].[ServeyID],
		[HRM_ServeyThemes1].[ThemeID] AS HRM_ServeyThemes1_ThemeID,
		[HRM_ServeyThemes1].[Description] AS HRM_ServeyThemes1_Description,
		[HRM_ServeyThemes1].[Details] AS HRM_ServeyThemes1_Details,
		[HRM_ServeyThemes1].[ServeyID] AS HRM_ServeyThemes1_ServeyID,
		[HRM_ServeyQuestions2].[QuestionID] AS HRM_ServeyQuestions2_QuestionID,
		[HRM_ServeyQuestions2].[Description] AS HRM_ServeyQuestions2_Description,
		[HRM_ServeyQuestions2].[ServeyID] AS HRM_ServeyQuestions2_ServeyID,
		[HRM_ServeyQuestions2].[Demography] AS HRM_ServeyQuestions2_Demography,
		[HRM_ServeyQuestions2].[UseCaption] AS HRM_ServeyQuestions2_UseCaption,
		[HRM_ServeyQuestions2].[AnsTag1] AS HRM_ServeyQuestions2_AnsTag1,
		[HRM_ServeyQuestions2].[AnsTag2] AS HRM_ServeyQuestions2_AnsTag2,
		[HRM_ServeyQuestions2].[AnsTag3] AS HRM_ServeyQuestions2_AnsTag3,
		[HRM_ServeyQuestions2].[AnsTag4] AS HRM_ServeyQuestions2_AnsTag4,
		[HRM_ServeyQuestions2].[AnsTag5] AS HRM_ServeyQuestions2_AnsTag5,
		[HRM_ServeyQuestions2].[AnsTag6] AS HRM_ServeyQuestions2_AnsTag6,
		[HRM_ServeyQuestions2].[AnsTag7] AS HRM_ServeyQuestions2_AnsTag7,
		[HRM_ServeyQuestions2].[AnsTag8] AS HRM_ServeyQuestions2_AnsTag8,
		[HRM_ServeyQuestions2].[AnsTag9] AS HRM_ServeyQuestions2_AnsTag9,
		[HRM_ServeyQuestions2].[AnsTag10] AS HRM_ServeyQuestions2_AnsTag10,
		[HRM_ServeyQuestions2].[AnsTag11] AS HRM_ServeyQuestions2_AnsTag11,
		[HRM_ServeyQuestions2].[AnsTag12] AS HRM_ServeyQuestions2_AnsTag12,
		[HRM_ServeyQuestions2].[AnsTag13] AS HRM_ServeyQuestions2_AnsTag13,
		[HRM_ServeyQuestions2].[AnsTag14] AS HRM_ServeyQuestions2_AnsTag14,
		[HRM_ServeyQuestions2].[AnsTag15] AS HRM_ServeyQuestions2_AnsTag15,
		[HRM_ServeyQuestions2].[AnsTag16] AS HRM_ServeyQuestions2_AnsTag16,
		[HRM_ServeyQuestions2].[AnsTag17] AS HRM_ServeyQuestions2_AnsTag17,
		[HRM_ServeyQuestions2].[AnsTag18] AS HRM_ServeyQuestions2_AnsTag18,
		[HRM_ServeyQuestions2].[AnsTag19] AS HRM_ServeyQuestions2_AnsTag19,
		[HRM_ServeyQuestions2].[AnsTag20] AS HRM_ServeyQuestions2_AnsTag20,
		[HRM_ServeyQuestions2].[AnsTag21] AS HRM_ServeyQuestions2_AnsTag21,
		[HRM_ServeyQuestions2].[AnsTag22] AS HRM_ServeyQuestions2_AnsTag22,
		[HRM_ServeyQuestions2].[AnsTag23] AS HRM_ServeyQuestions2_AnsTag23,
		[HRM_ServeyQuestions2].[AnsTag24] AS HRM_ServeyQuestions2_AnsTag24,
		[HRM_ServeyQuestions2].[AnsTag25] AS HRM_ServeyQuestions2_AnsTag25,
		[HRM_Serveys3].[ServeyID] AS HRM_Serveys3_ServeyID,
		[HRM_Serveys3].[Description] AS HRM_Serveys3_Description,
		[HRM_Serveys3].[AnsTag1] AS HRM_Serveys3_AnsTag1,
		[HRM_Serveys3].[AnsTag2] AS HRM_Serveys3_AnsTag2,
		[HRM_Serveys3].[AnsTag3] AS HRM_Serveys3_AnsTag3,
		[HRM_Serveys3].[AnsTag4] AS HRM_Serveys3_AnsTag4,
		[HRM_Serveys3].[AnsTag5] AS HRM_Serveys3_AnsTag5,
		[HRM_Serveys3].[AnsTag6] AS HRM_Serveys3_AnsTag6,
		[HRM_Serveys3].[AnsTag7] AS HRM_Serveys3_AnsTag7,
		[HRM_Serveys3].[AnsTag8] AS HRM_Serveys3_AnsTag8,
		[HRM_Serveys3].[AnsTag9] AS HRM_Serveys3_AnsTag9,
		[HRM_Serveys3].[AnsTag10] AS HRM_Serveys3_AnsTag10 
  FROM [HRM_ServeyThemeQuestions] 
  INNER JOIN [HRM_ServeyThemes] AS [HRM_ServeyThemes1]
    ON [HRM_ServeyThemeQuestions].[ThemeID] = [HRM_ServeyThemes1].[ThemeID]
  INNER JOIN [HRM_ServeyQuestions] AS [HRM_ServeyQuestions2]
    ON [HRM_ServeyThemeQuestions].[QuestionID] = [HRM_ServeyQuestions2].[QuestionID]
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys3]
    ON [HRM_ServeyThemeQuestions].[ServeyID] = [HRM_Serveys3].[ServeyID]
  WHERE
  [HRM_ServeyThemeQuestions].[SerialNo] = @SerialNo
GO

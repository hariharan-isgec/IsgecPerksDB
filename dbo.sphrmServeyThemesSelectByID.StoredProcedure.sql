USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemesSelectByID]
  @ThemeID Int
  AS
  SELECT
		[HRM_ServeyThemes].[ThemeID],
		[HRM_ServeyThemes].[Description],
		[HRM_ServeyThemes].[Details],
		[HRM_ServeyThemes].[ServeyID],
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
  FROM [HRM_ServeyThemes] 
  LEFT OUTER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeyThemes].[ServeyID] = [HRM_Serveys1].[ServeyID]
  WHERE
  [HRM_ServeyThemes].[ThemeID] = @ThemeID
GO

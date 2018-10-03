USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeysSelectByID]
  @ServeyID Int
  AS
  SELECT
		[HRM_Serveys].[ServeyID],
		[HRM_Serveys].[Description],
		[HRM_Serveys].[AnsTag1],
		[HRM_Serveys].[AnsTag2],
		[HRM_Serveys].[AnsTag3],
		[HRM_Serveys].[AnsTag4],
		[HRM_Serveys].[AnsTag5],
		[HRM_Serveys].[AnsTag6],
		[HRM_Serveys].[AnsTag7],
		[HRM_Serveys].[AnsTag8],
		[HRM_Serveys].[AnsTag9],
		[HRM_Serveys].[AnsTag10] 
  FROM [HRM_Serveys] 
  WHERE
  [HRM_Serveys].[ServeyID] = @ServeyID
GO

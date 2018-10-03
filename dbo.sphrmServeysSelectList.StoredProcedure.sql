USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeysSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  ORDER BY
     CASE @orderBy WHEN 'ServeyID' THEN [HRM_Serveys].[ServeyID] END,
     CASE @orderBy WHEN 'ServeyID DESC' THEN [HRM_Serveys].[ServeyID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Serveys].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Serveys].[Description] END DESC,
     CASE @orderBy WHEN 'AnsTag1' THEN [HRM_Serveys].[AnsTag1] END,
     CASE @orderBy WHEN 'AnsTag1 DESC' THEN [HRM_Serveys].[AnsTag1] END DESC,
     CASE @orderBy WHEN 'AnsTag2' THEN [HRM_Serveys].[AnsTag2] END,
     CASE @orderBy WHEN 'AnsTag2 DESC' THEN [HRM_Serveys].[AnsTag2] END DESC,
     CASE @orderBy WHEN 'AnsTag3' THEN [HRM_Serveys].[AnsTag3] END,
     CASE @orderBy WHEN 'AnsTag3 DESC' THEN [HRM_Serveys].[AnsTag3] END DESC,
     CASE @orderBy WHEN 'AnsTag4' THEN [HRM_Serveys].[AnsTag4] END,
     CASE @orderBy WHEN 'AnsTag4 DESC' THEN [HRM_Serveys].[AnsTag4] END DESC,
     CASE @orderBy WHEN 'AnsTag5' THEN [HRM_Serveys].[AnsTag5] END,
     CASE @orderBy WHEN 'AnsTag5 DESC' THEN [HRM_Serveys].[AnsTag5] END DESC,
     CASE @orderBy WHEN 'AnsTag6' THEN [HRM_Serveys].[AnsTag6] END,
     CASE @orderBy WHEN 'AnsTag6 DESC' THEN [HRM_Serveys].[AnsTag6] END DESC,
     CASE @orderBy WHEN 'AnsTag7' THEN [HRM_Serveys].[AnsTag7] END,
     CASE @orderBy WHEN 'AnsTag7 DESC' THEN [HRM_Serveys].[AnsTag7] END DESC,
     CASE @orderBy WHEN 'AnsTag8' THEN [HRM_Serveys].[AnsTag8] END,
     CASE @orderBy WHEN 'AnsTag8 DESC' THEN [HRM_Serveys].[AnsTag8] END DESC,
     CASE @orderBy WHEN 'AnsTag9' THEN [HRM_Serveys].[AnsTag9] END,
     CASE @orderBy WHEN 'AnsTag9 DESC' THEN [HRM_Serveys].[AnsTag9] END DESC,
     CASE @orderBy WHEN 'AnsTag10' THEN [HRM_Serveys].[AnsTag10] END,
     CASE @orderBy WHEN 'AnsTag10 DESC' THEN [HRM_Serveys].[AnsTag10] END DESC 
  SET @RecordCount = @@RowCount
GO

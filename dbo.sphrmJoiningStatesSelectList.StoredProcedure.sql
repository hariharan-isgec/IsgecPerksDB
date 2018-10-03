USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmJoiningStatesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_JoiningStates].[JoiningStateID],
		[HRM_JoiningStates].[Description] 
  FROM [HRM_JoiningStates] 
  ORDER BY
     CASE @orderBy WHEN 'JoiningStateID' THEN [HRM_JoiningStates].[JoiningStateID] END,
     CASE @orderBy WHEN 'JoiningStateID DESC' THEN [HRM_JoiningStates].[JoiningStateID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_JoiningStates].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_JoiningStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

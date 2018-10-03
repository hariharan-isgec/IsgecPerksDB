USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_PunchStatus].[PunchStatusID],
		[ATN_PunchStatus].[Description],
		[ATN_PunchStatus].[PunchValue] 
  FROM [ATN_PunchStatus] 
  ORDER BY
     CASE @orderBy WHEN 'PunchStatusID' THEN [ATN_PunchStatus].[PunchStatusID] END,
     CASE @orderBy WHEN 'PunchStatusID DESC' THEN [ATN_PunchStatus].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_PunchStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_PunchStatus].[Description] END DESC,
     CASE @orderBy WHEN 'PunchValue' THEN [ATN_PunchStatus].[PunchValue] END,
     CASE @orderBy WHEN 'PunchValue DESC' THEN [ATN_PunchStatus].[PunchValue] END DESC 
  SET @RecordCount = @@RowCount
GO

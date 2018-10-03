USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplicationStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_ApplicationStatus].[ApplStatusID],
		[ATN_ApplicationStatus].[Description] 
  FROM [ATN_ApplicationStatus] 
  ORDER BY
     CASE @orderBy WHEN 'ApplStatusID' THEN [ATN_ApplicationStatus].[ApplStatusID] END,
     CASE @orderBy WHEN 'ApplStatusID DESC' THEN [ATN_ApplicationStatus].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_ApplicationStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_ApplicationStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

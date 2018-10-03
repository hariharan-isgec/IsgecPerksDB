USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmActivitiesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ASM_Activities].[ActivityID],
		[ASM_Activities].[Description] 
  FROM [ASM_Activities] 
  ORDER BY
     CASE @orderBy WHEN 'ActivityID' THEN [ASM_Activities].[ActivityID] END,
     CASE @orderBy WHEN 'ActivityID DESC' THEN [ASM_Activities].[ActivityID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_Activities].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_Activities].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

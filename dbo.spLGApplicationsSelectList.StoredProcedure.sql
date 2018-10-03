USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGApplicationsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SYS_Applications].[ApplicationID],
		[SYS_Applications].[Description],
		[SYS_Applications].[WebPath],
		[SYS_Applications].[GenerateDefaults] 
  FROM [SYS_Applications] 
  ORDER BY
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_Applications].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_Applications].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SYS_Applications].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SYS_Applications].[Description] END DESC,
     CASE @orderBy WHEN 'WebPath' THEN [SYS_Applications].[WebPath] END,
     CASE @orderBy WHEN 'WebPath DESC' THEN [SYS_Applications].[WebPath] END DESC,
     CASE @orderBy WHEN 'GenerateDefaults' THEN [SYS_Applications].[GenerateDefaults] END,
     CASE @orderBy WHEN 'GenerateDefaults DESC' THEN [SYS_Applications].[GenerateDefaults] END DESC 
  SET @RecordCount = @@RowCount
GO

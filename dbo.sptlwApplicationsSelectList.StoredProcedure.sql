USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwApplicationsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SYS_Applications].*  
  FROM [SYS_Applications] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_Applications].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_Applications].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SYS_Applications].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SYS_Applications].[Description] END DESC,
     CASE @OrderBy WHEN 'WebPath' THEN [SYS_Applications].[WebPath] END,
     CASE @OrderBy WHEN 'WebPath DESC' THEN [SYS_Applications].[WebPath] END DESC,
     CASE @OrderBy WHEN 'GenerateDefaults' THEN [SYS_Applications].[GenerateDefaults] END,
     CASE @OrderBy WHEN 'GenerateDefaults DESC' THEN [SYS_Applications].[GenerateDefaults] END DESC 
  SET @RecordCount = @@RowCount
GO

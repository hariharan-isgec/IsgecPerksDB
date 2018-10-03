USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGPageSizeSelectByApplicationID]
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SYS_LGPageSize].[PageID],
		[SYS_LGPageSize].[LoginID],
		[SYS_LGPageSize].[PageName],
		[SYS_LGPageSize].[PageSize],
		[SYS_LGPageSize].[PageNo],
		[SYS_LGPageSize].[ApplicationID],
		[SYS_Applications1].[ApplicationID] AS SYS_Applications1_ApplicationID,
		[SYS_Applications1].[Description] AS SYS_Applications1_Description,
		[SYS_Applications1].[WebPath] AS SYS_Applications1_WebPath,
		[SYS_Applications1].[GenerateDefaults] AS SYS_Applications1_GenerateDefaults 
  FROM [SYS_LGPageSize] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_LGPageSize].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
  [SYS_LGPageSize].[ApplicationID] = @ApplicationID
  ORDER BY
     CASE @orderBy WHEN 'PageID' THEN [SYS_LGPageSize].[PageID] END,
     CASE @orderBy WHEN 'PageID DESC' THEN [SYS_LGPageSize].[PageID] END DESC,
     CASE @orderBy WHEN 'LoginID' THEN [SYS_LGPageSize].[LoginID] END,
     CASE @orderBy WHEN 'LoginID DESC' THEN [SYS_LGPageSize].[LoginID] END DESC,
     CASE @orderBy WHEN 'PageName' THEN [SYS_LGPageSize].[PageName] END,
     CASE @orderBy WHEN 'PageName DESC' THEN [SYS_LGPageSize].[PageName] END DESC,
     CASE @orderBy WHEN 'PageSize' THEN [SYS_LGPageSize].[PageSize] END,
     CASE @orderBy WHEN 'PageSize DESC' THEN [SYS_LGPageSize].[PageSize] END DESC,
     CASE @orderBy WHEN 'PageNo' THEN [SYS_LGPageSize].[PageNo] END,
     CASE @orderBy WHEN 'PageNo DESC' THEN [SYS_LGPageSize].[PageNo] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_LGPageSize].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_LGPageSize].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_ApplicationID' THEN [SYS_Applications1].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_Applications1_ApplicationID DESC' THEN [SYS_Applications1].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @orderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_WebPath' THEN [SYS_Applications1].[WebPath] END,
     CASE @orderBy WHEN 'SYS_Applications1_WebPath DESC' THEN [SYS_Applications1].[WebPath] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_GenerateDefaults' THEN [SYS_Applications1].[GenerateDefaults] END,
     CASE @orderBy WHEN 'SYS_Applications1_GenerateDefaults DESC' THEN [SYS_Applications1].[GenerateDefaults] END DESC 
  SET @RecordCount = @@RowCount
GO

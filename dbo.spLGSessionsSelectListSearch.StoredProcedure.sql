USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGSessionsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  VRSessionID Int NOT NULL
  )
  INSERT INTO #PageIndex (VRSessionID)
  SELECT [SYS_VRSessions].[VRSessionID] FROM [SYS_VRSessions]
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessions].[ApplicationID] = [SYS_Applications1].[ApplicationID]
 WHERE  
   ( 
         STR(ISNULL([SYS_VRSessions].[VRSessionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions].[FileName],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRSessions].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions].[FolderLocation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions].[VRMenuName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions].[ToolTip],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions].[VRSessionType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions].[CSSClass],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications1].[WebPath],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VRSessionID' THEN [SYS_VRSessions].[VRSessionID] END,
     CASE @orderBy WHEN 'VRSessionID DESC' THEN [SYS_VRSessions].[VRSessionID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SYS_VRSessions].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SYS_VRSessions].[Description] END DESC,
     CASE @orderBy WHEN 'FileName' THEN [SYS_VRSessions].[FileName] END,
     CASE @orderBy WHEN 'FileName DESC' THEN [SYS_VRSessions].[FileName] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_VRSessions].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_VRSessions].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'FolderLocation' THEN [SYS_VRSessions].[FolderLocation] END,
     CASE @orderBy WHEN 'FolderLocation DESC' THEN [SYS_VRSessions].[FolderLocation] END DESC,
     CASE @orderBy WHEN 'VRMenuName' THEN [SYS_VRSessions].[VRMenuName] END,
     CASE @orderBy WHEN 'VRMenuName DESC' THEN [SYS_VRSessions].[VRMenuName] END DESC,
     CASE @orderBy WHEN 'ToolTip' THEN [SYS_VRSessions].[ToolTip] END,
     CASE @orderBy WHEN 'ToolTip DESC' THEN [SYS_VRSessions].[ToolTip] END DESC,
     CASE @orderBy WHEN 'VRSessionType' THEN [SYS_VRSessions].[VRSessionType] END,
     CASE @orderBy WHEN 'VRSessionType DESC' THEN [SYS_VRSessions].[VRSessionType] END DESC,
     CASE @orderBy WHEN 'CSSClass' THEN [SYS_VRSessions].[CSSClass] END,
     CASE @orderBy WHEN 'CSSClass DESC' THEN [SYS_VRSessions].[CSSClass] END DESC,
     CASE @orderBy WHEN 'MaintainGrid' THEN [SYS_VRSessions].[MaintainGrid] END,
     CASE @orderBy WHEN 'MaintainGrid DESC' THEN [SYS_VRSessions].[MaintainGrid] END DESC,
     CASE @orderBy WHEN 'InsertForm' THEN [SYS_VRSessions].[InsertForm] END,
     CASE @orderBy WHEN 'InsertForm DESC' THEN [SYS_VRSessions].[InsertForm] END DESC,
     CASE @orderBy WHEN 'UpdateForm' THEN [SYS_VRSessions].[UpdateForm] END,
     CASE @orderBy WHEN 'UpdateForm DESC' THEN [SYS_VRSessions].[UpdateForm] END DESC,
     CASE @orderBy WHEN 'DisplayGrid' THEN [SYS_VRSessions].[DisplayGrid] END,
     CASE @orderBy WHEN 'DisplayGrid DESC' THEN [SYS_VRSessions].[DisplayGrid] END DESC,
     CASE @orderBy WHEN 'DisplayForm' THEN [SYS_VRSessions].[DisplayForm] END,
     CASE @orderBy WHEN 'DisplayForm DESC' THEN [SYS_VRSessions].[DisplayForm] END DESC,
     CASE @orderBy WHEN 'DeleteOption' THEN [SYS_VRSessions].[DeleteOption] END,
     CASE @orderBy WHEN 'DeleteOption DESC' THEN [SYS_VRSessions].[DeleteOption] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_ApplicationID' THEN [SYS_Applications1].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_Applications1_ApplicationID DESC' THEN [SYS_Applications1].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @orderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_WebPath' THEN [SYS_Applications1].[WebPath] END,
     CASE @orderBy WHEN 'SYS_Applications1_WebPath DESC' THEN [SYS_Applications1].[WebPath] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_GenerateDefaults' THEN [SYS_Applications1].[GenerateDefaults] END,
     CASE @orderBy WHEN 'SYS_Applications1_GenerateDefaults DESC' THEN [SYS_Applications1].[GenerateDefaults] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRSessions].[VRSessionID],
		[SYS_VRSessions].[Description],
		[SYS_VRSessions].[FileName],
		[SYS_VRSessions].[ApplicationID],
		[SYS_VRSessions].[FolderLocation],
		[SYS_VRSessions].[VRMenuName],
		[SYS_VRSessions].[ToolTip],
		[SYS_VRSessions].[VRSessionType],
		[SYS_VRSessions].[CSSClass],
		[SYS_VRSessions].[MaintainGrid],
		[SYS_VRSessions].[InsertForm],
		[SYS_VRSessions].[UpdateForm],
		[SYS_VRSessions].[DisplayGrid],
		[SYS_VRSessions].[DisplayForm],
		[SYS_VRSessions].[DeleteOption],
		[SYS_Applications1].[ApplicationID] AS SYS_Applications1_ApplicationID,
		[SYS_Applications1].[Description] AS SYS_Applications1_Description,
		[SYS_Applications1].[WebPath] AS SYS_Applications1_WebPath,
		[SYS_Applications1].[GenerateDefaults] AS SYS_Applications1_GenerateDefaults 
  FROM [SYS_VRSessions] 
    	INNER JOIN #PageIndex
          ON [SYS_VRSessions].[VRSessionID] = #PageIndex.VRSessionID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessions].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

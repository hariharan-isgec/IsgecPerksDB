USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGRolesSelectListSearch]
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
  VRRoleID Int NOT NULL
  )
  INSERT INTO #PageIndex (VRRoleID)
  SELECT [SYS_VRRoles].[VRRoleID] FROM [SYS_VRRoles]
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]
 WHERE  
   ( 
         STR(ISNULL([SYS_VRRoles].[VRRoleID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRRoles].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRRoles].[VRRoleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRRoles].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications1].[WebPath],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VRRoleID' THEN [SYS_VRRoles].[VRRoleID] END,
     CASE @orderBy WHEN 'VRRoleID DESC' THEN [SYS_VRRoles].[VRRoleID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SYS_VRRoles].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SYS_VRRoles].[Description] END DESC,
     CASE @orderBy WHEN 'VRRoleType' THEN [SYS_VRRoles].[VRRoleType] END,
     CASE @orderBy WHEN 'VRRoleType DESC' THEN [SYS_VRRoles].[VRRoleType] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_VRRoles].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_VRRoles].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'DefaultRole' THEN [SYS_VRRoles].[DefaultRole] END,
     CASE @orderBy WHEN 'DefaultRole DESC' THEN [SYS_VRRoles].[DefaultRole] END DESC,
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
		[SYS_VRRoles].[VRRoleID],
		[SYS_VRRoles].[Description],
		[SYS_VRRoles].[VRRoleType],
		[SYS_VRRoles].[ApplicationID],
		[SYS_VRRoles].[DefaultRole],
		[SYS_Applications1].[ApplicationID] AS SYS_Applications1_ApplicationID,
		[SYS_Applications1].[Description] AS SYS_Applications1_Description,
		[SYS_Applications1].[WebPath] AS SYS_Applications1_WebPath,
		[SYS_Applications1].[GenerateDefaults] AS SYS_Applications1_GenerateDefaults 
  FROM [SYS_VRRoles] 
    	INNER JOIN #PageIndex
          ON [SYS_VRRoles].[VRRoleID] = #PageIndex.VRRoleID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

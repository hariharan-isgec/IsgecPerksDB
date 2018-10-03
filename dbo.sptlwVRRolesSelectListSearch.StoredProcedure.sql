USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRolesSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,VRRoleID Int NOT NULL
  )
  INSERT INTO #PageIndex (VRRoleID)
  SELECT [SYS_VRRoles].[VRRoleID] FROM [SYS_VRRoles]
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]
 WHERE  
      [SYS_VRRoles].[ApplicationID] = (@ApplicationID)
   AND ( 
         STR(ISNULL([SYS_VRRoles].[VRRoleID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRRoles].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRRoles].[VRRoleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRRoles].[ApplicationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'VRRoleID' THEN [SYS_VRRoles].[VRRoleID] END,
     CASE @OrderBy WHEN 'VRRoleID DESC' THEN [SYS_VRRoles].[VRRoleID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SYS_VRRoles].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SYS_VRRoles].[Description] END DESC,
     CASE @OrderBy WHEN 'VRRoleType' THEN [SYS_VRRoles].[VRRoleType] END,
     CASE @OrderBy WHEN 'VRRoleType DESC' THEN [SYS_VRRoles].[VRRoleType] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRRoles].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRRoles].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'DefaultRole' THEN [SYS_VRRoles].[DefaultRole] END,
     CASE @OrderBy WHEN 'DefaultRole DESC' THEN [SYS_VRRoles].[DefaultRole] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRRoles].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_VRRoles] 
      INNER JOIN #PageIndex
          ON [SYS_VRRoles].[VRRoleID] = #PageIndex.VRRoleID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

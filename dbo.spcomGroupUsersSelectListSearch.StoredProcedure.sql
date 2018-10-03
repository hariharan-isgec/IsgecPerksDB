USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupUsersSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,GroupID NVarChar(6) NOT NULL
 ,LoginID NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (GroupID, LoginID)
  SELECT [SYS_GroupLogins].[GroupID], [SYS_GroupLogins].[LoginID] FROM [SYS_GroupLogins]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_GroupLogins].[LoginID] = [aspnet_Users1].[LoginID]
  INNER JOIN [SYS_Groups] AS [SYS_Groups2]
    ON [SYS_GroupLogins].[GroupID] = [SYS_Groups2].[GroupID]
 WHERE  
   ( 
         LOWER(ISNULL([SYS_GroupLogins].[GroupID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_GroupLogins].[LoginID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [SYS_GroupLogins].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [SYS_GroupLogins].[GroupID] END DESC,
     CASE @OrderBy WHEN 'LoginID' THEN [SYS_GroupLogins].[LoginID] END,
     CASE @OrderBy WHEN 'LoginID DESC' THEN [SYS_GroupLogins].[LoginID] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [SYS_GroupLogins].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [SYS_GroupLogins].[Active] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'SYS_Groups2_Description' THEN [SYS_Groups2].[Description] END,
     CASE @OrderBy WHEN 'SYS_Groups2_Description DESC' THEN [SYS_Groups2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SYS_GroupLogins].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [SYS_Groups2].[Description] AS SYS_Groups2_Description 
  FROM [SYS_GroupLogins] 
      INNER JOIN #PageIndex
          ON [SYS_GroupLogins].[GroupID] = #PageIndex.GroupID
          AND [SYS_GroupLogins].[LoginID] = #PageIndex.LoginID
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_GroupLogins].[LoginID] = [aspnet_Users1].[LoginID]
  INNER JOIN [SYS_Groups] AS [SYS_Groups2]
    ON [SYS_GroupLogins].[GroupID] = [SYS_Groups2].[GroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

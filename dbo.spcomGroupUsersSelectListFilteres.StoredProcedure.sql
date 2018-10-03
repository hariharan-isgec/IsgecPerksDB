USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupUsersSelectListFilteres]
  @Filter_GroupID NVarChar(6),
  @Filter_LoginID NVarChar(8),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,GroupID NVarChar(6) NOT NULL
 ,LoginID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GroupID'
  SET @LGSQL = @LGSQL + ', LoginID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SYS_GroupLogins].[GroupID]'
  SET @LGSQL = @LGSQL + ', [SYS_GroupLogins].[LoginID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_GroupLogins] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_GroupLogins].[LoginID] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Groups] AS [SYS_Groups2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_GroupLogins].[GroupID] = [SYS_Groups2].[GroupID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GroupID > '') 
    SET @LGSQL = @LGSQL + ' AND [SYS_GroupLogins].[GroupID] = ''' + @Filter_GroupID + ''''
  IF (@Filter_LoginID > '') 
    SET @LGSQL = @LGSQL + ' AND [SYS_GroupLogins].[LoginID] = ''' + @Filter_LoginID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GroupID' THEN '[SYS_GroupLogins].[GroupID]'
                        WHEN 'GroupID DESC' THEN '[SYS_GroupLogins].[GroupID] DESC'
                        WHEN 'LoginID' THEN '[SYS_GroupLogins].[LoginID]'
                        WHEN 'LoginID DESC' THEN '[SYS_GroupLogins].[LoginID] DESC'
                        WHEN 'Active' THEN '[SYS_GroupLogins].[Active]'
                        WHEN 'Active DESC' THEN '[SYS_GroupLogins].[Active] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'SYS_Groups2_Description' THEN '[SYS_Groups2].[Description]'
                        WHEN 'SYS_Groups2_Description DESC' THEN '[SYS_Groups2].[Description] DESC'
                        ELSE '[SYS_GroupLogins].[GroupID],[SYS_GroupLogins].[LoginID]'
                    END
  EXEC (@LGSQL)

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

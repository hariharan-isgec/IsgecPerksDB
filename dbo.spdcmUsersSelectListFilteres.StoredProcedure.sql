USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmUsersSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,UserName NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserName'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[aspnet_Users].[UserName]'  SET @LGSQL = @LGSQL + ' FROM [aspnet_Users] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserName' THEN '[aspnet_Users].[UserName]'
                        WHEN 'UserName DESC' THEN '[aspnet_Users].[UserName] DESC'
                        WHEN 'UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'UserFullName DESC' THEN '[aspnet_Users].[UserFullName] DESC'
                        WHEN 'ExtnNo' THEN '[aspnet_Users].[ExtnNo]'
                        WHEN 'ExtnNo DESC' THEN '[aspnet_Users].[ExtnNo] DESC'
                        WHEN 'MobileNo' THEN '[aspnet_Users].[MobileNo]'
                        WHEN 'MobileNo DESC' THEN '[aspnet_Users].[MobileNo] DESC'
                        WHEN 'EMailID' THEN '[aspnet_Users].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[aspnet_Users].[EMailID] DESC'
                        ELSE '[aspnet_Users].[UserName]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[aspnet_Users].[UserName],
		[aspnet_Users].[UserFullName],
		[aspnet_Users].[ExtnNo],
		[aspnet_Users].[MobileNo],
		[aspnet_Users].[EMailID] 
  FROM [aspnet_Users] 
    	INNER JOIN #PageIndex
          ON [aspnet_Users].[UserName] = #PageIndex.UserName
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

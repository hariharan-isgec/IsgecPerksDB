USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalUsersSelectListFilteres]
  @Filter_LocationID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  UserName NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (UserName) ' + 
               'SELECT [aspnet_Users].[UserName] FROM [aspnet_Users] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations1]'
  SET @LGSQL = @LGSQL + '    ON [aspnet_Users].[LocationID] = [AST_Locations1].[LocationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_LocationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [aspnet_Users].[LocationID] = ' + STR(@Filter_LocationID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserName' THEN '[aspnet_Users].[UserName]'
                        WHEN 'UserName DESC' THEN '[aspnet_Users].[UserName] DESC'
                        WHEN 'UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'UserFullName DESC' THEN '[aspnet_Users].[UserFullName] DESC'
                        WHEN 'LocationID' THEN '[aspnet_Users].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[aspnet_Users].[LocationID] DESC'
                        WHEN 'ExtnNo' THEN '[aspnet_Users].[ExtnNo]'
                        WHEN 'ExtnNo DESC' THEN '[aspnet_Users].[ExtnNo] DESC'
                        WHEN 'MobileNo' THEN '[aspnet_Users].[MobileNo]'
                        WHEN 'MobileNo DESC' THEN '[aspnet_Users].[MobileNo] DESC'
                        WHEN 'EMailID' THEN '[aspnet_Users].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[aspnet_Users].[EMailID] DESC'
                        WHEN 'AST_Locations1_LocationID' THEN '[AST_Locations1].[LocationID]'
                        WHEN 'AST_Locations1_LocationID DESC' THEN '[AST_Locations1].[LocationID] DESC'
                        WHEN 'AST_Locations1_Descriptions' THEN '[AST_Locations1].[Descriptions]'
                        WHEN 'AST_Locations1_Descriptions DESC' THEN '[AST_Locations1].[Descriptions] DESC'
                        ELSE '[aspnet_Users].[UserName]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[aspnet_Users].[UserName],
		[aspnet_Users].[UserFullName],
		[aspnet_Users].[LocationID],
		[aspnet_Users].[ExtnNo],
		[aspnet_Users].[MobileNo],
		[aspnet_Users].[EMailID],
		[aspnet_Users].[NetworkIP],
		[AST_Locations1].[LocationID] AS AST_Locations1_LocationID,
		[AST_Locations1].[Descriptions] AS AST_Locations1_Descriptions 
  FROM [aspnet_Users] 
    	INNER JOIN #PageIndex
          ON [aspnet_Users].[UserName] = #PageIndex.UserName
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations1]
    ON [aspnet_Users].[LocationID] = [AST_Locations1].[LocationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

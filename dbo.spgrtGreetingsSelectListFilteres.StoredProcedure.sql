USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtGreetingsSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @UserID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[GRT_Greetings].[UserID]'
  SET @LGSQL = @LGSQL + ', [GRT_Greetings].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [GRT_Greetings] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [GRT_Config] AS [GRT_Config1]'
  SET @LGSQL = @LGSQL + '    ON [GRT_Greetings].[UsingGreetingID] = [GRT_Config1].[GreetingID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [GRT_Greetings].[UserID] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [GRT_Greetings].[UserID] = (''' + @UserID + ''')'
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[GRT_Greetings].[UserID]'
                        WHEN 'UserID DESC' THEN '[GRT_Greetings].[UserID] DESC'
                        WHEN 'SerialNo' THEN '[GRT_Greetings].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[GRT_Greetings].[SerialNo] DESC'
                        WHEN 'ToEmailID' THEN '[GRT_Greetings].[ToEmailID]'
                        WHEN 'ToEmailID DESC' THEN '[GRT_Greetings].[ToEmailID] DESC'
                        WHEN 'ToName' THEN '[GRT_Greetings].[ToName]'
                        WHEN 'ToName DESC' THEN '[GRT_Greetings].[ToName] DESC'
                        WHEN 'SentOn' THEN '[GRT_Greetings].[SentOn]'
                        WHEN 'SentOn DESC' THEN '[GRT_Greetings].[SentOn] DESC'
                        WHEN 'UsingGreetingID' THEN '[GRT_Greetings].[UsingGreetingID]'
                        WHEN 'UsingGreetingID DESC' THEN '[GRT_Greetings].[UsingGreetingID] DESC'
                        WHEN 'GRT_Config1_Description' THEN '[GRT_Config1].[Description]'
                        WHEN 'GRT_Config1_Description DESC' THEN '[GRT_Config1].[Description] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        ELSE '[GRT_Greetings].[UserID],[GRT_Greetings].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[GRT_Greetings].[UserID] ,
		[GRT_Greetings].[SerialNo] ,
		[GRT_Greetings].[ToEmailID] ,
		[GRT_Greetings].[ToName] ,
		[GRT_Greetings].[SentOn] ,
		[GRT_Greetings].[UsingGreetingID] ,
		[GRT_Config1].[Description] AS GRT_Config1_Description,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName 
  FROM [GRT_Greetings] 
    	INNER JOIN #PageIndex
          ON [GRT_Greetings].[UserID] = #PageIndex.UserID
          AND [GRT_Greetings].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [GRT_Config] AS [GRT_Config1]
    ON [GRT_Greetings].[UsingGreetingID] = [GRT_Config1].[GreetingID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [GRT_Greetings].[UserID] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

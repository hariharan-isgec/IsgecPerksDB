USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtGreetingsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @UserID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (UserID, SerialNo)
  SELECT [GRT_Greetings].[UserID], [GRT_Greetings].[SerialNo] FROM [GRT_Greetings]
  LEFT OUTER JOIN [GRT_Config] AS [GRT_Config1]
    ON [GRT_Greetings].[UsingGreetingID] = [GRT_Config1].[GreetingID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [GRT_Greetings].[UserID] = [HRM_Employees2].[CardNo]
 WHERE  
      [GRT_Greetings].[UserID] = (@UserID)
   AND ( 
         LOWER(ISNULL([GRT_Greetings].[UserID],'')) LIKE @KeyWord1
     OR STR(ISNULL([GRT_Greetings].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Greetings].[ToEmailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Greetings].[ToName],'')) LIKE @KeyWord1
     OR STR(ISNULL([GRT_Greetings].[UsingGreetingID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [GRT_Greetings].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [GRT_Greetings].[UserID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [GRT_Greetings].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [GRT_Greetings].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ToEmailID' THEN [GRT_Greetings].[ToEmailID] END,
     CASE @OrderBy WHEN 'ToEmailID DESC' THEN [GRT_Greetings].[ToEmailID] END DESC,
     CASE @OrderBy WHEN 'ToName' THEN [GRT_Greetings].[ToName] END,
     CASE @OrderBy WHEN 'ToName DESC' THEN [GRT_Greetings].[ToName] END DESC,
     CASE @OrderBy WHEN 'SentOn' THEN [GRT_Greetings].[SentOn] END,
     CASE @OrderBy WHEN 'SentOn DESC' THEN [GRT_Greetings].[SentOn] END DESC,
     CASE @OrderBy WHEN 'UsingGreetingID' THEN [GRT_Greetings].[UsingGreetingID] END,
     CASE @OrderBy WHEN 'UsingGreetingID DESC' THEN [GRT_Greetings].[UsingGreetingID] END DESC,
     CASE @OrderBy WHEN 'GRT_Config1_Description' THEN [GRT_Config1].[Description] END,
     CASE @OrderBy WHEN 'GRT_Config1_Description DESC' THEN [GRT_Config1].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC 

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

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadm_LG_ITEventTransactionsSelectPendingListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,EventID Int NOT NULL
  )
  INSERT INTO #PageIndex (EventID)
  SELECT [ADM_ITEventTransactions].[EventID] FROM [ADM_ITEventTransactions]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ADM_ITEventTransactions].[CardNo] = [HRM_Employees1].[CardNo]
 WHERE  [ADM_ITEventTransactions].[Completed] = 0 AND   
   ( 
         STR(ISNULL([ADM_ITEventTransactions].[EventID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITEventTransactions].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITEventTransactions].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'EventID' THEN [ADM_ITEventTransactions].[EventID] END,
     CASE @orderBy WHEN 'EventID DESC' THEN [ADM_ITEventTransactions].[EventID] END DESC,
     CASE @orderBy WHEN 'EventDate' THEN [ADM_ITEventTransactions].[EventDate] END,
     CASE @orderBy WHEN 'EventDate DESC' THEN [ADM_ITEventTransactions].[EventDate] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ADM_ITEventTransactions].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ADM_ITEventTransactions].[CardNo] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ITEventTransactions].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ITEventTransactions].[Description] END DESC,
     CASE @orderBy WHEN 'Completed' THEN [ADM_ITEventTransactions].[Completed] END,
     CASE @orderBy WHEN 'Completed DESC' THEN [ADM_ITEventTransactions].[Completed] END DESC,
     CASE @orderBy WHEN 'CompletedOn' THEN [ADM_ITEventTransactions].[CompletedOn] END,
     CASE @orderBy WHEN 'CompletedOn DESC' THEN [ADM_ITEventTransactions].[CompletedOn] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID' THEN [HRM_Employees1].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID DESC' THEN [HRM_Employees1].[C_OfficeID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_ITEventTransactions].[EventID],
		[ADM_ITEventTransactions].[EventDate],
		[ADM_ITEventTransactions].[CardNo],
		[ADM_ITEventTransactions].[Description],
		[ADM_ITEventTransactions].[Completed],
		[ADM_ITEventTransactions].[CompletedOn],
		[ADM_ITEventTransactions].[EntryDate],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID 
  FROM [ADM_ITEventTransactions] 
    	INNER JOIN #PageIndex
          ON [ADM_ITEventTransactions].[EventID] = #PageIndex.EventID
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ADM_ITEventTransactions].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

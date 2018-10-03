USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventTransactionsSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,EventID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'EventID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ITEventTransactions].[EventID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ITEventTransactions] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITEventTransactions].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_ITEventTransactions].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'EventID' THEN '[ADM_ITEventTransactions].[EventID]'
                        WHEN 'EventID DESC' THEN '[ADM_ITEventTransactions].[EventID] DESC'
                        WHEN 'EventDate' THEN '[ADM_ITEventTransactions].[EventDate]'
                        WHEN 'EventDate DESC' THEN '[ADM_ITEventTransactions].[EventDate] DESC'
                        WHEN 'CardNo' THEN '[ADM_ITEventTransactions].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ADM_ITEventTransactions].[CardNo] DESC'
                        WHEN 'Description' THEN '[ADM_ITEventTransactions].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_ITEventTransactions].[Description] DESC'
                        WHEN 'Completed' THEN '[ADM_ITEventTransactions].[Completed]'
                        WHEN 'Completed DESC' THEN '[ADM_ITEventTransactions].[Completed] DESC'
                        WHEN 'CompletedOn' THEN '[ADM_ITEventTransactions].[CompletedOn]'
                        WHEN 'CompletedOn DESC' THEN '[ADM_ITEventTransactions].[CompletedOn] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees1_C_OfficeID' THEN '[HRM_Employees1].[C_OfficeID]'
                        WHEN 'HRM_Employees1_C_OfficeID DESC' THEN '[HRM_Employees1].[C_OfficeID] DESC'
                        ELSE '[ADM_ITEventTransactions].[EventID]'
                    END
  EXEC (@LGSQL)

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

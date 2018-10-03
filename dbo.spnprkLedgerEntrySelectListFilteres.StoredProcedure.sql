USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkLedgerEntrySelectListFilteres]
  @Filter_EmployeeID Int,
  @Filter_PerkID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,DocumentID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DocumentID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_Ledger].[DocumentID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_Ledger] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Ledger].[EmployeeID] = [PRK_Employees1].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees2].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Ledger].[FinYear] = [PRK_FinYears4].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks5]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Ledger].[PerkID] = [PRK_Perks5].[PerkID]'
  SET @LGSQL = @LGSQL + '  WHERE [PRK_Ledger].[TranType] IN (''OPB'',''ADJ'')  '
  SET @LGSQL = @LGSQL + ' AND [PRK_Ledger].[FinYear] = ''' + STR(@FinYear) + '''' 
  IF (@Filter_EmployeeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Ledger].[EmployeeID] = ' + STR(@Filter_EmployeeID)
  IF (@Filter_PerkID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Ledger].[PerkID] = ' + STR(@Filter_PerkID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DocumentID' THEN '[PRK_Ledger].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[PRK_Ledger].[DocumentID] DESC'
                        WHEN 'EmployeeID' THEN '[PRK_Ledger].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[PRK_Ledger].[EmployeeID] DESC'
                        WHEN 'PerkID' THEN '[PRK_Ledger].[PerkID]'
                        WHEN 'PerkID DESC' THEN '[PRK_Ledger].[PerkID] DESC'
                        WHEN 'TranType' THEN '[PRK_Ledger].[TranType]'
                        WHEN 'TranType DESC' THEN '[PRK_Ledger].[TranType] DESC'
                        WHEN 'PostedInBaaN' THEN '[PRK_Ledger].[PostedInBaaN]'
                        WHEN 'PostedInBaaN DESC' THEN '[PRK_Ledger].[PostedInBaaN] DESC'
                        WHEN 'Amount' THEN '[PRK_Ledger].[Amount]'
                        WHEN 'Amount DESC' THEN '[PRK_Ledger].[Amount] DESC'
                        WHEN 'Remarks' THEN '[PRK_Ledger].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PRK_Ledger].[Remarks] DESC'
                        WHEN 'Value' THEN '[PRK_Ledger].[Value]'
                        WHEN 'Value DESC' THEN '[PRK_Ledger].[Value] DESC'
                        WHEN 'FinYear' THEN '[PRK_Ledger].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_Ledger].[FinYear] DESC'
                        WHEN 'ParentDocumentID' THEN '[PRK_Ledger].[ParentDocumentID]'
                        WHEN 'ParentDocumentID DESC' THEN '[PRK_Ledger].[ParentDocumentID] DESC'
                        WHEN 'UOM' THEN '[PRK_Ledger].[UOM]'
                        WHEN 'UOM DESC' THEN '[PRK_Ledger].[UOM] DESC'
                        WHEN 'CreatedBy' THEN '[PRK_Ledger].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[PRK_Ledger].[CreatedBy] DESC'
                        WHEN 'TranDate' THEN '[PRK_Ledger].[TranDate]'
                        WHEN 'TranDate DESC' THEN '[PRK_Ledger].[TranDate] DESC'
                        WHEN 'PRK_Employees1_EmployeeName' THEN '[PRK_Employees1].[EmployeeName]'
                        WHEN 'PRK_Employees1_EmployeeName DESC' THEN '[PRK_Employees1].[EmployeeName] DESC'
                        WHEN 'PRK_Employees2_EmployeeName' THEN '[PRK_Employees2].[EmployeeName]'
                        WHEN 'PRK_Employees2_EmployeeName DESC' THEN '[PRK_Employees2].[EmployeeName] DESC'
                        WHEN 'PRK_FinYears4_Description' THEN '[PRK_FinYears4].[Description]'
                        WHEN 'PRK_FinYears4_Description DESC' THEN '[PRK_FinYears4].[Description] DESC'
                        WHEN 'PRK_Perks5_Description' THEN '[PRK_Perks5].[Description]'
                        WHEN 'PRK_Perks5_Description DESC' THEN '[PRK_Perks5].[Description] DESC'
                        ELSE '[PRK_Ledger].[DocumentID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PRK_Ledger].* ,
    [PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
    [PRK_Employees2].[EmployeeName] AS PRK_Employees2_EmployeeName,
    [PRK_FinYears4].[Description] AS PRK_FinYears4_Description,
    [PRK_Perks5].[Description] AS PRK_Perks5_Description 
  FROM [PRK_Ledger] 
      INNER JOIN #PageIndex
          ON [PRK_Ledger].[DocumentID] = #PageIndex.DocumentID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Ledger].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees2].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Ledger].[FinYear] = [PRK_FinYears4].[FinYear]
  INNER JOIN [PRK_Perks] AS [PRK_Perks5]
    ON [PRK_Ledger].[PerkID] = [PRK_Perks5].[PerkID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

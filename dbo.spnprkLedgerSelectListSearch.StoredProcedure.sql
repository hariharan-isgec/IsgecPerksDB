USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkLedgerSelectListSearch]
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
 ,DocumentID Int NOT NULL
  )
  INSERT INTO #PageIndex (DocumentID)
  SELECT [PRK_Ledger].[DocumentID] FROM [PRK_Ledger]
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Ledger].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees2].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Ledger].[PostedBy] = [PRK_Employees3].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Ledger].[FinYear] = [PRK_FinYears4].[FinYear]
  INNER JOIN [PRK_Perks] AS [PRK_Perks5]
    ON [PRK_Ledger].[PerkID] = [PRK_Perks5].[PerkID]
 WHERE  
   ( 
         STR(ISNULL([PRK_Ledger].[DocumentID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[PerkID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[TranType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[Value], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[UOM],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[Amount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[CreatedBy], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[ParentDocumentID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[ApplicationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[PostedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[BatchNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[VoucherNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[VoucherLineNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DocumentID' THEN [PRK_Ledger].[DocumentID] END,
     CASE @OrderBy WHEN 'DocumentID DESC' THEN [PRK_Ledger].[DocumentID] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [PRK_Ledger].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [PRK_Ledger].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'PerkID' THEN [PRK_Ledger].[PerkID] END,
     CASE @OrderBy WHEN 'PerkID DESC' THEN [PRK_Ledger].[PerkID] END DESC,
     CASE @OrderBy WHEN 'TranType' THEN [PRK_Ledger].[TranType] END,
     CASE @OrderBy WHEN 'TranType DESC' THEN [PRK_Ledger].[TranType] END DESC,
     CASE @OrderBy WHEN 'TranDate' THEN [PRK_Ledger].[TranDate] END,
     CASE @OrderBy WHEN 'TranDate DESC' THEN [PRK_Ledger].[TranDate] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [PRK_Ledger].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PRK_Ledger].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Value' THEN [PRK_Ledger].[Value] END,
     CASE @OrderBy WHEN 'Value DESC' THEN [PRK_Ledger].[Value] END DESC,
     CASE @OrderBy WHEN 'UOM' THEN [PRK_Ledger].[UOM] END,
     CASE @OrderBy WHEN 'UOM DESC' THEN [PRK_Ledger].[UOM] END DESC,
     CASE @OrderBy WHEN 'Amount' THEN [PRK_Ledger].[Amount] END,
     CASE @OrderBy WHEN 'Amount DESC' THEN [PRK_Ledger].[Amount] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PRK_Ledger].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PRK_Ledger].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [PRK_Ledger].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [PRK_Ledger].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'ParentDocumentID' THEN [PRK_Ledger].[ParentDocumentID] END,
     CASE @OrderBy WHEN 'ParentDocumentID DESC' THEN [PRK_Ledger].[ParentDocumentID] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [PRK_Ledger].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [PRK_Ledger].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'PostedInBaaN' THEN [PRK_Ledger].[PostedInBaaN] END,
     CASE @OrderBy WHEN 'PostedInBaaN DESC' THEN [PRK_Ledger].[PostedInBaaN] END DESC,
     CASE @OrderBy WHEN 'PostedOn' THEN [PRK_Ledger].[PostedOn] END,
     CASE @OrderBy WHEN 'PostedOn DESC' THEN [PRK_Ledger].[PostedOn] END DESC,
     CASE @OrderBy WHEN 'PostedBy' THEN [PRK_Ledger].[PostedBy] END,
     CASE @OrderBy WHEN 'PostedBy DESC' THEN [PRK_Ledger].[PostedBy] END DESC,
     CASE @OrderBy WHEN 'BatchNo' THEN [PRK_Ledger].[BatchNo] END,
     CASE @OrderBy WHEN 'BatchNo DESC' THEN [PRK_Ledger].[BatchNo] END DESC,
     CASE @OrderBy WHEN 'VoucherNo' THEN [PRK_Ledger].[VoucherNo] END,
     CASE @OrderBy WHEN 'VoucherNo DESC' THEN [PRK_Ledger].[VoucherNo] END DESC,
     CASE @OrderBy WHEN 'VoucherLineNo' THEN [PRK_Ledger].[VoucherLineNo] END,
     CASE @OrderBy WHEN 'VoucherLineNo DESC' THEN [PRK_Ledger].[VoucherLineNo] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees1_EmployeeName' THEN [PRK_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees1_EmployeeName DESC' THEN [PRK_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees2_EmployeeName' THEN [PRK_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees2_EmployeeName DESC' THEN [PRK_Employees2].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees3_EmployeeName' THEN [PRK_Employees3].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees3_EmployeeName DESC' THEN [PRK_Employees3].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_FinYears4_Description' THEN [PRK_FinYears4].[Description] END,
     CASE @OrderBy WHEN 'PRK_FinYears4_Description DESC' THEN [PRK_FinYears4].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_Perks5_Description' THEN [PRK_Perks5].[Description] END,
     CASE @OrderBy WHEN 'PRK_Perks5_Description DESC' THEN [PRK_Perks5].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_Ledger].* ,
    [PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
    [PRK_Employees2].[EmployeeName] AS PRK_Employees2_EmployeeName,
    [PRK_Employees3].[EmployeeName] AS PRK_Employees3_EmployeeName,
    [PRK_FinYears4].[Description] AS PRK_FinYears4_Description,
    [PRK_Perks5].[Description] AS PRK_Perks5_Description 
  FROM [PRK_Ledger] 
      INNER JOIN #PageIndex
          ON [PRK_Ledger].[DocumentID] = #PageIndex.DocumentID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Ledger].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees2].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Ledger].[PostedBy] = [PRK_Employees3].[EmployeeID]
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

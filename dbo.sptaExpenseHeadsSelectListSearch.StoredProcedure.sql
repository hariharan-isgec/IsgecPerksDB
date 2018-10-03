USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaExpenseHeadsSelectListSearch]
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
 ,ExpenseHeadID Int NOT NULL
  )
  INSERT INTO #PageIndex (ExpenseHeadID)
  SELECT [TA_ExpenseHeads].[ExpenseHeadID] FROM [TA_ExpenseHeads]
 WHERE  
   ( 
         STR(ISNULL([TA_ExpenseHeads].[ExpenseHeadID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_ExpenseHeads].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ExpenseHeadID' THEN [TA_ExpenseHeads].[ExpenseHeadID] END,
     CASE @OrderBy WHEN 'ExpenseHeadID DESC' THEN [TA_ExpenseHeads].[ExpenseHeadID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_ExpenseHeads].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_ExpenseHeads].[Description] END DESC,
     CASE @OrderBy WHEN 'OneTimeInTour' THEN [TA_ExpenseHeads].[OneTimeInTour] END,
     CASE @OrderBy WHEN 'OneTimeInTour DESC' THEN [TA_ExpenseHeads].[OneTimeInTour] END DESC,
     CASE @OrderBy WHEN 'RequiresMDApproval' THEN [TA_ExpenseHeads].[RequiresMDApproval] END,
     CASE @OrderBy WHEN 'RequiresMDApproval DESC' THEN [TA_ExpenseHeads].[RequiresMDApproval] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_ExpenseHeads].[ExpenseHeadID] ,
		[TA_ExpenseHeads].[Description] ,
		[TA_ExpenseHeads].[OneTimeInTour] ,
		[TA_ExpenseHeads].[RequiresMDApproval]  
  FROM [TA_ExpenseHeads] 
      INNER JOIN #PageIndex
          ON [TA_ExpenseHeads].[ExpenseHeadID] = #PageIndex.ExpenseHeadID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

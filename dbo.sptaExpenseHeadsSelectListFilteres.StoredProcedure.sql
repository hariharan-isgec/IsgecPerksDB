USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaExpenseHeadsSelectListFilteres]
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
 ,ExpenseHeadID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ExpenseHeadID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_ExpenseHeads].[ExpenseHeadID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_ExpenseHeads] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ExpenseHeadID' THEN '[TA_ExpenseHeads].[ExpenseHeadID]'
                        WHEN 'ExpenseHeadID DESC' THEN '[TA_ExpenseHeads].[ExpenseHeadID] DESC'
                        WHEN 'Description' THEN '[TA_ExpenseHeads].[Description]'
                        WHEN 'Description DESC' THEN '[TA_ExpenseHeads].[Description] DESC'
                        WHEN 'OneTimeInTour' THEN '[TA_ExpenseHeads].[OneTimeInTour]'
                        WHEN 'OneTimeInTour DESC' THEN '[TA_ExpenseHeads].[OneTimeInTour] DESC'
                        WHEN 'RequiresMDApproval' THEN '[TA_ExpenseHeads].[RequiresMDApproval]'
                        WHEN 'RequiresMDApproval DESC' THEN '[TA_ExpenseHeads].[RequiresMDApproval] DESC'
                        ELSE '[TA_ExpenseHeads].[ExpenseHeadID]'
                    END
  EXEC (@LGSQL)

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

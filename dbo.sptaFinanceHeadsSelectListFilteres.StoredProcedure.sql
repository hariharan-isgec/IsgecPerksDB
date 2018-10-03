USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaFinanceHeadsSelectListFilteres]
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
 ,FinanceHeadID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinanceHeadID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_FinanceHeads].[FinanceHeadID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_FinanceHeads] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinanceHeadID' THEN '[TA_FinanceHeads].[FinanceHeadID]'
                        WHEN 'FinanceHeadID DESC' THEN '[TA_FinanceHeads].[FinanceHeadID] DESC'
                        WHEN 'Description' THEN '[TA_FinanceHeads].[Description]'
                        WHEN 'Description DESC' THEN '[TA_FinanceHeads].[Description] DESC'
                        ELSE '[TA_FinanceHeads].[FinanceHeadID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_FinanceHeads].[FinanceHeadID] ,
		[TA_FinanceHeads].[Description]  
  FROM [TA_FinanceHeads] 
      INNER JOIN #PageIndex
          ON [TA_FinanceHeads].[FinanceHeadID] = #PageIndex.FinanceHeadID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillTypesSelectListFilteres]
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
 ,BillTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BillTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_DetentionBillTypes].[BillTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_DetentionBillTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BillTypeID' THEN '[ELOG_DetentionBillTypes].[BillTypeID]'
                        WHEN 'BillTypeID DESC' THEN '[ELOG_DetentionBillTypes].[BillTypeID] DESC'
                        WHEN 'Description' THEN '[ELOG_DetentionBillTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_DetentionBillTypes].[Description] DESC'
                        ELSE '[ELOG_DetentionBillTypes].[BillTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_DetentionBillTypes].*  
  FROM [ELOG_DetentionBillTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_DetentionBillTypes].[BillTypeID] = #PageIndex.BillTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

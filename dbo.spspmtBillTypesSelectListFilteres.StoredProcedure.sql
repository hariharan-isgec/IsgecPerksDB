USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillTypesSelectListFilteres]
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
 ,BillType Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BillType'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_BillTypes].[BillType]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_BillTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BillType' THEN '[SPMT_BillTypes].[BillType]'
                        WHEN 'BillType DESC' THEN '[SPMT_BillTypes].[BillType] DESC'
                        WHEN 'Description' THEN '[SPMT_BillTypes].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_BillTypes].[Description] DESC'
                        ELSE '[SPMT_BillTypes].[BillType]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_BillTypes].*  
  FROM [SPMT_BillTypes] 
      INNER JOIN #PageIndex
          ON [SPMT_BillTypes].[BillType] = #PageIndex.BillType
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPUnitsSelectListFilteres]
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
 ,UOM NVarChar(3) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UOM'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_ERPUnits].[UOM]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_ERPUnits] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UOM' THEN '[SPMT_ERPUnits].[UOM]'
                        WHEN 'UOM DESC' THEN '[SPMT_ERPUnits].[UOM] DESC'
                        WHEN 'Description' THEN '[SPMT_ERPUnits].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_ERPUnits].[Description] DESC'
                        ELSE '[SPMT_ERPUnits].[UOM]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_ERPUnits].*  
  FROM [SPMT_ERPUnits] 
      INNER JOIN #PageIndex
          ON [SPMT_ERPUnits].[UOM] = #PageIndex.UOM
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

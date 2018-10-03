USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtHSNSACCodesSelectListFilteres]
  @Filter_BillType Int,
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
 ,HSNSACCode NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BillType'
  SET @LGSQL = @LGSQL + ', HSNSACCode'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_HSNSACCodes].[BillType]'
  SET @LGSQL = @LGSQL + ', [SPMT_HSNSACCodes].[HSNSACCode]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_HSNSACCodes] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_HSNSACCodes].[BillType] = [SPMT_BillTypes1].[BillType]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_BillType > 0) 
    SET @LGSQL = @LGSQL + ' AND [SPMT_HSNSACCodes].[BillType] = ' + STR(@Filter_BillType)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BillType' THEN '[SPMT_HSNSACCodes].[BillType]'
                        WHEN 'BillType DESC' THEN '[SPMT_HSNSACCodes].[BillType] DESC'
                        WHEN 'HSNSACCode' THEN '[SPMT_HSNSACCodes].[HSNSACCode]'
                        WHEN 'HSNSACCode DESC' THEN '[SPMT_HSNSACCodes].[HSNSACCode] DESC'
                        WHEN 'Description' THEN '[SPMT_HSNSACCodes].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_HSNSACCodes].[Description] DESC'
                        WHEN 'TaxRate' THEN '[SPMT_HSNSACCodes].[TaxRate]'
                        WHEN 'TaxRate DESC' THEN '[SPMT_HSNSACCodes].[TaxRate] DESC'
                        WHEN 'SPMT_BillTypes1_Description' THEN '[SPMT_BillTypes1].[Description]'
                        WHEN 'SPMT_BillTypes1_Description DESC' THEN '[SPMT_BillTypes1].[Description] DESC'
                        ELSE '[SPMT_HSNSACCodes].[BillType],[SPMT_HSNSACCodes].[HSNSACCode]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_HSNSACCodes].* ,
    [SPMT_BillTypes1].[Description] AS SPMT_BillTypes1_Description 
  FROM [SPMT_HSNSACCodes] 
      INNER JOIN #PageIndex
          ON [SPMT_HSNSACCodes].[BillType] = #PageIndex.BillType
          AND [SPMT_HSNSACCodes].[HSNSACCode] = #PageIndex.HSNSACCode
  INNER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]
    ON [SPMT_HSNSACCodes].[BillType] = [SPMT_BillTypes1].[BillType]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

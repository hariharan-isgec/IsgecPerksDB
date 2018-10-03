USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCodesSelectListFilteres]
  @Filter_ChargeCategoryID Int,
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
 ,ChargeCategoryID Int NOT NULL
 ,ChargeCodeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ChargeCategoryID'
  SET @LGSQL = @LGSQL + ', ChargeCodeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_ChargeCodes].[ChargeCategoryID]'
  SET @LGSQL = @LGSQL + ', [ELOG_ChargeCodes].[ChargeCodeID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_ChargeCodes] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ELOG_ChargeCategories] AS [ELOG_ChargeCategories1]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_ChargeCodes].[ChargeCategoryID] = [ELOG_ChargeCategories1].[ChargeCategoryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ChargeCategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_ChargeCodes].[ChargeCategoryID] = ' + STR(@Filter_ChargeCategoryID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ChargeCategoryID' THEN '[ELOG_ChargeCodes].[ChargeCategoryID]'
                        WHEN 'ChargeCategoryID DESC' THEN '[ELOG_ChargeCodes].[ChargeCategoryID] DESC'
                        WHEN 'ChargeCodeID' THEN '[ELOG_ChargeCodes].[ChargeCodeID]'
                        WHEN 'ChargeCodeID DESC' THEN '[ELOG_ChargeCodes].[ChargeCodeID] DESC'
                        WHEN 'Description' THEN '[ELOG_ChargeCodes].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_ChargeCodes].[Description] DESC'
                        WHEN 'ELOG_ChargeCategories1_Description' THEN '[ELOG_ChargeCategories1].[Description]'
                        WHEN 'ELOG_ChargeCategories1_Description DESC' THEN '[ELOG_ChargeCategories1].[Description] DESC'
                        ELSE '[ELOG_ChargeCodes].[ChargeCategoryID],[ELOG_ChargeCodes].[ChargeCodeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_ChargeCodes].* ,
    [ELOG_ChargeCategories1].[Description] AS ELOG_ChargeCategories1_Description 
  FROM [ELOG_ChargeCodes] 
      INNER JOIN #PageIndex
          ON [ELOG_ChargeCodes].[ChargeCategoryID] = #PageIndex.ChargeCategoryID
          AND [ELOG_ChargeCodes].[ChargeCodeID] = #PageIndex.ChargeCodeID
  INNER JOIN [ELOG_ChargeCategories] AS [ELOG_ChargeCategories1]
    ON [ELOG_ChargeCodes].[ChargeCategoryID] = [ELOG_ChargeCategories1].[ChargeCategoryID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

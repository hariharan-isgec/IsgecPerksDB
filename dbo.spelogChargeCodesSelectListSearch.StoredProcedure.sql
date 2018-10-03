USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCodesSelectListSearch]
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
 ,ChargeCategoryID Int NOT NULL
 ,ChargeCodeID Int NOT NULL
  )
  INSERT INTO #PageIndex (ChargeCategoryID, ChargeCodeID)
  SELECT [ELOG_ChargeCodes].[ChargeCategoryID], [ELOG_ChargeCodes].[ChargeCodeID] FROM [ELOG_ChargeCodes]
  INNER JOIN [ELOG_ChargeCategories] AS [ELOG_ChargeCategories1]
    ON [ELOG_ChargeCodes].[ChargeCategoryID] = [ELOG_ChargeCategories1].[ChargeCategoryID]
 WHERE  
   ( 
         STR(ISNULL([ELOG_ChargeCodes].[ChargeCategoryID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_ChargeCodes].[ChargeCodeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_ChargeCodes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ChargeCategoryID' THEN [ELOG_ChargeCodes].[ChargeCategoryID] END,
     CASE @OrderBy WHEN 'ChargeCategoryID DESC' THEN [ELOG_ChargeCodes].[ChargeCategoryID] END DESC,
     CASE @OrderBy WHEN 'ChargeCodeID' THEN [ELOG_ChargeCodes].[ChargeCodeID] END,
     CASE @OrderBy WHEN 'ChargeCodeID DESC' THEN [ELOG_ChargeCodes].[ChargeCodeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_ChargeCodes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_ChargeCodes].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ChargeCategories1_Description' THEN [ELOG_ChargeCategories1].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ChargeCategories1_Description DESC' THEN [ELOG_ChargeCategories1].[Description] END DESC 

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

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtHSNSACCodesSelectListSearch]
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
 ,BillType Int NOT NULL
 ,HSNSACCode NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (BillType, HSNSACCode)
  SELECT [SPMT_HSNSACCodes].[BillType], [SPMT_HSNSACCodes].[HSNSACCode] FROM [SPMT_HSNSACCodes]
  INNER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]
    ON [SPMT_HSNSACCodes].[BillType] = [SPMT_BillTypes1].[BillType]
 WHERE  
   ( 
         STR(ISNULL([SPMT_HSNSACCodes].[BillType], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_HSNSACCodes].[HSNSACCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_HSNSACCodes].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_HSNSACCodes].[TaxRate], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BillType' THEN [SPMT_HSNSACCodes].[BillType] END,
     CASE @OrderBy WHEN 'BillType DESC' THEN [SPMT_HSNSACCodes].[BillType] END DESC,
     CASE @OrderBy WHEN 'HSNSACCode' THEN [SPMT_HSNSACCodes].[HSNSACCode] END,
     CASE @OrderBy WHEN 'HSNSACCode DESC' THEN [SPMT_HSNSACCodes].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_HSNSACCodes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_HSNSACCodes].[Description] END DESC,
     CASE @OrderBy WHEN 'TaxRate' THEN [SPMT_HSNSACCodes].[TaxRate] END,
     CASE @OrderBy WHEN 'TaxRate DESC' THEN [SPMT_HSNSACCodes].[TaxRate] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillTypes1_Description' THEN [SPMT_BillTypes1].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillTypes1_Description DESC' THEN [SPMT_BillTypes1].[Description] END DESC 

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

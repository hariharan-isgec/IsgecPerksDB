USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillTypesSelectListSearch]
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
  )
  INSERT INTO #PageIndex (BillType)
  SELECT [SPMT_BillTypes].[BillType] FROM [SPMT_BillTypes]
 WHERE  
   ( 
         STR(ISNULL([SPMT_BillTypes].[BillType], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_BillTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BillType' THEN [SPMT_BillTypes].[BillType] END,
     CASE @OrderBy WHEN 'BillType DESC' THEN [SPMT_BillTypes].[BillType] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_BillTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_BillTypes].[Description] END DESC 

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

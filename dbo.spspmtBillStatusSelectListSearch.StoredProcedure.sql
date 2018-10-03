USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillStatusSelectListSearch]
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
 ,BillStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (BillStatusID)
  SELECT [SPMT_BillStatus].[BillStatusID] FROM [SPMT_BillStatus]
 WHERE  
   ( 
         STR(ISNULL([SPMT_BillStatus].[BillStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_BillStatus].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_BillStatus].[NextStatusID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BillStatusID' THEN [SPMT_BillStatus].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [SPMT_BillStatus].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_BillStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_BillStatus].[Description] END DESC,
     CASE @OrderBy WHEN 'NextStatusID' THEN [SPMT_BillStatus].[NextStatusID] END,
     CASE @OrderBy WHEN 'NextStatusID DESC' THEN [SPMT_BillStatus].[NextStatusID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SPMT_BillStatus].*  
  FROM [SPMT_BillStatus] 
      INNER JOIN #PageIndex
          ON [SPMT_BillStatus].[BillStatusID] = #PageIndex.BillStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPUnitsSelectListSearch]
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
 ,UOM NVarChar(3) NOT NULL
  )
  INSERT INTO #PageIndex (UOM)
  SELECT [SPMT_ERPUnits].[UOM] FROM [SPMT_ERPUnits]
 WHERE  
   ( 
         LOWER(ISNULL([SPMT_ERPUnits].[UOM],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ERPUnits].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UOM' THEN [SPMT_ERPUnits].[UOM] END,
     CASE @OrderBy WHEN 'UOM DESC' THEN [SPMT_ERPUnits].[UOM] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_ERPUnits].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_ERPUnits].[Description] END DESC 

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

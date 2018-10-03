USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakInventoryStatusSelectListSearch]
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
 ,InventoryStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (InventoryStatusID)
  SELECT [PAK_InventoryStatus].[InventoryStatusID] FROM [PAK_InventoryStatus]
 WHERE  
   ( 
         STR(ISNULL([PAK_InventoryStatus].[InventoryStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_InventoryStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'InventoryStatusID' THEN [PAK_InventoryStatus].[InventoryStatusID] END,
     CASE @OrderBy WHEN 'InventoryStatusID DESC' THEN [PAK_InventoryStatus].[InventoryStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_InventoryStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_InventoryStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_InventoryStatus].*  
  FROM [PAK_InventoryStatus] 
      INNER JOIN #PageIndex
          ON [PAK_InventoryStatus].[InventoryStatusID] = #PageIndex.InventoryStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

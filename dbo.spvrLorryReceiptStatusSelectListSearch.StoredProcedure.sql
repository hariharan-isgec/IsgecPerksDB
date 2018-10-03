USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptStatusSelectListSearch]
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
 ,LRStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (LRStatusID)
  SELECT [VR_LorryReceiptStatus].[LRStatusID] FROM [VR_LorryReceiptStatus]
 WHERE  
   ( 
         STR(ISNULL([VR_LorryReceiptStatus].[LRStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceiptStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'LRStatusID' THEN [VR_LorryReceiptStatus].[LRStatusID] END,
     CASE @OrderBy WHEN 'LRStatusID DESC' THEN [VR_LorryReceiptStatus].[LRStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_LorryReceiptStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_LorryReceiptStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [VR_LorryReceiptStatus].*  
  FROM [VR_LorryReceiptStatus] 
      INNER JOIN #PageIndex
          ON [VR_LorryReceiptStatus].[LRStatusID] = #PageIndex.LRStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReceiveStatusSelectListSearch]
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
 ,ReceiveStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (ReceiveStatusID)
  SELECT [PAK_ReceiveStatus].[ReceiveStatusID] FROM [PAK_ReceiveStatus]
 WHERE  
   ( 
         STR(ISNULL([PAK_ReceiveStatus].[ReceiveStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_ReceiveStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ReceiveStatusID' THEN [PAK_ReceiveStatus].[ReceiveStatusID] END,
     CASE @OrderBy WHEN 'ReceiveStatusID DESC' THEN [PAK_ReceiveStatus].[ReceiveStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_ReceiveStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_ReceiveStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_ReceiveStatus].*  
  FROM [PAK_ReceiveStatus] 
      INNER JOIN #PageIndex
          ON [PAK_ReceiveStatus].[ReceiveStatusID] = #PageIndex.ReceiveStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

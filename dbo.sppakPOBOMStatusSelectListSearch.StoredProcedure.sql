USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBOMStatusSelectListSearch]
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
 ,StatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [PAK_POBOMStatus].[StatusID] FROM [PAK_POBOMStatus]
 WHERE  
   ( 
         STR(ISNULL([PAK_POBOMStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOMStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [PAK_POBOMStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PAK_POBOMStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_POBOMStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_POBOMStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_POBOMStatus].*  
  FROM [PAK_POBOMStatus] 
      INNER JOIN #PageIndex
          ON [PAK_POBOMStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

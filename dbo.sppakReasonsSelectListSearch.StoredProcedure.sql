USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReasonsSelectListSearch]
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
 ,ReasonID Int NOT NULL
  )
  INSERT INTO #PageIndex (ReasonID)
  SELECT [PAK_Reasons].[ReasonID] FROM [PAK_Reasons]
 WHERE  
   ( 
         STR(ISNULL([PAK_Reasons].[ReasonID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Reasons].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [PAK_Reasons].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [PAK_Reasons].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_Reasons].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_Reasons].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_Reasons].*  
  FROM [PAK_Reasons] 
      INNER JOIN #PageIndex
          ON [PAK_Reasons].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

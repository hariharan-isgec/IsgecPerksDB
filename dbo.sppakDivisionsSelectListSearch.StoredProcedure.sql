USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDivisionsSelectListSearch]
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
 ,DivisionID Int NOT NULL
  )
  INSERT INTO #PageIndex (DivisionID)
  SELECT [PAK_Divisions].[DivisionID] FROM [PAK_Divisions]
 WHERE  
   ( 
         STR(ISNULL([PAK_Divisions].[DivisionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Divisions].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DivisionID' THEN [PAK_Divisions].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [PAK_Divisions].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_Divisions].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_Divisions].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_Divisions].*  
  FROM [PAK_Divisions] 
      INNER JOIN #PageIndex
          ON [PAK_Divisions].[DivisionID] = #PageIndex.DivisionID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

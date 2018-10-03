USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostDivisionsSelectListSearch]
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
  SELECT [COST_Divisions].[DivisionID] FROM [COST_Divisions]
 WHERE  
   ( 
         STR(ISNULL([COST_Divisions].[DivisionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_Divisions].[DivisionName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DivisionID' THEN [COST_Divisions].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [COST_Divisions].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'DivisionName' THEN [COST_Divisions].[DivisionName] END,
     CASE @OrderBy WHEN 'DivisionName DESC' THEN [COST_Divisions].[DivisionName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_Divisions].*  
  FROM [COST_Divisions] 
      INNER JOIN #PageIndex
          ON [COST_Divisions].[DivisionID] = #PageIndex.DivisionID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

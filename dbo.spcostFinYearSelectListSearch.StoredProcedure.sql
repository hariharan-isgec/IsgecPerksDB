USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearSelectListSearch]
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
 ,FinYear Int NOT NULL
  )
  INSERT INTO #PageIndex (FinYear)
  SELECT [COST_FinYear].[FinYear] FROM [COST_FinYear]
 WHERE  
   ( 
         STR(ISNULL([COST_FinYear].[FinYear], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_FinYear].[Descpription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [COST_FinYear].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_FinYear].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Descpription' THEN [COST_FinYear].[Descpription] END,
     CASE @OrderBy WHEN 'Descpription DESC' THEN [COST_FinYear].[Descpription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_FinYear].*  
  FROM [COST_FinYear] 
      INNER JOIN #PageIndex
          ON [COST_FinYear].[FinYear] = #PageIndex.FinYear
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkFinYearsSelectListSearch]
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
  SELECT [PRK_FinYears].[FinYear] FROM [PRK_FinYears]
 WHERE  
   ( 
         STR(ISNULL([PRK_FinYears].[FinYear], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears].[Status],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [PRK_FinYears].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PRK_FinYears].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_FinYears].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_FinYears].[Description] END DESC,
     CASE @OrderBy WHEN 'StartDate' THEN [PRK_FinYears].[StartDate] END,
     CASE @OrderBy WHEN 'StartDate DESC' THEN [PRK_FinYears].[StartDate] END DESC,
     CASE @OrderBy WHEN 'EndDate' THEN [PRK_FinYears].[EndDate] END,
     CASE @OrderBy WHEN 'EndDate DESC' THEN [PRK_FinYears].[EndDate] END DESC,
     CASE @OrderBy WHEN 'Status' THEN [PRK_FinYears].[Status] END,
     CASE @OrderBy WHEN 'Status DESC' THEN [PRK_FinYears].[Status] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_FinYears].*  
  FROM [PRK_FinYears] 
      INNER JOIN #PageIndex
          ON [PRK_FinYears].[FinYear] = #PageIndex.FinYear
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkFinYear]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  FinYear Int NOT NULL
  )
  INSERT INTO #PageIndex (FinYear)
  SELECT [PRK_FinYears].[FinYear] FROM [PRK_FinYears]
  WHERE STR(ISNULL([PRK_FinYears].[FinYear], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears].[Status],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_FinYears].[FinYear] AS SearchCode, 
  ISNULL([PRK_FinYears].[Description],'') 
  + ',' + ISNULL([PRK_FinYears].[Status],'') 
  AS SearchDescription 
  FROM [PRK_FinYears] 
    	INNER JOIN #PageIndex
          ON [PRK_FinYears].[FinYear] = #PageIndex.FinYear
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

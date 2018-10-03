USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMonthsSelectListSearch]
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
 ,MonthID Int NOT NULL
  )
  INSERT INTO #PageIndex (MonthID)
  SELECT [PRK_Months].[MonthID] FROM [PRK_Months]
 WHERE  
   ( 
         STR(ISNULL([PRK_Months].[MonthID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Months].[MonthName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'MonthID' THEN [PRK_Months].[MonthID] END,
     CASE @OrderBy WHEN 'MonthID DESC' THEN [PRK_Months].[MonthID] END DESC,
     CASE @OrderBy WHEN 'MonthName' THEN [PRK_Months].[MonthName] END,
     CASE @OrderBy WHEN 'MonthName DESC' THEN [PRK_Months].[MonthName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_Months].*  
  FROM [PRK_Months] 
      INNER JOIN #PageIndex
          ON [PRK_Months].[MonthID] = #PageIndex.MonthID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

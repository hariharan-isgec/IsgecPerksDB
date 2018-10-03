USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQuartersSelectListSearch]
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
 ,Quarter Int NOT NULL
  )
  INSERT INTO #PageIndex (Quarter)
  SELECT [COST_Quarters].[Quarter] FROM [COST_Quarters]
 WHERE  
   ( 
         STR(ISNULL([COST_Quarters].[Quarter], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_Quarters].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'Quarter' THEN [COST_Quarters].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_Quarters].[Quarter] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [COST_Quarters].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [COST_Quarters].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_Quarters].*  
  FROM [COST_Quarters] 
      INNER JOIN #PageIndex
          ON [COST_Quarters].[Quarter] = #PageIndex.Quarter
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

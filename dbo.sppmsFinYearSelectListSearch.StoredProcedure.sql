USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFinYearSelectListSearch]
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
 ,FinYear NVarChar(4) NOT NULL
  )
  INSERT INTO #PageIndex (FinYear)
  SELECT [PMS_FinYear].[FinYear] FROM [PMS_FinYear]
 WHERE  
   ( 
         LOWER(ISNULL([PMS_FinYear].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FinYear].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [PMS_FinYear].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PMS_FinYear].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PMS_FinYear].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PMS_FinYear].[Description] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [PMS_FinYear].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [PMS_FinYear].[Active] END DESC,
     CASE @OrderBy WHEN 'PlanningOpen' THEN [PMS_FinYear].[PlanningOpen] END,
     CASE @OrderBy WHEN 'PlanningOpen DESC' THEN [PMS_FinYear].[PlanningOpen] END DESC,
     CASE @OrderBy WHEN 'MidTermOpen' THEN [PMS_FinYear].[MidTermOpen] END,
     CASE @OrderBy WHEN 'MidTermOpen DESC' THEN [PMS_FinYear].[MidTermOpen] END DESC,
     CASE @OrderBy WHEN 'FinalOpen' THEN [PMS_FinYear].[FinalOpen] END,
     CASE @OrderBy WHEN 'FinalOpen DESC' THEN [PMS_FinYear].[FinalOpen] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMS_FinYear].[FinYear] ,
		[PMS_FinYear].[Description] ,
		[PMS_FinYear].[Active] ,
		[PMS_FinYear].[PlanningOpen] ,
		[PMS_FinYear].[MidTermOpen] ,
		[PMS_FinYear].[FinalOpen]  
  FROM [PMS_FinYear] 
    	INNER JOIN #PageIndex
          ON [PMS_FinYear].[FinYear] = #PageIndex.FinYear
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

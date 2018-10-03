USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMobileBillPlansSelectListSearch]
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
 ,MobileBillPlanID Int NOT NULL
  )
  INSERT INTO #PageIndex (MobileBillPlanID)
  SELECT [PRK_MobileBillPlans].[MobileBillPlanID] FROM [PRK_MobileBillPlans]
 WHERE  
   ( 
         STR(ISNULL([PRK_MobileBillPlans].[MobileBillPlanID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_MobileBillPlans].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'MobileBillPlanID' THEN [PRK_MobileBillPlans].[MobileBillPlanID] END,
     CASE @OrderBy WHEN 'MobileBillPlanID DESC' THEN [PRK_MobileBillPlans].[MobileBillPlanID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_MobileBillPlans].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_MobileBillPlans].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_MobileBillPlans].*  
  FROM [PRK_MobileBillPlans] 
      INNER JOIN #PageIndex
          ON [PRK_MobileBillPlans].[MobileBillPlanID] = #PageIndex.MobileBillPlanID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

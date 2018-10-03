USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaPrjCalcMethodSelectListSearch]
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
 ,ProjectCalcID Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectCalcID)
  SELECT [TA_PrjCalcMethod].[ProjectCalcID] FROM [TA_PrjCalcMethod]
 WHERE  
   ( 
         STR(ISNULL([TA_PrjCalcMethod].[ProjectCalcID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_PrjCalcMethod].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectCalcID' THEN [TA_PrjCalcMethod].[ProjectCalcID] END,
     CASE @OrderBy WHEN 'ProjectCalcID DESC' THEN [TA_PrjCalcMethod].[ProjectCalcID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_PrjCalcMethod].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_PrjCalcMethod].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_PrjCalcMethod].[ProjectCalcID] ,
		[TA_PrjCalcMethod].[Description]  
  FROM [TA_PrjCalcMethod] 
      INNER JOIN #PageIndex
          ON [TA_PrjCalcMethod].[ProjectCalcID] = #PageIndex.ProjectCalcID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

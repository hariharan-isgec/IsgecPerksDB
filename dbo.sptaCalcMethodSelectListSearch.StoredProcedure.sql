USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCalcMethodSelectListSearch]
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
 ,CalculationTypeID NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (CalculationTypeID)
  SELECT [TA_CalcMethod].[CalculationTypeID] FROM [TA_CalcMethod]
 WHERE  
   ( 
         LOWER(ISNULL([TA_CalcMethod].[CalculationTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_CalcMethod].[CalculationDescription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CalculationTypeID' THEN [TA_CalcMethod].[CalculationTypeID] END,
     CASE @OrderBy WHEN 'CalculationTypeID DESC' THEN [TA_CalcMethod].[CalculationTypeID] END DESC,
     CASE @OrderBy WHEN 'CalculationDescription' THEN [TA_CalcMethod].[CalculationDescription] END,
     CASE @OrderBy WHEN 'CalculationDescription DESC' THEN [TA_CalcMethod].[CalculationDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_CalcMethod].[CalculationTypeID] ,
		[TA_CalcMethod].[CalculationDescription]  
  FROM [TA_CalcMethod] 
      INNER JOIN #PageIndex
          ON [TA_CalcMethod].[CalculationTypeID] = #PageIndex.CalculationTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionsSelectListSearch]
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
 ,RegionID NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (RegionID)
  SELECT [TA_Regions].[RegionID] FROM [TA_Regions]
  INNER JOIN [TA_Currencies] AS [TA_Currencies1]
    ON [TA_Regions].[CurrencyID] = [TA_Currencies1].[CurrencyID]
  INNER JOIN [TA_RegionTypes] AS [TA_RegionTypes2]
    ON [TA_Regions].[RegionTypeID] = [TA_RegionTypes2].[RegionTypeID]
 WHERE  
   ( 
         LOWER(ISNULL([TA_Regions].[RegionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Regions].[RegionName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Regions].[RegionTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Regions].[CurrencyID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RegionID' THEN [TA_Regions].[RegionID] END,
     CASE @OrderBy WHEN 'RegionID DESC' THEN [TA_Regions].[RegionID] END DESC,
     CASE @OrderBy WHEN 'RegionName' THEN [TA_Regions].[RegionName] END,
     CASE @OrderBy WHEN 'RegionName DESC' THEN [TA_Regions].[RegionName] END DESC,
     CASE @OrderBy WHEN 'RegionTypeID' THEN [TA_Regions].[RegionTypeID] END,
     CASE @OrderBy WHEN 'RegionTypeID DESC' THEN [TA_Regions].[RegionTypeID] END DESC,
     CASE @OrderBy WHEN 'CurrencyID' THEN [TA_Regions].[CurrencyID] END,
     CASE @OrderBy WHEN 'CurrencyID DESC' THEN [TA_Regions].[CurrencyID] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies1_CurrencyName' THEN [TA_Currencies1].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies1_CurrencyName DESC' THEN [TA_Currencies1].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'TA_RegionTypes2_RegionTypeName' THEN [TA_RegionTypes2].[RegionTypeName] END,
     CASE @OrderBy WHEN 'TA_RegionTypes2_RegionTypeName DESC' THEN [TA_RegionTypes2].[RegionTypeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_Regions].[RegionID] ,
		[TA_Regions].[RegionName] ,
		[TA_Regions].[RegionTypeID] ,
		[TA_Regions].[CurrencyID] ,
		[TA_Currencies1].[CurrencyName] AS TA_Currencies1_CurrencyName,
		[TA_RegionTypes2].[RegionTypeName] AS TA_RegionTypes2_RegionTypeName 
  FROM [TA_Regions] 
      INNER JOIN #PageIndex
          ON [TA_Regions].[RegionID] = #PageIndex.RegionID
  INNER JOIN [TA_Currencies] AS [TA_Currencies1]
    ON [TA_Regions].[CurrencyID] = [TA_Currencies1].[CurrencyID]
  INNER JOIN [TA_RegionTypes] AS [TA_RegionTypes2]
    ON [TA_Regions].[RegionTypeID] = [TA_RegionTypes2].[RegionTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LodgingSelectListSearch]
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
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [TA_D_Lodging].[SerialNo] FROM [TA_D_Lodging]
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_Lodging].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes2]
    ON [TA_D_Lodging].[CityTypeID] = [TA_CityTypes2].[CityTypeID]
 WHERE  
   ( 
         STR(ISNULL([TA_D_Lodging].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_Lodging].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_D_Lodging].[CityTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_Lodging].[LodgingAmount], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_D_Lodging].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_D_Lodging].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_D_Lodging].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_D_Lodging].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'CityTypeID' THEN [TA_D_Lodging].[CityTypeID] END,
     CASE @OrderBy WHEN 'CityTypeID DESC' THEN [TA_D_Lodging].[CityTypeID] END DESC,
     CASE @OrderBy WHEN 'LodgingAmount' THEN [TA_D_Lodging].[LodgingAmount] END,
     CASE @OrderBy WHEN 'LodgingAmount DESC' THEN [TA_D_Lodging].[LodgingAmount] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_D_Lodging].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_D_Lodging].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_D_Lodging].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_D_Lodging].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_D_Lodging].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_D_Lodging].[Active] END DESC,
     CASE @OrderBy WHEN 'TA_CityTypes2_CityTypeName' THEN [TA_CityTypes2].[CityTypeName] END,
     CASE @OrderBy WHEN 'TA_CityTypes2_CityTypeName DESC' THEN [TA_CityTypes2].[CityTypeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_D_Lodging].[SerialNo] ,
		[TA_D_Lodging].[CategoryID] ,
		[TA_D_Lodging].[CityTypeID] ,
		[TA_D_Lodging].[LodgingAmount] ,
		[TA_D_Lodging].[FromDate] ,
		[TA_D_Lodging].[TillDate] ,
		[TA_D_Lodging].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_CityTypes2].[CityTypeName] AS TA_CityTypes2_CityTypeName 
  FROM [TA_D_Lodging] 
      INNER JOIN #PageIndex
          ON [TA_D_Lodging].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_Lodging].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes2]
    ON [TA_D_Lodging].[CityTypeID] = [TA_CityTypes2].[CityTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

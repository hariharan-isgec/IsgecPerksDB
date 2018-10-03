USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_MileageSelectListSearch]
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
  SELECT [TA_D_Mileage].[SerialNo] FROM [TA_D_Mileage]
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_Mileage].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities2]
    ON [TA_D_Mileage].[CityID] = [TA_Cities2].[CityID]
 WHERE  
   ( 
         STR(ISNULL([TA_D_Mileage].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_Mileage].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_D_Mileage].[CityID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_Mileage].[AmountPerKM], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_D_Mileage].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_D_Mileage].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_D_Mileage].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_D_Mileage].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'CityID' THEN [TA_D_Mileage].[CityID] END,
     CASE @OrderBy WHEN 'CityID DESC' THEN [TA_D_Mileage].[CityID] END DESC,
     CASE @OrderBy WHEN 'OtherCity' THEN [TA_D_Mileage].[OtherCity] END,
     CASE @OrderBy WHEN 'OtherCity DESC' THEN [TA_D_Mileage].[OtherCity] END DESC,
     CASE @OrderBy WHEN 'AmountPerKM' THEN [TA_D_Mileage].[AmountPerKM] END,
     CASE @OrderBy WHEN 'AmountPerKM DESC' THEN [TA_D_Mileage].[AmountPerKM] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_D_Mileage].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_D_Mileage].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_D_Mileage].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_D_Mileage].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_D_Mileage].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_D_Mileage].[Active] END DESC,
     CASE @OrderBy WHEN 'TA_Cities2_CityName' THEN [TA_Cities2].[CityName] END,
     CASE @OrderBy WHEN 'TA_Cities2_CityName DESC' THEN [TA_Cities2].[CityName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_D_Mileage].[SerialNo] ,
		[TA_D_Mileage].[CategoryID] ,
		[TA_D_Mileage].[CityID] ,
		[TA_D_Mileage].[OtherCity] ,
		[TA_D_Mileage].[AmountPerKM] ,
		[TA_D_Mileage].[FromDate] ,
		[TA_D_Mileage].[TillDate] ,
		[TA_D_Mileage].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_Cities2].[CityName] AS TA_Cities2_CityName 
  FROM [TA_D_Mileage] 
      INNER JOIN #PageIndex
          ON [TA_D_Mileage].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_Mileage].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities2]
    ON [TA_D_Mileage].[CityID] = [TA_Cities2].[CityID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

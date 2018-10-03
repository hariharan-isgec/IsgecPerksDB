USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_GuestHouseDASelectListSearch]
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
  SELECT [TA_D_GuestHouseDA].[SerialNo] FROM [TA_D_GuestHouseDA]
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_GuestHouseDA].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities2]
    ON [TA_D_GuestHouseDA].[CityID] = [TA_Cities2].[CityID]
 WHERE  
   ( 
         STR(ISNULL([TA_D_GuestHouseDA].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_GuestHouseDA].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_D_GuestHouseDA].[CityID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_GuestHouseDA].[DA], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_D_GuestHouseDA].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_D_GuestHouseDA].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_D_GuestHouseDA].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_D_GuestHouseDA].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'CityID' THEN [TA_D_GuestHouseDA].[CityID] END,
     CASE @OrderBy WHEN 'CityID DESC' THEN [TA_D_GuestHouseDA].[CityID] END DESC,
     CASE @OrderBy WHEN 'OtherCity' THEN [TA_D_GuestHouseDA].[OtherCity] END,
     CASE @OrderBy WHEN 'OtherCity DESC' THEN [TA_D_GuestHouseDA].[OtherCity] END DESC,
     CASE @OrderBy WHEN 'DA' THEN [TA_D_GuestHouseDA].[DA] END,
     CASE @OrderBy WHEN 'DA DESC' THEN [TA_D_GuestHouseDA].[DA] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_D_GuestHouseDA].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_D_GuestHouseDA].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_D_GuestHouseDA].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_D_GuestHouseDA].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_D_GuestHouseDA].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_D_GuestHouseDA].[Active] END DESC,
     CASE @OrderBy WHEN 'TA_Cities2_CityName' THEN [TA_Cities2].[CityName] END,
     CASE @OrderBy WHEN 'TA_Cities2_CityName DESC' THEN [TA_Cities2].[CityName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_D_GuestHouseDA].[SerialNo] ,
		[TA_D_GuestHouseDA].[CategoryID] ,
		[TA_D_GuestHouseDA].[CityID] ,
		[TA_D_GuestHouseDA].[OtherCity] ,
		[TA_D_GuestHouseDA].[DA] ,
		[TA_D_GuestHouseDA].[FromDate] ,
		[TA_D_GuestHouseDA].[TillDate] ,
		[TA_D_GuestHouseDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_Cities2].[CityName] AS TA_Cities2_CityName 
  FROM [TA_D_GuestHouseDA] 
      INNER JOIN #PageIndex
          ON [TA_D_GuestHouseDA].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_GuestHouseDA].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities2]
    ON [TA_D_GuestHouseDA].[CityID] = [TA_Cities2].[CityID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

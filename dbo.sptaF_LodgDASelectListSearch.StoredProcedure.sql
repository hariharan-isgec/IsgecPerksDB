USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_LodgDASelectListSearch]
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
  SELECT [TA_F_LodgDA].[SerialNo] FROM [TA_F_LodgDA]
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_LodgDA].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions1]
    ON [TA_F_LodgDA].[RegionID] = [TA_Regions1].[RegionID]
 WHERE  
   ( 
         STR(ISNULL([TA_F_LodgDA].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_F_LodgDA].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_F_LodgDA].[RegionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_F_LodgDA].[Lodging], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_F_LodgDA].[DA], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_F_LodgDA].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_F_LodgDA].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_F_LodgDA].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_F_LodgDA].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'RegionID' THEN [TA_F_LodgDA].[RegionID] END,
     CASE @OrderBy WHEN 'RegionID DESC' THEN [TA_F_LodgDA].[RegionID] END DESC,
     CASE @OrderBy WHEN 'Lodging' THEN [TA_F_LodgDA].[Lodging] END,
     CASE @OrderBy WHEN 'Lodging DESC' THEN [TA_F_LodgDA].[Lodging] END DESC,
     CASE @OrderBy WHEN 'DA' THEN [TA_F_LodgDA].[DA] END,
     CASE @OrderBy WHEN 'DA DESC' THEN [TA_F_LodgDA].[DA] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_F_LodgDA].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_F_LodgDA].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_F_LodgDA].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_F_LodgDA].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_F_LodgDA].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_F_LodgDA].[Active] END DESC,
     CASE @OrderBy WHEN 'TA_Regions1_RegionName' THEN [TA_Regions1].[RegionName] END,
     CASE @OrderBy WHEN 'TA_Regions1_RegionName DESC' THEN [TA_Regions1].[RegionName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_F_LodgDA].[SerialNo] ,
		[TA_F_LodgDA].[CategoryID] ,
		[TA_F_LodgDA].[RegionID] ,
		[TA_F_LodgDA].[Lodging] ,
		[TA_F_LodgDA].[DA] ,
		[TA_F_LodgDA].[FromDate] ,
		[TA_F_LodgDA].[TillDate] ,
		[TA_F_LodgDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_Regions1].[RegionName] AS TA_Regions1_RegionName 
  FROM [TA_F_LodgDA] 
      INNER JOIN #PageIndex
          ON [TA_F_LodgDA].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_LodgDA].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions1]
    ON [TA_F_LodgDA].[RegionID] = [TA_Regions1].[RegionID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

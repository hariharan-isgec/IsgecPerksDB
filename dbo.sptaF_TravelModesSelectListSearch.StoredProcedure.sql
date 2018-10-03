USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_TravelModesSelectListSearch]
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
  SELECT [TA_F_TravelModes].[SerialNo] FROM [TA_F_TravelModes]
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_TravelModes].[CategoryID] = [TA_Categories1].[CategoryID]
  INNER JOIN [TA_TravelModes] AS [TA_TravelModes1]
    ON [TA_F_TravelModes].[TravelModeID] = [TA_TravelModes1].[ModeID]
 WHERE  
   ( 
         STR(ISNULL([TA_F_TravelModes].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_F_TravelModes].[CategoryID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_F_TravelModes].[TravelModeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_F_TravelModes].[EntitlementText],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_F_TravelModes].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_F_TravelModes].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_F_TravelModes].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_F_TravelModes].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'TravelModeID' THEN [TA_F_TravelModes].[TravelModeID] END,
     CASE @OrderBy WHEN 'TravelModeID DESC' THEN [TA_F_TravelModes].[TravelModeID] END DESC,
     CASE @OrderBy WHEN 'EntitlementText' THEN [TA_F_TravelModes].[EntitlementText] END,
     CASE @OrderBy WHEN 'EntitlementText DESC' THEN [TA_F_TravelModes].[EntitlementText] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_F_TravelModes].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_F_TravelModes].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_F_TravelModes].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_F_TravelModes].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_F_TravelModes].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_F_TravelModes].[Active] END DESC,
     CASE @OrderBy WHEN 'TA_TravelModes1_ModeName' THEN [TA_TravelModes1].[ModeName] END,
     CASE @OrderBy WHEN 'TA_TravelModes1_ModeName DESC' THEN [TA_TravelModes1].[ModeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_F_TravelModes].[SerialNo] ,
		[TA_F_TravelModes].[CategoryID] ,
		[TA_F_TravelModes].[TravelModeID] ,
		[TA_F_TravelModes].[EntitlementText] ,
		[TA_F_TravelModes].[FromDate] ,
		[TA_F_TravelModes].[TillDate] ,
		[TA_F_TravelModes].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_TravelModes1].[ModeName] AS TA_TravelModes1_ModeName 
  FROM [TA_F_TravelModes] 
      INNER JOIN #PageIndex
          ON [TA_F_TravelModes].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_TravelModes].[CategoryID] = [TA_Categories1].[CategoryID]
  INNER JOIN [TA_TravelModes] AS [TA_TravelModes1]
    ON [TA_F_TravelModes].[TravelModeID] = [TA_TravelModes1].[ModeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

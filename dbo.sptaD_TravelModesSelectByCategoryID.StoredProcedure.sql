USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_TravelModesSelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_D_TravelModes].[SerialNo] ,
		[TA_D_TravelModes].[CategoryID] ,
		[TA_D_TravelModes].[TravelModeID] ,
		[TA_D_TravelModes].[EntitlementText] ,
		[TA_D_TravelModes].[FromDate] ,
		[TA_D_TravelModes].[TillDate] ,
		[TA_D_TravelModes].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_TravelModes1].[ModeName] AS TA_TravelModes1_ModeName 
  FROM [TA_D_TravelModes] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_TravelModes].[CategoryID] = [TA_Categories1].[CategoryID]
  INNER JOIN [TA_TravelModes] AS [TA_TravelModes1]
    ON [TA_D_TravelModes].[TravelModeID] = [TA_TravelModes1].[ModeID]
  WHERE
  [TA_D_TravelModes].[CategoryID] = @CategoryID
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_D_TravelModes].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_D_TravelModes].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_D_TravelModes].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_D_TravelModes].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'TravelModeID' THEN [TA_D_TravelModes].[TravelModeID] END,
     CASE @OrderBy WHEN 'TravelModeID DESC' THEN [TA_D_TravelModes].[TravelModeID] END DESC,
     CASE @OrderBy WHEN 'EntitlementText' THEN [TA_D_TravelModes].[EntitlementText] END,
     CASE @OrderBy WHEN 'EntitlementText DESC' THEN [TA_D_TravelModes].[EntitlementText] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_D_TravelModes].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_D_TravelModes].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_D_TravelModes].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_D_TravelModes].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_D_TravelModes].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_D_TravelModes].[Active] END DESC,
     CASE @OrderBy WHEN 'TA_TravelModes1_ModeName' THEN [TA_TravelModes1].[ModeName] END,
     CASE @OrderBy WHEN 'TA_TravelModes1_ModeName DESC' THEN [TA_TravelModes1].[ModeName] END DESC 
  SET @RecordCount = @@RowCount
GO

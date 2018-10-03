USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LCModesSelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_D_LCModes].[SerialNo] ,
		[TA_D_LCModes].[CategoryID] ,
		[TA_D_LCModes].[LCModeID] ,
		[TA_D_LCModes].[EntitlementText] ,
		[TA_D_LCModes].[FromDate] ,
		[TA_D_LCModes].[TillDate] ,
		[TA_D_LCModes].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_LCModes1].[ModeName] AS TA_LCModes1_ModeName 
  FROM [TA_D_LCModes] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_LCModes].[CategoryID] = [TA_Categories1].[CategoryID]
  INNER JOIN [TA_LCModes] AS [TA_LCModes1]
    ON [TA_D_LCModes].[LCModeID] = [TA_LCModes1].[ModeID]
  WHERE
  [TA_D_LCModes].[CategoryID] = @CategoryID
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_D_LCModes].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_D_LCModes].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_D_LCModes].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_D_LCModes].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'LCModeID' THEN [TA_D_LCModes].[LCModeID] END,
     CASE @OrderBy WHEN 'LCModeID DESC' THEN [TA_D_LCModes].[LCModeID] END DESC,
     CASE @OrderBy WHEN 'EntitlementText' THEN [TA_D_LCModes].[EntitlementText] END,
     CASE @OrderBy WHEN 'EntitlementText DESC' THEN [TA_D_LCModes].[EntitlementText] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_D_LCModes].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_D_LCModes].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_D_LCModes].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_D_LCModes].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_D_LCModes].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_D_LCModes].[Active] END DESC,
     CASE @OrderBy WHEN 'TA_LCModes1_ModeName' THEN [TA_LCModes1].[ModeName] END,
     CASE @OrderBy WHEN 'TA_LCModes1_ModeName DESC' THEN [TA_LCModes1].[ModeName] END DESC 
  SET @RecordCount = @@RowCount
GO

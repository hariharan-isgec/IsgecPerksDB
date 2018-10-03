USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spta_LG_D_LCModesSelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @ForStartDate DateTime,
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
  AND @ForStartDate Between [TA_D_LCModes].[FromDate] and [TA_D_LCModes].[TillDate] 
  AND [TA_D_LCModes].[Active] = 1  

  SET @RecordCount = @@RowCount
GO

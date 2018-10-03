USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spta_LG_D_TravelModesSelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @ForStartDate DateTime,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT TOP 1 
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
	AND @ForStartDate Between [TA_D_TravelModes].[FromDate] and [TA_D_TravelModes].[TillDate]   
	AND [TA_D_TravelModes].[Active] = 1   

  SET @RecordCount = @@RowCount
GO

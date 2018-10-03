USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spta_LG_F_TravelModesSelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @ForStartDate DateTime,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT TOP 1 
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
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_TravelModes].[CategoryID] = [TA_Categories1].[CategoryID]
  INNER JOIN [TA_TravelModes] AS [TA_TravelModes1]
    ON [TA_F_TravelModes].[TravelModeID] = [TA_TravelModes1].[ModeID]
  WHERE
  [TA_F_TravelModes].[CategoryID] = @CategoryID
  AND @ForStartDate Between [TA_F_TravelModes].[FromDate] and [TA_F_TravelModes].[TillDate] 
  AND [TA_F_TravelModes].[Active] = 1

  SET @RecordCount = @@RowCount
GO

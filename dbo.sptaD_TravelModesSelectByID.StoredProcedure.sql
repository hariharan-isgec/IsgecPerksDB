USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_TravelModesSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
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
  [TA_D_TravelModes].[SerialNo] = @SerialNo
GO

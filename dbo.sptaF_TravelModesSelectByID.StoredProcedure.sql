USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_TravelModesSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
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
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_TravelModes].[CategoryID] = [TA_Categories1].[CategoryID]
  INNER JOIN [TA_TravelModes] AS [TA_TravelModes1]
    ON [TA_F_TravelModes].[TravelModeID] = [TA_TravelModes1].[ModeID]
  WHERE
  [TA_F_TravelModes].[SerialNo] = @SerialNo
GO

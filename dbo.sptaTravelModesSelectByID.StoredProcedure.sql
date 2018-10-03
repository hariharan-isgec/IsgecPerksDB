USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelModesSelectByID]
  @LoginID NVarChar(8),
  @ModeID Int 
  AS
  SELECT
		[TA_TravelModes].[ModeID] ,
		[TA_TravelModes].[ModeName] ,
		[TA_TravelModes].[Sequence] ,
		[TA_TravelModes].[OutOfSequence] ,
		[TA_TravelModes].[UnderMilageClaim]  
  FROM [TA_TravelModes] 
  WHERE
  [TA_TravelModes].[ModeID] = @ModeID
GO

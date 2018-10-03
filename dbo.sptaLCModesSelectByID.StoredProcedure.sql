USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaLCModesSelectByID]
  @LoginID NVarChar(8),
  @ModeID Int 
  AS
  SELECT
		[TA_LCModes].[ModeID] ,
		[TA_LCModes].[ModeName] ,
		[TA_LCModes].[OutOfSequence] ,
		[TA_LCModes].[Sequence] ,
		[TA_LCModes].[UnderMilageClaim]  
  FROM [TA_LCModes] 
  WHERE
  [TA_LCModes].[ModeID] = @ModeID
GO

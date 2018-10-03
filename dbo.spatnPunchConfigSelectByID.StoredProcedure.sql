USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigSelectByID]
  @RecordID Int
  AS
  SELECT
		[ATN_PunchConfig].[RecordID],
		[ATN_PunchConfig].[STD1Time],
		[ATN_PunchConfig].[Range1Start],
		[ATN_PunchConfig].[Range1End],
		[ATN_PunchConfig].[MeanTime],
		[ATN_PunchConfig].[STD2Time],
		[ATN_PunchConfig].[Range2Start],
		[ATN_PunchConfig].[Range2End],
		[ATN_PunchConfig].[EnableMinHrs],
		[ATN_PunchConfig].[MinHrsFullPresent],
		[ATN_PunchConfig].[MinHrsHalfPresent],
		[ATN_PunchConfig].[Active],
		[ATN_PunchConfig].[FinYear],
		[ATN_PunchConfig].[DataFileLocation] 
  FROM [ATN_PunchConfig] 
  WHERE
  [ATN_PunchConfig].[RecordID] = @RecordID
GO

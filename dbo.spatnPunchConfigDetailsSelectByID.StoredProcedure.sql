USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigDetailsSelectByID]
  @SerialNo Int
  AS
  SELECT
		[ATN_PunchConfigDetails].[SerialNo],
		[ATN_PunchConfigDetails].[ConfigID],
		[ATN_PunchConfigDetails].[FPStartTime],
		[ATN_PunchConfigDetails].[FPEndTime],
		[ATN_PunchConfigDetails].[UseDefined],
		[ATN_PunchConfigDetails].[DefinedTime],
		[ATN_PunchConfigDetails].[SPStartTime],
		[ATN_PunchConfigDetails].[SPEndTime],
		[ATN_PunchConfigDetails].[CalculateHours],
		[ATN_PunchConfigDetails].[HoursStatus],
		[ATN_PunchConfigDetails].[HoursValue],
		[ATN_PunchConfigDetails].[LimitedAllowed],
		[ATN_PunchConfigDetails].[LimitCount],
		[ATN_PunchConfigDetails].[LimitPunchStatus],
		[ATN_PunchConfigDetails].[NormalPunchStatus],
		[ATN_PunchConfigDetails].[LimitedLeaveTypes],
		[ATN_PunchConfigDetails].[NormalLeaveTypes],
		[ATN_PunchConfigDetails].[ExceptionRule],
		[ATN_PunchConfigDetails].[ConfigStatus],
		[ATN_PunchConfig1].[RecordID] AS ATN_PunchConfig1_RecordID,
		[ATN_PunchConfig1].[Description] AS ATN_PunchConfig1_Description,
		[ATN_PunchConfig1].[STD1Time] AS ATN_PunchConfig1_STD1Time,
		[ATN_PunchConfig1].[Range1Start] AS ATN_PunchConfig1_Range1Start,
		[ATN_PunchConfig1].[Range1End] AS ATN_PunchConfig1_Range1End,
		[ATN_PunchConfig1].[MeanTime] AS ATN_PunchConfig1_MeanTime,
		[ATN_PunchConfig1].[STD2Time] AS ATN_PunchConfig1_STD2Time,
		[ATN_PunchConfig1].[Range2Start] AS ATN_PunchConfig1_Range2Start,
		[ATN_PunchConfig1].[Range2End] AS ATN_PunchConfig1_Range2End,
		[ATN_PunchConfig1].[EnableMinHrs] AS ATN_PunchConfig1_EnableMinHrs,
		[ATN_PunchConfig1].[MinHrsFullPresent] AS ATN_PunchConfig1_MinHrsFullPresent,
		[ATN_PunchConfig1].[MinHrsHalfPresent] AS ATN_PunchConfig1_MinHrsHalfPresent,
		[ATN_PunchConfig1].[Active] AS ATN_PunchConfig1_Active,
		[ATN_PunchConfig1].[FinYear] AS ATN_PunchConfig1_FinYear,
		[ATN_PunchConfig1].[DataFileLocation] AS ATN_PunchConfig1_DataFileLocation 
  FROM [ATN_PunchConfigDetails] 
  INNER JOIN [ATN_PunchConfig] AS [ATN_PunchConfig1]
    ON [ATN_PunchConfigDetails].[ConfigID] = [ATN_PunchConfig1].[RecordID]
  WHERE
  [ATN_PunchConfigDetails].[SerialNo] = @SerialNo
GO

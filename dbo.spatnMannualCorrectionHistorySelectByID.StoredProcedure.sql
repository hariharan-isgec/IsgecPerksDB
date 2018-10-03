USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMannualCorrectionHistorySelectByID]
  @SerialNo Int
  AS
  SELECT
		[ATN_MannualCorrectionHistory].[SerialNo],
		[ATN_MannualCorrectionHistory].[AttenID],
		[ATN_MannualCorrectionHistory].[AttenDate],
		[ATN_MannualCorrectionHistory].[CardNo],
		[ATN_MannualCorrectionHistory].[Punch1Time],
		[ATN_MannualCorrectionHistory].[Punch2Time],
		[ATN_MannualCorrectionHistory].[PunchStatusID],
		[ATN_MannualCorrectionHistory].[MannuallyCorrectedOn],
		[ATN_MannualCorrectionHistory].[MannuallyCorrectedBy],
		[ATN_MannualCorrectionHistory].[NewPunch1Time],
		[ATN_MannualCorrectionHistory].[NewPunch2Time],
		[ATN_MannualCorrectionHistory].[NewPunchStatusID],
		[ATN_MannualCorrectionHistory].[Remarks] 
  FROM [ATN_MannualCorrectionHistory] 
  WHERE
  [ATN_MannualCorrectionHistory].[SerialNo] = @SerialNo
GO

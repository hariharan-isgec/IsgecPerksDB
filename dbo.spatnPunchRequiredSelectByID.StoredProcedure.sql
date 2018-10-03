USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchRequiredSelectByID]
  @RecordID Int
  AS
  SELECT
		[ATN_PunchRequired].[RecordID],
		[ATN_PunchRequired].[CardNo],
		[ATN_PunchRequired].[NoPunch],
		[ATN_PunchRequired].[OnePunch],
		[ATN_PunchRequired].[RuleException],
		[ATN_PunchRequired].[AllLocation],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [ATN_PunchRequired] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_PunchRequired].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
  [ATN_PunchRequired].[RecordID] = @RecordID
GO

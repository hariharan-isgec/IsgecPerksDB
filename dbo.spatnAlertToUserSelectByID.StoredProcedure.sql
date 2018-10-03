USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAlertToUserSelectByID]
  @CardNo NVarChar(8),
  @AttenMonth Int 
  AS
  SELECT
		[ATNv_PendingRegularization].[CardNo],
		[ATNv_PendingRegularization].[AttenMonth],
		[ATNv_PendingRegularization].[EmployeeName],
		[ATNv_PendingRegularization].[SFinalValue],
		[ATNv_PendingRegularization].[Designation_Description],
		[ATNv_PendingRegularization].[Department_Description],
		[ATNv_PendingRegularization].[Office_Description],
		[ATNv_PendingRegularization].[FinYear],
		[ATNv_PendingRegularization].[EMailID],
		[ATN_Months1].[MonthID] AS ATN_Months1_MonthID,
		[ATN_Months1].[Description] AS ATN_Months1_Description,
		[ATN_Months1].[ShortName] AS ATN_Months1_ShortName 
  FROM [ATNv_PendingRegularization] 
  LEFT OUTER JOIN [ATN_Months] AS [ATN_Months1]
    ON [ATNv_PendingRegularization].[AttenMonth] = [ATN_Months1].[MonthID]
  WHERE
  [ATNv_PendingRegularization].[CardNo] = @CardNo
  AND [ATNv_PendingRegularization].[AttenMonth] = @AttenMonth
GO

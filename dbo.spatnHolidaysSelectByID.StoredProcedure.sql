USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnHolidaysSelectByID]
  @RecordID Int
  AS
  SELECT
		[ATN_Holidays].[RecordID],
		[ATN_Holidays].[Holiday],
		[ATN_Holidays].[OfficeID],
		[ATN_Holidays].[Description],
		[ATN_Holidays].[PunchStatusID],
		[ATN_Holidays].[FinYear],
		[HRM_Offices1].[OfficeID] AS HRM_Offices1_OfficeID,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description,
		[HRM_Offices1].[Address] AS HRM_Offices1_Address,
		[HRM_Offices1].[City] AS HRM_Offices1_City,
		[ATN_PunchStatus2].[PunchStatusID] AS ATN_PunchStatus2_PunchStatusID,
		[ATN_PunchStatus2].[Description] AS ATN_PunchStatus2_Description,
		[ATN_PunchStatus2].[PunchValue] AS ATN_PunchStatus2_PunchValue,
		[ATN_FinYear3].[FinYear] AS ATN_FinYear3_FinYear,
		[ATN_FinYear3].[Description] AS ATN_FinYear3_Description,
		[ATN_FinYear3].[StartDate] AS ATN_FinYear3_StartDate,
		[ATN_FinYear3].[EndDate] AS ATN_FinYear3_EndDate,
		[ATN_FinYear3].[Active] AS ATN_FinYear3_Active 
  FROM [ATN_Holidays] 
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [ATN_Holidays].[OfficeID] = [HRM_Offices1].[OfficeID]
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Holidays].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear3]
    ON [ATN_Holidays].[FinYear] = [ATN_FinYear3].[FinYear]
  WHERE
  [ATN_Holidays].[RecordID] = @RecordID
GO

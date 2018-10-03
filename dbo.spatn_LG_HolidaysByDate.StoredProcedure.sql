USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_HolidaysByDate]
  @FinYear Int,
  @OfficeID Int,
  @Holiday DateTime
  AS
  BEGIN
  SELECT
		[ATN_Holidays].[RecordID],
		[ATN_Holidays].[Holiday],
		[ATN_Holidays].[Description],
		[ATN_Holidays].[PunchStatusID],
		[ATN_Holidays].[FinYear],
		[ATN_Holidays].[OfficeID],
		[ATN_PunchStatus1].[PunchStatusID] AS ATN_PunchStatus1_PunchStatusID,
		[ATN_PunchStatus1].[Description] AS ATN_PunchStatus1_Description,
		[ATN_PunchStatus1].[PunchValue] AS ATN_PunchStatus1_PunchValue,
		[ATN_FinYear2].[FinYear] AS ATN_FinYear2_FinYear,
		[ATN_FinYear2].[Description] AS ATN_FinYear2_Description,
		[ATN_FinYear2].[StartDate] AS ATN_FinYear2_StartDate,
		[ATN_FinYear2].[EndDate] AS ATN_FinYear2_EndDate,
		[ATN_FinYear2].[Active] AS ATN_FinYear2_Active 
  FROM [ATN_Holidays] 
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus1]
    ON [ATN_Holidays].[PunchStatusID] = [ATN_PunchStatus1].[PunchStatusID]
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear2]
    ON [ATN_Holidays].[FinYear] = [ATN_FinYear2].[FinYear]
  WHERE
  [ATN_Holidays].[FinYear] = @FinYear 
  AND DATEDIFF(dy,[ATN_Holidays].[Holiday],@Holiday) = 0   
  AND [ATN_Holidays].[OfficeID] = @OfficeID  
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtLeaveTypesSelectByID]
  @LeaveTypeID NVarChar(2) 
  AS
  SELECT
		[ATN_LeaveTypes].[LeaveTypeID],
		[ATN_LeaveTypes].[Description],
		[ATN_LeaveTypes].[OBALApplicable],
		[ATN_LeaveTypes].[OBALMonthly],
		[ATN_LeaveTypes].[OpeningBalance],
		[ATN_LeaveTypes].[CarryForward],
		[ATN_LeaveTypes].[ForwardToLeaveTypeID],
		[ATN_LeaveTypes].[AdvanceApplicable],
		[ATN_LeaveTypes].[SpecialSanctionRequired],
		[ATN_LeaveTypes].[SpecialSanctionBy],
		[ATN_LeaveTypes].[Applyiable],
		[ATN_LeaveTypes].[Postable],
		[ATN_LeaveTypes].[PostedLeaveTypeID],
		[ATN_LeaveTypes].[Sequence],
		[ATN_LeaveTypes].[MainType],
		[ATN_LeaveTypes].[ForSite] 
  FROM [ATN_LeaveTypes] 
  WHERE
  [ATN_LeaveTypes].[LeaveTypeID] = @LeaveTypeID
GO

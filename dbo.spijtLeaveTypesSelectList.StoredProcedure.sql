USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtLeaveTypesSelectList]
  @Applyiable Bit,
  @ForSite Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE [ATN_LeaveTypes].[Applyiable] = @Applyiable
  AND [ATN_LeaveTypes].[ForSite] = @ForSite
  ORDER BY
     CASE @orderBy WHEN 'LeaveTypeID' THEN [ATN_LeaveTypes].[LeaveTypeID] END,
     CASE @orderBy WHEN 'LeaveTypeID DESC' THEN [ATN_LeaveTypes].[LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_LeaveTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_LeaveTypes].[Description] END DESC,
     CASE @orderBy WHEN 'OBALApplicable' THEN [ATN_LeaveTypes].[OBALApplicable] END,
     CASE @orderBy WHEN 'OBALApplicable DESC' THEN [ATN_LeaveTypes].[OBALApplicable] END DESC,
     CASE @orderBy WHEN 'OBALMonthly' THEN [ATN_LeaveTypes].[OBALMonthly] END,
     CASE @orderBy WHEN 'OBALMonthly DESC' THEN [ATN_LeaveTypes].[OBALMonthly] END DESC,
     CASE @orderBy WHEN 'OpeningBalance' THEN [ATN_LeaveTypes].[OpeningBalance] END,
     CASE @orderBy WHEN 'OpeningBalance DESC' THEN [ATN_LeaveTypes].[OpeningBalance] END DESC,
     CASE @orderBy WHEN 'CarryForward' THEN [ATN_LeaveTypes].[CarryForward] END,
     CASE @orderBy WHEN 'CarryForward DESC' THEN [ATN_LeaveTypes].[CarryForward] END DESC,
     CASE @orderBy WHEN 'ForwardToLeaveTypeID' THEN [ATN_LeaveTypes].[ForwardToLeaveTypeID] END,
     CASE @orderBy WHEN 'ForwardToLeaveTypeID DESC' THEN [ATN_LeaveTypes].[ForwardToLeaveTypeID] END DESC,
     CASE @orderBy WHEN 'AdvanceApplicable' THEN [ATN_LeaveTypes].[AdvanceApplicable] END,
     CASE @orderBy WHEN 'AdvanceApplicable DESC' THEN [ATN_LeaveTypes].[AdvanceApplicable] END DESC,
     CASE @orderBy WHEN 'SpecialSanctionRequired' THEN [ATN_LeaveTypes].[SpecialSanctionRequired] END,
     CASE @orderBy WHEN 'SpecialSanctionRequired DESC' THEN [ATN_LeaveTypes].[SpecialSanctionRequired] END DESC,
     CASE @orderBy WHEN 'SpecialSanctionBy' THEN [ATN_LeaveTypes].[SpecialSanctionBy] END,
     CASE @orderBy WHEN 'SpecialSanctionBy DESC' THEN [ATN_LeaveTypes].[SpecialSanctionBy] END DESC,
     CASE @orderBy WHEN 'Applyiable' THEN [ATN_LeaveTypes].[Applyiable] END,
     CASE @orderBy WHEN 'Applyiable DESC' THEN [ATN_LeaveTypes].[Applyiable] END DESC,
     CASE @orderBy WHEN 'Postable' THEN [ATN_LeaveTypes].[Postable] END,
     CASE @orderBy WHEN 'Postable DESC' THEN [ATN_LeaveTypes].[Postable] END DESC,
     CASE @orderBy WHEN 'PostedLeaveTypeID' THEN [ATN_LeaveTypes].[PostedLeaveTypeID] END,
     CASE @orderBy WHEN 'PostedLeaveTypeID DESC' THEN [ATN_LeaveTypes].[PostedLeaveTypeID] END DESC,
     CASE @orderBy WHEN 'Sequence' THEN [ATN_LeaveTypes].[Sequence] END,
     CASE @orderBy WHEN 'Sequence DESC' THEN [ATN_LeaveTypes].[Sequence] END DESC,
     CASE @orderBy WHEN 'MainType' THEN [ATN_LeaveTypes].[MainType] END,
     CASE @orderBy WHEN 'MainType DESC' THEN [ATN_LeaveTypes].[MainType] END DESC,
     CASE @orderBy WHEN 'ForSite' THEN [ATN_LeaveTypes].[ForSite] END,
     CASE @orderBy WHEN 'ForSite DESC' THEN [ATN_LeaveTypes].[ForSite] END DESC 
  SET @RecordCount = @@RowCount
GO

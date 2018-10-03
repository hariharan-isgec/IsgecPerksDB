USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAttendanceSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AttenID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (AttenID) ' + 
               'SELECT [ATN_Attendance].[AttenID] FROM [ATN_Attendance] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus1].[PunchStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[Applied1LeaveTypeID] = [ATN_LeaveTypes2].[LeaveTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[Applied2LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes4]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[Posted1LeaveTypeID] = [ATN_LeaveTypes4].[LeaveTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes5]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[Posted2LeaveTypeID] = [ATN_LeaveTypes5].[LeaveTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus6]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[ApplStatusID] = [ATN_ApplicationStatus6].[ApplStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [ATN_Attendance].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AttenID' THEN '[ATN_Attendance].[AttenID]'
                        WHEN 'AttenID DESC' THEN '[ATN_Attendance].[AttenID] DESC'
                        WHEN 'AttenDate' THEN '[ATN_Attendance].[AttenDate]'
                        WHEN 'AttenDate DESC' THEN '[ATN_Attendance].[AttenDate] DESC'
                        WHEN 'CardNo' THEN '[ATN_Attendance].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_Attendance].[CardNo] DESC'
                        WHEN 'Punch1Time' THEN '[ATN_Attendance].[Punch1Time]'
                        WHEN 'Punch1Time DESC' THEN '[ATN_Attendance].[Punch1Time] DESC'
                        WHEN 'Punch2Time' THEN '[ATN_Attendance].[Punch2Time]'
                        WHEN 'Punch2Time DESC' THEN '[ATN_Attendance].[Punch2Time] DESC'
                        WHEN 'PunchStatusID' THEN '[ATN_Attendance].[PunchStatusID]'
                        WHEN 'PunchStatusID DESC' THEN '[ATN_Attendance].[PunchStatusID] DESC'
                        WHEN 'PunchValue' THEN '[ATN_Attendance].[PunchValue]'
                        WHEN 'PunchValue DESC' THEN '[ATN_Attendance].[PunchValue] DESC'
                        WHEN 'NeedsRegularization' THEN '[ATN_Attendance].[NeedsRegularization]'
                        WHEN 'NeedsRegularization DESC' THEN '[ATN_Attendance].[NeedsRegularization] DESC'
                        WHEN 'FinYear' THEN '[ATN_Attendance].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_Attendance].[FinYear] DESC'
                        WHEN 'Applied' THEN '[ATN_Attendance].[Applied]'
                        WHEN 'Applied DESC' THEN '[ATN_Attendance].[Applied] DESC'
                        WHEN 'AppliedValue' THEN '[ATN_Attendance].[AppliedValue]'
                        WHEN 'AppliedValue DESC' THEN '[ATN_Attendance].[AppliedValue] DESC'
                        WHEN 'Applied1LeaveTypeID' THEN '[ATN_Attendance].[Applied1LeaveTypeID]'
                        WHEN 'Applied1LeaveTypeID DESC' THEN '[ATN_Attendance].[Applied1LeaveTypeID] DESC'
                        WHEN 'Applied2LeaveTypeID' THEN '[ATN_Attendance].[Applied2LeaveTypeID]'
                        WHEN 'Applied2LeaveTypeID DESC' THEN '[ATN_Attendance].[Applied2LeaveTypeID] DESC'
                        WHEN 'Posted' THEN '[ATN_Attendance].[Posted]'
                        WHEN 'Posted DESC' THEN '[ATN_Attendance].[Posted] DESC'
                        WHEN 'Posted1LeaveTypeID' THEN '[ATN_Attendance].[Posted1LeaveTypeID]'
                        WHEN 'Posted1LeaveTypeID DESC' THEN '[ATN_Attendance].[Posted1LeaveTypeID] DESC'
                        WHEN 'Posted2LeaveTypeID' THEN '[ATN_Attendance].[Posted2LeaveTypeID]'
                        WHEN 'Posted2LeaveTypeID DESC' THEN '[ATN_Attendance].[Posted2LeaveTypeID] DESC'
                        WHEN 'ApplHeaderID' THEN '[ATN_Attendance].[ApplHeaderID]'
                        WHEN 'ApplHeaderID DESC' THEN '[ATN_Attendance].[ApplHeaderID] DESC'
                        WHEN 'ApplStatusID' THEN '[ATN_Attendance].[ApplStatusID]'
                        WHEN 'ApplStatusID DESC' THEN '[ATN_Attendance].[ApplStatusID] DESC'
                        WHEN 'FinalValue' THEN '[ATN_Attendance].[FinalValue]'
                        WHEN 'FinalValue DESC' THEN '[ATN_Attendance].[FinalValue] DESC'
                        WHEN 'AdvanceApplication' THEN '[ATN_Attendance].[AdvanceApplication]'
                        WHEN 'AdvanceApplication DESC' THEN '[ATN_Attendance].[AdvanceApplication] DESC'
                        WHEN 'Destination' THEN '[ATN_Attendance].[Destination]'
                        WHEN 'Destination DESC' THEN '[ATN_Attendance].[Destination] DESC'
                        WHEN 'Purpose' THEN '[ATN_Attendance].[Purpose]'
                        WHEN 'Purpose DESC' THEN '[ATN_Attendance].[Purpose] DESC'
                        WHEN 'ATN_PunchStatus1_PunchStatusID' THEN '[ATN_PunchStatus1].[PunchStatusID]'
                        WHEN 'ATN_PunchStatus1_PunchStatusID DESC' THEN '[ATN_PunchStatus1].[PunchStatusID] DESC'
                        WHEN 'ATN_PunchStatus1_Description' THEN '[ATN_PunchStatus1].[Description]'
                        WHEN 'ATN_PunchStatus1_Description DESC' THEN '[ATN_PunchStatus1].[Description] DESC'
                        WHEN 'ATN_PunchStatus1_PunchValue' THEN '[ATN_PunchStatus1].[PunchValue]'
                        WHEN 'ATN_PunchStatus1_PunchValue DESC' THEN '[ATN_PunchStatus1].[PunchValue] DESC'
                        WHEN 'ATN_LeaveTypes2_LeaveTypeID' THEN '[ATN_LeaveTypes2].[LeaveTypeID]'
                        WHEN 'ATN_LeaveTypes2_LeaveTypeID DESC' THEN '[ATN_LeaveTypes2].[LeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes2_Description' THEN '[ATN_LeaveTypes2].[Description]'
                        WHEN 'ATN_LeaveTypes2_Description DESC' THEN '[ATN_LeaveTypes2].[Description] DESC'
                        WHEN 'ATN_LeaveTypes2_OBALApplicable' THEN '[ATN_LeaveTypes2].[OBALApplicable]'
                        WHEN 'ATN_LeaveTypes2_OBALApplicable DESC' THEN '[ATN_LeaveTypes2].[OBALApplicable] DESC'
                        WHEN 'ATN_LeaveTypes2_OBALMonthly' THEN '[ATN_LeaveTypes2].[OBALMonthly]'
                        WHEN 'ATN_LeaveTypes2_OBALMonthly DESC' THEN '[ATN_LeaveTypes2].[OBALMonthly] DESC'
                        WHEN 'ATN_LeaveTypes2_OpeningBalance' THEN '[ATN_LeaveTypes2].[OpeningBalance]'
                        WHEN 'ATN_LeaveTypes2_OpeningBalance DESC' THEN '[ATN_LeaveTypes2].[OpeningBalance] DESC'
                        WHEN 'ATN_LeaveTypes2_CarryForward' THEN '[ATN_LeaveTypes2].[CarryForward]'
                        WHEN 'ATN_LeaveTypes2_CarryForward DESC' THEN '[ATN_LeaveTypes2].[CarryForward] DESC'
                        WHEN 'ATN_LeaveTypes2_ForwardToLeaveTypeID' THEN '[ATN_LeaveTypes2].[ForwardToLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes2_ForwardToLeaveTypeID DESC' THEN '[ATN_LeaveTypes2].[ForwardToLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes2_AdvanceApplicable' THEN '[ATN_LeaveTypes2].[AdvanceApplicable]'
                        WHEN 'ATN_LeaveTypes2_AdvanceApplicable DESC' THEN '[ATN_LeaveTypes2].[AdvanceApplicable] DESC'
                        WHEN 'ATN_LeaveTypes2_SpecialSanctionRequired' THEN '[ATN_LeaveTypes2].[SpecialSanctionRequired]'
                        WHEN 'ATN_LeaveTypes2_SpecialSanctionRequired DESC' THEN '[ATN_LeaveTypes2].[SpecialSanctionRequired] DESC'
                        WHEN 'ATN_LeaveTypes2_SpecialSanctionBy' THEN '[ATN_LeaveTypes2].[SpecialSanctionBy]'
                        WHEN 'ATN_LeaveTypes2_SpecialSanctionBy DESC' THEN '[ATN_LeaveTypes2].[SpecialSanctionBy] DESC'
                        WHEN 'ATN_LeaveTypes2_Applyiable' THEN '[ATN_LeaveTypes2].[Applyiable]'
                        WHEN 'ATN_LeaveTypes2_Applyiable DESC' THEN '[ATN_LeaveTypes2].[Applyiable] DESC'
                        WHEN 'ATN_LeaveTypes2_Postable' THEN '[ATN_LeaveTypes2].[Postable]'
                        WHEN 'ATN_LeaveTypes2_Postable DESC' THEN '[ATN_LeaveTypes2].[Postable] DESC'
                        WHEN 'ATN_LeaveTypes2_PostedLeaveTypeID' THEN '[ATN_LeaveTypes2].[PostedLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes2_PostedLeaveTypeID DESC' THEN '[ATN_LeaveTypes2].[PostedLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes2_Sequence' THEN '[ATN_LeaveTypes2].[Sequence]'
                        WHEN 'ATN_LeaveTypes2_Sequence DESC' THEN '[ATN_LeaveTypes2].[Sequence] DESC'
                        WHEN 'ATN_LeaveTypes2_MainType' THEN '[ATN_LeaveTypes2].[MainType]'
                        WHEN 'ATN_LeaveTypes2_MainType DESC' THEN '[ATN_LeaveTypes2].[MainType] DESC'
                        WHEN 'ATN_LeaveTypes3_LeaveTypeID' THEN '[ATN_LeaveTypes3].[LeaveTypeID]'
                        WHEN 'ATN_LeaveTypes3_LeaveTypeID DESC' THEN '[ATN_LeaveTypes3].[LeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes3_Description' THEN '[ATN_LeaveTypes3].[Description]'
                        WHEN 'ATN_LeaveTypes3_Description DESC' THEN '[ATN_LeaveTypes3].[Description] DESC'
                        WHEN 'ATN_LeaveTypes3_OBALApplicable' THEN '[ATN_LeaveTypes3].[OBALApplicable]'
                        WHEN 'ATN_LeaveTypes3_OBALApplicable DESC' THEN '[ATN_LeaveTypes3].[OBALApplicable] DESC'
                        WHEN 'ATN_LeaveTypes3_OBALMonthly' THEN '[ATN_LeaveTypes3].[OBALMonthly]'
                        WHEN 'ATN_LeaveTypes3_OBALMonthly DESC' THEN '[ATN_LeaveTypes3].[OBALMonthly] DESC'
                        WHEN 'ATN_LeaveTypes3_OpeningBalance' THEN '[ATN_LeaveTypes3].[OpeningBalance]'
                        WHEN 'ATN_LeaveTypes3_OpeningBalance DESC' THEN '[ATN_LeaveTypes3].[OpeningBalance] DESC'
                        WHEN 'ATN_LeaveTypes3_CarryForward' THEN '[ATN_LeaveTypes3].[CarryForward]'
                        WHEN 'ATN_LeaveTypes3_CarryForward DESC' THEN '[ATN_LeaveTypes3].[CarryForward] DESC'
                        WHEN 'ATN_LeaveTypes3_ForwardToLeaveTypeID' THEN '[ATN_LeaveTypes3].[ForwardToLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes3_ForwardToLeaveTypeID DESC' THEN '[ATN_LeaveTypes3].[ForwardToLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes3_AdvanceApplicable' THEN '[ATN_LeaveTypes3].[AdvanceApplicable]'
                        WHEN 'ATN_LeaveTypes3_AdvanceApplicable DESC' THEN '[ATN_LeaveTypes3].[AdvanceApplicable] DESC'
                        WHEN 'ATN_LeaveTypes3_SpecialSanctionRequired' THEN '[ATN_LeaveTypes3].[SpecialSanctionRequired]'
                        WHEN 'ATN_LeaveTypes3_SpecialSanctionRequired DESC' THEN '[ATN_LeaveTypes3].[SpecialSanctionRequired] DESC'
                        WHEN 'ATN_LeaveTypes3_SpecialSanctionBy' THEN '[ATN_LeaveTypes3].[SpecialSanctionBy]'
                        WHEN 'ATN_LeaveTypes3_SpecialSanctionBy DESC' THEN '[ATN_LeaveTypes3].[SpecialSanctionBy] DESC'
                        WHEN 'ATN_LeaveTypes3_Applyiable' THEN '[ATN_LeaveTypes3].[Applyiable]'
                        WHEN 'ATN_LeaveTypes3_Applyiable DESC' THEN '[ATN_LeaveTypes3].[Applyiable] DESC'
                        WHEN 'ATN_LeaveTypes3_Postable' THEN '[ATN_LeaveTypes3].[Postable]'
                        WHEN 'ATN_LeaveTypes3_Postable DESC' THEN '[ATN_LeaveTypes3].[Postable] DESC'
                        WHEN 'ATN_LeaveTypes3_PostedLeaveTypeID' THEN '[ATN_LeaveTypes3].[PostedLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes3_PostedLeaveTypeID DESC' THEN '[ATN_LeaveTypes3].[PostedLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes3_Sequence' THEN '[ATN_LeaveTypes3].[Sequence]'
                        WHEN 'ATN_LeaveTypes3_Sequence DESC' THEN '[ATN_LeaveTypes3].[Sequence] DESC'
                        WHEN 'ATN_LeaveTypes3_MainType' THEN '[ATN_LeaveTypes3].[MainType]'
                        WHEN 'ATN_LeaveTypes3_MainType DESC' THEN '[ATN_LeaveTypes3].[MainType] DESC'
                        WHEN 'ATN_LeaveTypes4_LeaveTypeID' THEN '[ATN_LeaveTypes4].[LeaveTypeID]'
                        WHEN 'ATN_LeaveTypes4_LeaveTypeID DESC' THEN '[ATN_LeaveTypes4].[LeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes4_Description' THEN '[ATN_LeaveTypes4].[Description]'
                        WHEN 'ATN_LeaveTypes4_Description DESC' THEN '[ATN_LeaveTypes4].[Description] DESC'
                        WHEN 'ATN_LeaveTypes4_OBALApplicable' THEN '[ATN_LeaveTypes4].[OBALApplicable]'
                        WHEN 'ATN_LeaveTypes4_OBALApplicable DESC' THEN '[ATN_LeaveTypes4].[OBALApplicable] DESC'
                        WHEN 'ATN_LeaveTypes4_OBALMonthly' THEN '[ATN_LeaveTypes4].[OBALMonthly]'
                        WHEN 'ATN_LeaveTypes4_OBALMonthly DESC' THEN '[ATN_LeaveTypes4].[OBALMonthly] DESC'
                        WHEN 'ATN_LeaveTypes4_OpeningBalance' THEN '[ATN_LeaveTypes4].[OpeningBalance]'
                        WHEN 'ATN_LeaveTypes4_OpeningBalance DESC' THEN '[ATN_LeaveTypes4].[OpeningBalance] DESC'
                        WHEN 'ATN_LeaveTypes4_CarryForward' THEN '[ATN_LeaveTypes4].[CarryForward]'
                        WHEN 'ATN_LeaveTypes4_CarryForward DESC' THEN '[ATN_LeaveTypes4].[CarryForward] DESC'
                        WHEN 'ATN_LeaveTypes4_ForwardToLeaveTypeID' THEN '[ATN_LeaveTypes4].[ForwardToLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes4_ForwardToLeaveTypeID DESC' THEN '[ATN_LeaveTypes4].[ForwardToLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes4_AdvanceApplicable' THEN '[ATN_LeaveTypes4].[AdvanceApplicable]'
                        WHEN 'ATN_LeaveTypes4_AdvanceApplicable DESC' THEN '[ATN_LeaveTypes4].[AdvanceApplicable] DESC'
                        WHEN 'ATN_LeaveTypes4_SpecialSanctionRequired' THEN '[ATN_LeaveTypes4].[SpecialSanctionRequired]'
                        WHEN 'ATN_LeaveTypes4_SpecialSanctionRequired DESC' THEN '[ATN_LeaveTypes4].[SpecialSanctionRequired] DESC'
                        WHEN 'ATN_LeaveTypes4_SpecialSanctionBy' THEN '[ATN_LeaveTypes4].[SpecialSanctionBy]'
                        WHEN 'ATN_LeaveTypes4_SpecialSanctionBy DESC' THEN '[ATN_LeaveTypes4].[SpecialSanctionBy] DESC'
                        WHEN 'ATN_LeaveTypes4_Applyiable' THEN '[ATN_LeaveTypes4].[Applyiable]'
                        WHEN 'ATN_LeaveTypes4_Applyiable DESC' THEN '[ATN_LeaveTypes4].[Applyiable] DESC'
                        WHEN 'ATN_LeaveTypes4_Postable' THEN '[ATN_LeaveTypes4].[Postable]'
                        WHEN 'ATN_LeaveTypes4_Postable DESC' THEN '[ATN_LeaveTypes4].[Postable] DESC'
                        WHEN 'ATN_LeaveTypes4_PostedLeaveTypeID' THEN '[ATN_LeaveTypes4].[PostedLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes4_PostedLeaveTypeID DESC' THEN '[ATN_LeaveTypes4].[PostedLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes4_Sequence' THEN '[ATN_LeaveTypes4].[Sequence]'
                        WHEN 'ATN_LeaveTypes4_Sequence DESC' THEN '[ATN_LeaveTypes4].[Sequence] DESC'
                        WHEN 'ATN_LeaveTypes4_MainType' THEN '[ATN_LeaveTypes4].[MainType]'
                        WHEN 'ATN_LeaveTypes4_MainType DESC' THEN '[ATN_LeaveTypes4].[MainType] DESC'
                        WHEN 'ATN_LeaveTypes5_LeaveTypeID' THEN '[ATN_LeaveTypes5].[LeaveTypeID]'
                        WHEN 'ATN_LeaveTypes5_LeaveTypeID DESC' THEN '[ATN_LeaveTypes5].[LeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes5_Description' THEN '[ATN_LeaveTypes5].[Description]'
                        WHEN 'ATN_LeaveTypes5_Description DESC' THEN '[ATN_LeaveTypes5].[Description] DESC'
                        WHEN 'ATN_LeaveTypes5_OBALApplicable' THEN '[ATN_LeaveTypes5].[OBALApplicable]'
                        WHEN 'ATN_LeaveTypes5_OBALApplicable DESC' THEN '[ATN_LeaveTypes5].[OBALApplicable] DESC'
                        WHEN 'ATN_LeaveTypes5_OBALMonthly' THEN '[ATN_LeaveTypes5].[OBALMonthly]'
                        WHEN 'ATN_LeaveTypes5_OBALMonthly DESC' THEN '[ATN_LeaveTypes5].[OBALMonthly] DESC'
                        WHEN 'ATN_LeaveTypes5_OpeningBalance' THEN '[ATN_LeaveTypes5].[OpeningBalance]'
                        WHEN 'ATN_LeaveTypes5_OpeningBalance DESC' THEN '[ATN_LeaveTypes5].[OpeningBalance] DESC'
                        WHEN 'ATN_LeaveTypes5_CarryForward' THEN '[ATN_LeaveTypes5].[CarryForward]'
                        WHEN 'ATN_LeaveTypes5_CarryForward DESC' THEN '[ATN_LeaveTypes5].[CarryForward] DESC'
                        WHEN 'ATN_LeaveTypes5_ForwardToLeaveTypeID' THEN '[ATN_LeaveTypes5].[ForwardToLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes5_ForwardToLeaveTypeID DESC' THEN '[ATN_LeaveTypes5].[ForwardToLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes5_AdvanceApplicable' THEN '[ATN_LeaveTypes5].[AdvanceApplicable]'
                        WHEN 'ATN_LeaveTypes5_AdvanceApplicable DESC' THEN '[ATN_LeaveTypes5].[AdvanceApplicable] DESC'
                        WHEN 'ATN_LeaveTypes5_SpecialSanctionRequired' THEN '[ATN_LeaveTypes5].[SpecialSanctionRequired]'
                        WHEN 'ATN_LeaveTypes5_SpecialSanctionRequired DESC' THEN '[ATN_LeaveTypes5].[SpecialSanctionRequired] DESC'
                        WHEN 'ATN_LeaveTypes5_SpecialSanctionBy' THEN '[ATN_LeaveTypes5].[SpecialSanctionBy]'
                        WHEN 'ATN_LeaveTypes5_SpecialSanctionBy DESC' THEN '[ATN_LeaveTypes5].[SpecialSanctionBy] DESC'
                        WHEN 'ATN_LeaveTypes5_Applyiable' THEN '[ATN_LeaveTypes5].[Applyiable]'
                        WHEN 'ATN_LeaveTypes5_Applyiable DESC' THEN '[ATN_LeaveTypes5].[Applyiable] DESC'
                        WHEN 'ATN_LeaveTypes5_Postable' THEN '[ATN_LeaveTypes5].[Postable]'
                        WHEN 'ATN_LeaveTypes5_Postable DESC' THEN '[ATN_LeaveTypes5].[Postable] DESC'
                        WHEN 'ATN_LeaveTypes5_PostedLeaveTypeID' THEN '[ATN_LeaveTypes5].[PostedLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes5_PostedLeaveTypeID DESC' THEN '[ATN_LeaveTypes5].[PostedLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes5_Sequence' THEN '[ATN_LeaveTypes5].[Sequence]'
                        WHEN 'ATN_LeaveTypes5_Sequence DESC' THEN '[ATN_LeaveTypes5].[Sequence] DESC'
                        WHEN 'ATN_LeaveTypes5_MainType' THEN '[ATN_LeaveTypes5].[MainType]'
                        WHEN 'ATN_LeaveTypes5_MainType DESC' THEN '[ATN_LeaveTypes5].[MainType] DESC'
                        WHEN 'ATN_ApplicationStatus6_ApplStatusID' THEN '[ATN_ApplicationStatus6].[ApplStatusID]'
                        WHEN 'ATN_ApplicationStatus6_ApplStatusID DESC' THEN '[ATN_ApplicationStatus6].[ApplStatusID] DESC'
                        WHEN 'ATN_ApplicationStatus6_Description' THEN '[ATN_ApplicationStatus6].[Description]'
                        WHEN 'ATN_ApplicationStatus6_Description DESC' THEN '[ATN_ApplicationStatus6].[Description] DESC'
                        ELSE '[ATN_Attendance].[AttenID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_Attendance].[AttenID],
		[ATN_Attendance].[AttenDate],
		[ATN_Attendance].[CardNo],
		[ATN_Attendance].[Punch1Time],
		[ATN_Attendance].[Punch2Time],
		[ATN_Attendance].[PunchStatusID],
		[ATN_Attendance].[PunchValue],
		[ATN_Attendance].[NeedsRegularization],
		[ATN_Attendance].[FinYear],
		[ATN_Attendance].[Applied],
		[ATN_Attendance].[AppliedValue],
		[ATN_Attendance].[Applied1LeaveTypeID],
		[ATN_Attendance].[Applied2LeaveTypeID],
		[ATN_Attendance].[Posted],
		[ATN_Attendance].[Posted1LeaveTypeID],
		[ATN_Attendance].[Posted2LeaveTypeID],
		[ATN_Attendance].[ApplHeaderID],
		[ATN_Attendance].[ApplStatusID],
		[ATN_Attendance].[FinalValue],
		[ATN_Attendance].[AdvanceApplication],
		[ATN_Attendance].[Destination],
		[ATN_Attendance].[Purpose],
		[ATN_PunchStatus1].[PunchStatusID] AS ATN_PunchStatus1_PunchStatusID,
		[ATN_PunchStatus1].[Description] AS ATN_PunchStatus1_Description,
		[ATN_PunchStatus1].[PunchValue] AS ATN_PunchStatus1_PunchValue,
		[ATN_LeaveTypes2].[LeaveTypeID] AS ATN_LeaveTypes2_LeaveTypeID,
		[ATN_LeaveTypes2].[Description] AS ATN_LeaveTypes2_Description,
		[ATN_LeaveTypes2].[OBALApplicable] AS ATN_LeaveTypes2_OBALApplicable,
		[ATN_LeaveTypes2].[OBALMonthly] AS ATN_LeaveTypes2_OBALMonthly,
		[ATN_LeaveTypes2].[OpeningBalance] AS ATN_LeaveTypes2_OpeningBalance,
		[ATN_LeaveTypes2].[CarryForward] AS ATN_LeaveTypes2_CarryForward,
		[ATN_LeaveTypes2].[ForwardToLeaveTypeID] AS ATN_LeaveTypes2_ForwardToLeaveTypeID,
		[ATN_LeaveTypes2].[AdvanceApplicable] AS ATN_LeaveTypes2_AdvanceApplicable,
		[ATN_LeaveTypes2].[SpecialSanctionRequired] AS ATN_LeaveTypes2_SpecialSanctionRequired,
		[ATN_LeaveTypes2].[SpecialSanctionBy] AS ATN_LeaveTypes2_SpecialSanctionBy,
		[ATN_LeaveTypes2].[Applyiable] AS ATN_LeaveTypes2_Applyiable,
		[ATN_LeaveTypes2].[Postable] AS ATN_LeaveTypes2_Postable,
		[ATN_LeaveTypes2].[PostedLeaveTypeID] AS ATN_LeaveTypes2_PostedLeaveTypeID,
		[ATN_LeaveTypes2].[Sequence] AS ATN_LeaveTypes2_Sequence,
		[ATN_LeaveTypes2].[MainType] AS ATN_LeaveTypes2_MainType,
		[ATN_LeaveTypes3].[LeaveTypeID] AS ATN_LeaveTypes3_LeaveTypeID,
		[ATN_LeaveTypes3].[Description] AS ATN_LeaveTypes3_Description,
		[ATN_LeaveTypes3].[OBALApplicable] AS ATN_LeaveTypes3_OBALApplicable,
		[ATN_LeaveTypes3].[OBALMonthly] AS ATN_LeaveTypes3_OBALMonthly,
		[ATN_LeaveTypes3].[OpeningBalance] AS ATN_LeaveTypes3_OpeningBalance,
		[ATN_LeaveTypes3].[CarryForward] AS ATN_LeaveTypes3_CarryForward,
		[ATN_LeaveTypes3].[ForwardToLeaveTypeID] AS ATN_LeaveTypes3_ForwardToLeaveTypeID,
		[ATN_LeaveTypes3].[AdvanceApplicable] AS ATN_LeaveTypes3_AdvanceApplicable,
		[ATN_LeaveTypes3].[SpecialSanctionRequired] AS ATN_LeaveTypes3_SpecialSanctionRequired,
		[ATN_LeaveTypes3].[SpecialSanctionBy] AS ATN_LeaveTypes3_SpecialSanctionBy,
		[ATN_LeaveTypes3].[Applyiable] AS ATN_LeaveTypes3_Applyiable,
		[ATN_LeaveTypes3].[Postable] AS ATN_LeaveTypes3_Postable,
		[ATN_LeaveTypes3].[PostedLeaveTypeID] AS ATN_LeaveTypes3_PostedLeaveTypeID,
		[ATN_LeaveTypes3].[Sequence] AS ATN_LeaveTypes3_Sequence,
		[ATN_LeaveTypes3].[MainType] AS ATN_LeaveTypes3_MainType,
		[ATN_LeaveTypes4].[LeaveTypeID] AS ATN_LeaveTypes4_LeaveTypeID,
		[ATN_LeaveTypes4].[Description] AS ATN_LeaveTypes4_Description,
		[ATN_LeaveTypes4].[OBALApplicable] AS ATN_LeaveTypes4_OBALApplicable,
		[ATN_LeaveTypes4].[OBALMonthly] AS ATN_LeaveTypes4_OBALMonthly,
		[ATN_LeaveTypes4].[OpeningBalance] AS ATN_LeaveTypes4_OpeningBalance,
		[ATN_LeaveTypes4].[CarryForward] AS ATN_LeaveTypes4_CarryForward,
		[ATN_LeaveTypes4].[ForwardToLeaveTypeID] AS ATN_LeaveTypes4_ForwardToLeaveTypeID,
		[ATN_LeaveTypes4].[AdvanceApplicable] AS ATN_LeaveTypes4_AdvanceApplicable,
		[ATN_LeaveTypes4].[SpecialSanctionRequired] AS ATN_LeaveTypes4_SpecialSanctionRequired,
		[ATN_LeaveTypes4].[SpecialSanctionBy] AS ATN_LeaveTypes4_SpecialSanctionBy,
		[ATN_LeaveTypes4].[Applyiable] AS ATN_LeaveTypes4_Applyiable,
		[ATN_LeaveTypes4].[Postable] AS ATN_LeaveTypes4_Postable,
		[ATN_LeaveTypes4].[PostedLeaveTypeID] AS ATN_LeaveTypes4_PostedLeaveTypeID,
		[ATN_LeaveTypes4].[Sequence] AS ATN_LeaveTypes4_Sequence,
		[ATN_LeaveTypes4].[MainType] AS ATN_LeaveTypes4_MainType,
		[ATN_LeaveTypes5].[LeaveTypeID] AS ATN_LeaveTypes5_LeaveTypeID,
		[ATN_LeaveTypes5].[Description] AS ATN_LeaveTypes5_Description,
		[ATN_LeaveTypes5].[OBALApplicable] AS ATN_LeaveTypes5_OBALApplicable,
		[ATN_LeaveTypes5].[OBALMonthly] AS ATN_LeaveTypes5_OBALMonthly,
		[ATN_LeaveTypes5].[OpeningBalance] AS ATN_LeaveTypes5_OpeningBalance,
		[ATN_LeaveTypes5].[CarryForward] AS ATN_LeaveTypes5_CarryForward,
		[ATN_LeaveTypes5].[ForwardToLeaveTypeID] AS ATN_LeaveTypes5_ForwardToLeaveTypeID,
		[ATN_LeaveTypes5].[AdvanceApplicable] AS ATN_LeaveTypes5_AdvanceApplicable,
		[ATN_LeaveTypes5].[SpecialSanctionRequired] AS ATN_LeaveTypes5_SpecialSanctionRequired,
		[ATN_LeaveTypes5].[SpecialSanctionBy] AS ATN_LeaveTypes5_SpecialSanctionBy,
		[ATN_LeaveTypes5].[Applyiable] AS ATN_LeaveTypes5_Applyiable,
		[ATN_LeaveTypes5].[Postable] AS ATN_LeaveTypes5_Postable,
		[ATN_LeaveTypes5].[PostedLeaveTypeID] AS ATN_LeaveTypes5_PostedLeaveTypeID,
		[ATN_LeaveTypes5].[Sequence] AS ATN_LeaveTypes5_Sequence,
		[ATN_LeaveTypes5].[MainType] AS ATN_LeaveTypes5_MainType,
		[ATN_ApplicationStatus6].[ApplStatusID] AS ATN_ApplicationStatus6_ApplStatusID,
		[ATN_ApplicationStatus6].[Description] AS ATN_ApplicationStatus6_Description 
  FROM [ATN_Attendance] 
    	INNER JOIN #PageIndex
          ON [ATN_Attendance].[AttenID] = #PageIndex.AttenID
  LEFT OUTER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus1]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus1].[PunchStatusID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes2]
    ON [ATN_Attendance].[Applied1LeaveTypeID] = [ATN_LeaveTypes2].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_Attendance].[Applied2LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes4]
    ON [ATN_Attendance].[Posted1LeaveTypeID] = [ATN_LeaveTypes4].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes5]
    ON [ATN_Attendance].[Posted2LeaveTypeID] = [ATN_LeaveTypes5].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus6]
    ON [ATN_Attendance].[ApplStatusID] = [ATN_ApplicationStatus6].[ApplStatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

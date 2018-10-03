USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessedPunchStatusSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AttenID Int NOT NULL
  )
  INSERT INTO #PageIndex (AttenID)
  SELECT [ATN_Attendance].[AttenID] FROM [ATN_Attendance]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_Attendance].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_Attendance].[Applied1LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes4]
    ON [ATN_Attendance].[Applied2LeaveTypeID] = [ATN_LeaveTypes4].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus5]
    ON [ATN_Attendance].[ApplStatusID] = [ATN_ApplicationStatus5].[ApplStatusID]
 WHERE  
      [ATN_Attendance].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([ATN_Attendance].[AttenID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[Punch1Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[Punch2Time], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[PunchStatusID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[PunchValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[Applied1LeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[Applied2LeaveTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[ApplHeaderID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[ApplStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchStatus2].[PunchStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchStatus2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchStatus2].[PunchValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[LeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveTypes3].[OpeningBalance], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[ForwardToLeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[SpecialSanctionBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[PostedLeaveTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveTypes3].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes4].[LeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes4].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveTypes4].[OpeningBalance], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes4].[ForwardToLeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes4].[SpecialSanctionBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes4].[PostedLeaveTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveTypes4].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplicationStatus5].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'AttenID' THEN [ATN_Attendance].[AttenID] END,
     CASE @orderBy WHEN 'AttenID DESC' THEN [ATN_Attendance].[AttenID] END DESC,
     CASE @orderBy WHEN 'AttenDate' THEN [ATN_Attendance].[AttenDate] END,
     CASE @orderBy WHEN 'AttenDate DESC' THEN [ATN_Attendance].[AttenDate] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_Attendance].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_Attendance].[CardNo] END DESC,
     CASE @orderBy WHEN 'Punch1Time' THEN [ATN_Attendance].[Punch1Time] END,
     CASE @orderBy WHEN 'Punch1Time DESC' THEN [ATN_Attendance].[Punch1Time] END DESC,
     CASE @orderBy WHEN 'Punch2Time' THEN [ATN_Attendance].[Punch2Time] END,
     CASE @orderBy WHEN 'Punch2Time DESC' THEN [ATN_Attendance].[Punch2Time] END DESC,
     CASE @orderBy WHEN 'PunchStatusID' THEN [ATN_Attendance].[PunchStatusID] END,
     CASE @orderBy WHEN 'PunchStatusID DESC' THEN [ATN_Attendance].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'PunchValue' THEN [ATN_Attendance].[PunchValue] END,
     CASE @orderBy WHEN 'PunchValue DESC' THEN [ATN_Attendance].[PunchValue] END DESC,
     CASE @orderBy WHEN 'NeedsRegularization' THEN [ATN_Attendance].[NeedsRegularization] END,
     CASE @orderBy WHEN 'NeedsRegularization DESC' THEN [ATN_Attendance].[NeedsRegularization] END DESC,
     CASE @orderBy WHEN 'Applied' THEN [ATN_Attendance].[Applied] END,
     CASE @orderBy WHEN 'Applied DESC' THEN [ATN_Attendance].[Applied] END DESC,
     CASE @orderBy WHEN 'Applied1LeaveTypeID' THEN [ATN_Attendance].[Applied1LeaveTypeID] END,
     CASE @orderBy WHEN 'Applied1LeaveTypeID DESC' THEN [ATN_Attendance].[Applied1LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'Applied2LeaveTypeID' THEN [ATN_Attendance].[Applied2LeaveTypeID] END,
     CASE @orderBy WHEN 'Applied2LeaveTypeID DESC' THEN [ATN_Attendance].[Applied2LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ApplHeaderID' THEN [ATN_Attendance].[ApplHeaderID] END,
     CASE @orderBy WHEN 'ApplHeaderID DESC' THEN [ATN_Attendance].[ApplHeaderID] END DESC,
     CASE @orderBy WHEN 'ApplStatusID' THEN [ATN_Attendance].[ApplStatusID] END,
     CASE @orderBy WHEN 'ApplStatusID DESC' THEN [ATN_Attendance].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'Posted' THEN [ATN_Attendance].[Posted] END,
     CASE @orderBy WHEN 'Posted DESC' THEN [ATN_Attendance].[Posted] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_Attendance].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_Attendance].[FinYear] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchStatusID' THEN [ATN_PunchStatus2].[PunchStatusID] END,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchStatusID DESC' THEN [ATN_PunchStatus2].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'ATN_PunchStatus2_Description' THEN [ATN_PunchStatus2].[Description] END,
     CASE @orderBy WHEN 'ATN_PunchStatus2_Description DESC' THEN [ATN_PunchStatus2].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchValue' THEN [ATN_PunchStatus2].[PunchValue] END,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchValue DESC' THEN [ATN_PunchStatus2].[PunchValue] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_LeaveTypeID' THEN [ATN_LeaveTypes3].[LeaveTypeID] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_LeaveTypeID DESC' THEN [ATN_LeaveTypes3].[LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Description' THEN [ATN_LeaveTypes3].[Description] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Description DESC' THEN [ATN_LeaveTypes3].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_OBALApplicable' THEN [ATN_LeaveTypes3].[OBALApplicable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_OBALApplicable DESC' THEN [ATN_LeaveTypes3].[OBALApplicable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_OBALMonthly' THEN [ATN_LeaveTypes3].[OBALMonthly] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_OBALMonthly DESC' THEN [ATN_LeaveTypes3].[OBALMonthly] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_OpeningBalance' THEN [ATN_LeaveTypes3].[OpeningBalance] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_OpeningBalance DESC' THEN [ATN_LeaveTypes3].[OpeningBalance] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_CarryForward' THEN [ATN_LeaveTypes3].[CarryForward] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_CarryForward DESC' THEN [ATN_LeaveTypes3].[CarryForward] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_ForwardToLeaveTypeID' THEN [ATN_LeaveTypes3].[ForwardToLeaveTypeID] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_ForwardToLeaveTypeID DESC' THEN [ATN_LeaveTypes3].[ForwardToLeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_AdvanceApplicable' THEN [ATN_LeaveTypes3].[AdvanceApplicable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_AdvanceApplicable DESC' THEN [ATN_LeaveTypes3].[AdvanceApplicable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_SpecialSanctionRequired' THEN [ATN_LeaveTypes3].[SpecialSanctionRequired] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_SpecialSanctionRequired DESC' THEN [ATN_LeaveTypes3].[SpecialSanctionRequired] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_SpecialSanctionBy' THEN [ATN_LeaveTypes3].[SpecialSanctionBy] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_SpecialSanctionBy DESC' THEN [ATN_LeaveTypes3].[SpecialSanctionBy] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Applyiable' THEN [ATN_LeaveTypes3].[Applyiable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Applyiable DESC' THEN [ATN_LeaveTypes3].[Applyiable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Postable' THEN [ATN_LeaveTypes3].[Postable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Postable DESC' THEN [ATN_LeaveTypes3].[Postable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_PostedLeaveTypeID' THEN [ATN_LeaveTypes3].[PostedLeaveTypeID] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_PostedLeaveTypeID DESC' THEN [ATN_LeaveTypes3].[PostedLeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Sequence' THEN [ATN_LeaveTypes3].[Sequence] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Sequence DESC' THEN [ATN_LeaveTypes3].[Sequence] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_MainType' THEN [ATN_LeaveTypes3].[MainType] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_MainType DESC' THEN [ATN_LeaveTypes3].[MainType] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_LeaveTypeID' THEN [ATN_LeaveTypes4].[LeaveTypeID] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_LeaveTypeID DESC' THEN [ATN_LeaveTypes4].[LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_Description' THEN [ATN_LeaveTypes4].[Description] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_Description DESC' THEN [ATN_LeaveTypes4].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_OBALApplicable' THEN [ATN_LeaveTypes4].[OBALApplicable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_OBALApplicable DESC' THEN [ATN_LeaveTypes4].[OBALApplicable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_OBALMonthly' THEN [ATN_LeaveTypes4].[OBALMonthly] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_OBALMonthly DESC' THEN [ATN_LeaveTypes4].[OBALMonthly] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_OpeningBalance' THEN [ATN_LeaveTypes4].[OpeningBalance] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_OpeningBalance DESC' THEN [ATN_LeaveTypes4].[OpeningBalance] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_CarryForward' THEN [ATN_LeaveTypes4].[CarryForward] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_CarryForward DESC' THEN [ATN_LeaveTypes4].[CarryForward] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_ForwardToLeaveTypeID' THEN [ATN_LeaveTypes4].[ForwardToLeaveTypeID] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_ForwardToLeaveTypeID DESC' THEN [ATN_LeaveTypes4].[ForwardToLeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_AdvanceApplicable' THEN [ATN_LeaveTypes4].[AdvanceApplicable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_AdvanceApplicable DESC' THEN [ATN_LeaveTypes4].[AdvanceApplicable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_SpecialSanctionRequired' THEN [ATN_LeaveTypes4].[SpecialSanctionRequired] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_SpecialSanctionRequired DESC' THEN [ATN_LeaveTypes4].[SpecialSanctionRequired] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_SpecialSanctionBy' THEN [ATN_LeaveTypes4].[SpecialSanctionBy] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_SpecialSanctionBy DESC' THEN [ATN_LeaveTypes4].[SpecialSanctionBy] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_Applyiable' THEN [ATN_LeaveTypes4].[Applyiable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_Applyiable DESC' THEN [ATN_LeaveTypes4].[Applyiable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_Postable' THEN [ATN_LeaveTypes4].[Postable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_Postable DESC' THEN [ATN_LeaveTypes4].[Postable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_PostedLeaveTypeID' THEN [ATN_LeaveTypes4].[PostedLeaveTypeID] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_PostedLeaveTypeID DESC' THEN [ATN_LeaveTypes4].[PostedLeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_Sequence' THEN [ATN_LeaveTypes4].[Sequence] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_Sequence DESC' THEN [ATN_LeaveTypes4].[Sequence] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_MainType' THEN [ATN_LeaveTypes4].[MainType] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes4_MainType DESC' THEN [ATN_LeaveTypes4].[MainType] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus5_ApplStatusID' THEN [ATN_ApplicationStatus5].[ApplStatusID] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus5_ApplStatusID DESC' THEN [ATN_ApplicationStatus5].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus5_Description' THEN [ATN_ApplicationStatus5].[Description] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus5_Description DESC' THEN [ATN_ApplicationStatus5].[Description] END DESC 

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
		[ATN_Attendance].[Applied],
		[ATN_Attendance].[Applied1LeaveTypeID],
		[ATN_Attendance].[Applied2LeaveTypeID],
		[ATN_Attendance].[ApplHeaderID],
		[ATN_Attendance].[ApplStatusID],
		[ATN_Attendance].[Posted],
		[ATN_Attendance].[FinYear],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[ATN_PunchStatus2].[PunchStatusID] AS ATN_PunchStatus2_PunchStatusID,
		[ATN_PunchStatus2].[Description] AS ATN_PunchStatus2_Description,
		[ATN_PunchStatus2].[PunchValue] AS ATN_PunchStatus2_PunchValue,
		[ATN_LeaveTypes3].[LeaveTypeID] AS ATN_LeaveTypes3_LeaveTypeID,
		[ATN_LeaveTypes3].[Description] AS ATN_LeaveTypes3_Description,
		[ATN_LeaveTypes4].[LeaveTypeID] AS ATN_LeaveTypes4_LeaveTypeID,
		[ATN_LeaveTypes4].[Description] AS ATN_LeaveTypes4_Description,
		[ATN_ApplicationStatus5].[ApplStatusID] AS ATN_ApplicationStatus5_ApplStatusID,
		[ATN_ApplicationStatus5].[Description] AS ATN_ApplicationStatus5_Description 
  FROM [ATN_Attendance] 
    	INNER JOIN #PageIndex
          ON [ATN_Attendance].[AttenID] = #PageIndex.AttenID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_Attendance].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_Attendance].[Applied1LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes4]
    ON [ATN_Attendance].[Applied2LeaveTypeID] = [ATN_LeaveTypes4].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus5]
    ON [ATN_Attendance].[ApplStatusID] = [ATN_ApplicationStatus5].[ApplStatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

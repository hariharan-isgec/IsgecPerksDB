USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveLedgerSelectListSearch]
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
  RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [ATN_LeaveLedger].[RecordID] FROM [ATN_LeaveLedger]
  INNER JOIN [ATN_TranType] AS [ATN_TranType1]
    ON [ATN_LeaveLedger].[TranType] = [ATN_TranType1].[TranType]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_LeaveLedger].[CardNo] = [HRM_Employees2].[CardNo]
  INNER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_LeaveLedger].[LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear4]
    ON [ATN_LeaveLedger].[FinYear] = [ATN_FinYear4].[FinYear]
 WHERE  
      [ATN_LeaveLedger].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([ATN_LeaveLedger].[RecordID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveLedger].[TranType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveLedger].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveLedger].[LeaveTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveLedger].[InProcessDays], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveLedger].[Days], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveLedger].[FinYear],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveLedger].[ApplHeaderID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveLedger].[ApplDetailID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_TranType1].[TranType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_TranType1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[LeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveTypes3].[OpeningBalance], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[ForwardToLeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[SpecialSanctionBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes3].[PostedLeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_FinYear4].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_FinYear4].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [ATN_LeaveLedger].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [ATN_LeaveLedger].[RecordID] END DESC,
     CASE @orderBy WHEN 'TranType' THEN [ATN_LeaveLedger].[TranType] END,
     CASE @orderBy WHEN 'TranType DESC' THEN [ATN_LeaveLedger].[TranType] END DESC,
     CASE @orderBy WHEN 'TranDate' THEN [ATN_LeaveLedger].[TranDate] END,
     CASE @orderBy WHEN 'TranDate DESC' THEN [ATN_LeaveLedger].[TranDate] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_LeaveLedger].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_LeaveLedger].[CardNo] END DESC,
     CASE @orderBy WHEN 'LeaveTypeID' THEN [ATN_LeaveLedger].[LeaveTypeID] END,
     CASE @orderBy WHEN 'LeaveTypeID DESC' THEN [ATN_LeaveLedger].[LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'InProcessDays' THEN [ATN_LeaveLedger].[InProcessDays] END,
     CASE @orderBy WHEN 'InProcessDays DESC' THEN [ATN_LeaveLedger].[InProcessDays] END DESC,
     CASE @orderBy WHEN 'Days' THEN [ATN_LeaveLedger].[Days] END,
     CASE @orderBy WHEN 'Days DESC' THEN [ATN_LeaveLedger].[Days] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_LeaveLedger].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_LeaveLedger].[FinYear] END DESC,
     CASE @orderBy WHEN 'ApplHeaderID' THEN [ATN_LeaveLedger].[ApplHeaderID] END,
     CASE @orderBy WHEN 'ApplHeaderID DESC' THEN [ATN_LeaveLedger].[ApplHeaderID] END DESC,
     CASE @orderBy WHEN 'ApplDetailID' THEN [ATN_LeaveLedger].[ApplDetailID] END,
     CASE @orderBy WHEN 'ApplDetailID DESC' THEN [ATN_LeaveLedger].[ApplDetailID] END DESC,
     CASE @orderBy WHEN 'ATN_TranType1_TranType' THEN [ATN_TranType1].[TranType] END,
     CASE @orderBy WHEN 'ATN_TranType1_TranType DESC' THEN [ATN_TranType1].[TranType] END DESC,
     CASE @orderBy WHEN 'ATN_TranType1_Description' THEN [ATN_TranType1].[Description] END,
     CASE @orderBy WHEN 'ATN_TranType1_Description DESC' THEN [ATN_TranType1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_VerificationRequired' THEN [HRM_Employees2].[VerificationRequired] END,
     CASE @orderBy WHEN 'HRM_Employees2_VerificationRequired DESC' THEN [HRM_Employees2].[VerificationRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_VerifierID' THEN [HRM_Employees2].[VerifierID] END,
     CASE @orderBy WHEN 'HRM_Employees2_VerifierID DESC' THEN [HRM_Employees2].[VerifierID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_ApprovalRequired' THEN [HRM_Employees2].[ApprovalRequired] END,
     CASE @orderBy WHEN 'HRM_Employees2_ApprovalRequired DESC' THEN [HRM_Employees2].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_ApproverID' THEN [HRM_Employees2].[ApproverID] END,
     CASE @orderBy WHEN 'HRM_Employees2_ApproverID DESC' THEN [HRM_Employees2].[ApproverID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfJoining' THEN [HRM_Employees2].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfJoining DESC' THEN [HRM_Employees2].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfReleaving' THEN [HRM_Employees2].[C_DateOfReleaving] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfReleaving DESC' THEN [HRM_Employees2].[C_DateOfReleaving] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_CompanyID' THEN [HRM_Employees2].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_CompanyID DESC' THEN [HRM_Employees2].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DivisionID' THEN [HRM_Employees2].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DivisionID DESC' THEN [HRM_Employees2].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID' THEN [HRM_Employees2].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID DESC' THEN [HRM_Employees2].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DepartmentID' THEN [HRM_Employees2].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DepartmentID DESC' THEN [HRM_Employees2].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DesignationID' THEN [HRM_Employees2].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DesignationID DESC' THEN [HRM_Employees2].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_ActiveState' THEN [HRM_Employees2].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees2_ActiveState DESC' THEN [HRM_Employees2].[ActiveState] END DESC,
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
     CASE @orderBy WHEN 'ATN_FinYear4_FinYear' THEN [ATN_FinYear4].[FinYear] END,
     CASE @orderBy WHEN 'ATN_FinYear4_FinYear DESC' THEN [ATN_FinYear4].[FinYear] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear4_Description' THEN [ATN_FinYear4].[Description] END,
     CASE @orderBy WHEN 'ATN_FinYear4_Description DESC' THEN [ATN_FinYear4].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear4_StartDate' THEN [ATN_FinYear4].[StartDate] END,
     CASE @orderBy WHEN 'ATN_FinYear4_StartDate DESC' THEN [ATN_FinYear4].[StartDate] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear4_EndDate' THEN [ATN_FinYear4].[EndDate] END,
     CASE @orderBy WHEN 'ATN_FinYear4_EndDate DESC' THEN [ATN_FinYear4].[EndDate] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear4_Active' THEN [ATN_FinYear4].[Active] END,
     CASE @orderBy WHEN 'ATN_FinYear4_Active DESC' THEN [ATN_FinYear4].[Active] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_LeaveLedger].[RecordID],
		[ATN_LeaveLedger].[TranType],
		[ATN_LeaveLedger].[TranDate],
		[ATN_LeaveLedger].[CardNo],
		[ATN_LeaveLedger].[LeaveTypeID],
		[ATN_LeaveLedger].[InProcessDays],
		[ATN_LeaveLedger].[Days],
		[ATN_LeaveLedger].[FinYear],
		[ATN_LeaveLedger].[ApplHeaderID],
		[ATN_LeaveLedger].[ApplDetailID],
		[ATN_TranType1].[TranType] AS ATN_TranType1_TranType,
		[ATN_TranType1].[Description] AS ATN_TranType1_Description,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[VerificationRequired] AS HRM_Employees2_VerificationRequired,
		[HRM_Employees2].[VerifierID] AS HRM_Employees2_VerifierID,
		[HRM_Employees2].[ApprovalRequired] AS HRM_Employees2_ApprovalRequired,
		[HRM_Employees2].[ApproverID] AS HRM_Employees2_ApproverID,
		[HRM_Employees2].[C_DateOfJoining] AS HRM_Employees2_C_DateOfJoining,
		[HRM_Employees2].[C_DateOfReleaving] AS HRM_Employees2_C_DateOfReleaving,
		[HRM_Employees2].[C_CompanyID] AS HRM_Employees2_C_CompanyID,
		[HRM_Employees2].[C_DivisionID] AS HRM_Employees2_C_DivisionID,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID,
		[HRM_Employees2].[C_DepartmentID] AS HRM_Employees2_C_DepartmentID,
		[HRM_Employees2].[C_DesignationID] AS HRM_Employees2_C_DesignationID,
		[HRM_Employees2].[ActiveState] AS HRM_Employees2_ActiveState,
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
		[ATN_FinYear4].[FinYear] AS ATN_FinYear4_FinYear,
		[ATN_FinYear4].[Description] AS ATN_FinYear4_Description,
		[ATN_FinYear4].[StartDate] AS ATN_FinYear4_StartDate,
		[ATN_FinYear4].[EndDate] AS ATN_FinYear4_EndDate,
		[ATN_FinYear4].[Active] AS ATN_FinYear4_Active 
  FROM [ATN_LeaveLedger] 
    	INNER JOIN #PageIndex
          ON [ATN_LeaveLedger].[RecordID] = #PageIndex.RecordID
  INNER JOIN [ATN_TranType] AS [ATN_TranType1]
    ON [ATN_LeaveLedger].[TranType] = [ATN_TranType1].[TranType]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_LeaveLedger].[CardNo] = [HRM_Employees2].[CardNo]
  INNER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_LeaveLedger].[LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear4]
    ON [ATN_LeaveLedger].[FinYear] = [ATN_FinYear4].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

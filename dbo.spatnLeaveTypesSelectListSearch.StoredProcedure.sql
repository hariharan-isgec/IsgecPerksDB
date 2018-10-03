USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveTypesSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  LeaveTypeID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (LeaveTypeID)
  SELECT [ATN_LeaveTypes].[LeaveTypeID] FROM [ATN_LeaveTypes]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes1]
    ON [ATN_LeaveTypes].[ForwardToLeaveTypeID] = [ATN_LeaveTypes1].[LeaveTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_LeaveTypes].[SpecialSanctionBy] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_LeaveTypes].[PostedLeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
 WHERE  
   ( 
         LOWER(ISNULL([ATN_LeaveTypes].[LeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveTypes].[OpeningBalance], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes].[ForwardToLeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes].[SpecialSanctionBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes].[PostedLeaveTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveTypes].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes1].[LeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes1].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveTypes1].[OpeningBalance], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes1].[ForwardToLeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes1].[SpecialSanctionBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_LeaveTypes1].[PostedLeaveTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_LeaveTypes1].[Sequence], 0)) LIKE @KeyWord1
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
     OR STR(ISNULL([ATN_LeaveTypes3].[Sequence], 0)) LIKE @KeyWord1
   ) 
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
     CASE @orderBy WHEN 'ATN_LeaveTypes1_LeaveTypeID' THEN [ATN_LeaveTypes1].[LeaveTypeID] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_LeaveTypeID DESC' THEN [ATN_LeaveTypes1].[LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_Description' THEN [ATN_LeaveTypes1].[Description] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_Description DESC' THEN [ATN_LeaveTypes1].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_OBALApplicable' THEN [ATN_LeaveTypes1].[OBALApplicable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_OBALApplicable DESC' THEN [ATN_LeaveTypes1].[OBALApplicable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_OBALMonthly' THEN [ATN_LeaveTypes1].[OBALMonthly] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_OBALMonthly DESC' THEN [ATN_LeaveTypes1].[OBALMonthly] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_OpeningBalance' THEN [ATN_LeaveTypes1].[OpeningBalance] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_OpeningBalance DESC' THEN [ATN_LeaveTypes1].[OpeningBalance] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_CarryForward' THEN [ATN_LeaveTypes1].[CarryForward] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_CarryForward DESC' THEN [ATN_LeaveTypes1].[CarryForward] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_ForwardToLeaveTypeID' THEN [ATN_LeaveTypes1].[ForwardToLeaveTypeID] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_ForwardToLeaveTypeID DESC' THEN [ATN_LeaveTypes1].[ForwardToLeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_AdvanceApplicable' THEN [ATN_LeaveTypes1].[AdvanceApplicable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_AdvanceApplicable DESC' THEN [ATN_LeaveTypes1].[AdvanceApplicable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_SpecialSanctionRequired' THEN [ATN_LeaveTypes1].[SpecialSanctionRequired] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_SpecialSanctionRequired DESC' THEN [ATN_LeaveTypes1].[SpecialSanctionRequired] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_SpecialSanctionBy' THEN [ATN_LeaveTypes1].[SpecialSanctionBy] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_SpecialSanctionBy DESC' THEN [ATN_LeaveTypes1].[SpecialSanctionBy] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_Applyiable' THEN [ATN_LeaveTypes1].[Applyiable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_Applyiable DESC' THEN [ATN_LeaveTypes1].[Applyiable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_Postable' THEN [ATN_LeaveTypes1].[Postable] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_Postable DESC' THEN [ATN_LeaveTypes1].[Postable] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_PostedLeaveTypeID' THEN [ATN_LeaveTypes1].[PostedLeaveTypeID] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_PostedLeaveTypeID DESC' THEN [ATN_LeaveTypes1].[PostedLeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_Sequence' THEN [ATN_LeaveTypes1].[Sequence] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_Sequence DESC' THEN [ATN_LeaveTypes1].[Sequence] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_MainType' THEN [ATN_LeaveTypes1].[MainType] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes1_MainType DESC' THEN [ATN_LeaveTypes1].[MainType] END DESC,
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
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Sequence' THEN [ATN_LeaveTypes3].[Sequence] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_Sequence DESC' THEN [ATN_LeaveTypes3].[Sequence] END DESC,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_MainType' THEN [ATN_LeaveTypes3].[MainType] END,
     CASE @orderBy WHEN 'ATN_LeaveTypes3_MainType DESC' THEN [ATN_LeaveTypes3].[MainType] END DESC 

    SET @RecordCount = @@RowCount

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
		[ATN_LeaveTypes1].[LeaveTypeID] AS ATN_LeaveTypes1_LeaveTypeID,
		[ATN_LeaveTypes1].[Description] AS ATN_LeaveTypes1_Description,
		[ATN_LeaveTypes1].[OBALApplicable] AS ATN_LeaveTypes1_OBALApplicable,
		[ATN_LeaveTypes1].[OBALMonthly] AS ATN_LeaveTypes1_OBALMonthly,
		[ATN_LeaveTypes1].[OpeningBalance] AS ATN_LeaveTypes1_OpeningBalance,
		[ATN_LeaveTypes1].[CarryForward] AS ATN_LeaveTypes1_CarryForward,
		[ATN_LeaveTypes1].[ForwardToLeaveTypeID] AS ATN_LeaveTypes1_ForwardToLeaveTypeID,
		[ATN_LeaveTypes1].[AdvanceApplicable] AS ATN_LeaveTypes1_AdvanceApplicable,
		[ATN_LeaveTypes1].[SpecialSanctionRequired] AS ATN_LeaveTypes1_SpecialSanctionRequired,
		[ATN_LeaveTypes1].[SpecialSanctionBy] AS ATN_LeaveTypes1_SpecialSanctionBy,
		[ATN_LeaveTypes1].[Applyiable] AS ATN_LeaveTypes1_Applyiable,
		[ATN_LeaveTypes1].[Postable] AS ATN_LeaveTypes1_Postable,
		[ATN_LeaveTypes1].[PostedLeaveTypeID] AS ATN_LeaveTypes1_PostedLeaveTypeID,
		[ATN_LeaveTypes1].[Sequence] AS ATN_LeaveTypes1_Sequence,
		[ATN_LeaveTypes1].[MainType] AS ATN_LeaveTypes1_MainType,
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
		[ATN_LeaveTypes3].[Sequence] AS ATN_LeaveTypes3_Sequence,
		[ATN_LeaveTypes3].[MainType] AS ATN_LeaveTypes3_MainType 
  FROM [ATN_LeaveTypes] 
    	INNER JOIN #PageIndex
          ON [ATN_LeaveTypes].[LeaveTypeID] = #PageIndex.LeaveTypeID
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes1]
    ON [ATN_LeaveTypes].[ForwardToLeaveTypeID] = [ATN_LeaveTypes1].[LeaveTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_LeaveTypes].[SpecialSanctionBy] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_LeaveTypes].[PostedLeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

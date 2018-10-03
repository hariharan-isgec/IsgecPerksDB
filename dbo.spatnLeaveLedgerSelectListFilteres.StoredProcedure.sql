USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveLedgerSelectListFilteres]
  @Filter_CardNo NVarChar(8),
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
  RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RecordID) ' + 
               'SELECT [ATN_LeaveLedger].[RecordID] FROM [ATN_LeaveLedger] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_TranType] AS [ATN_TranType1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_LeaveLedger].[TranType] = [ATN_TranType1].[TranType]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_LeaveLedger].[CardNo] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_LeaveLedger].[LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_FinYear] AS [ATN_FinYear4]'
  SET @LGSQL = @LGSQL + '    ON [ATN_LeaveLedger].[FinYear] = [ATN_FinYear4].[FinYear]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_LeaveLedger].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_LeaveLedger].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[ATN_LeaveLedger].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[ATN_LeaveLedger].[RecordID] DESC'
                        WHEN 'TranType' THEN '[ATN_LeaveLedger].[TranType]'
                        WHEN 'TranType DESC' THEN '[ATN_LeaveLedger].[TranType] DESC'
                        WHEN 'TranDate' THEN '[ATN_LeaveLedger].[TranDate]'
                        WHEN 'TranDate DESC' THEN '[ATN_LeaveLedger].[TranDate] DESC'
                        WHEN 'CardNo' THEN '[ATN_LeaveLedger].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_LeaveLedger].[CardNo] DESC'
                        WHEN 'LeaveTypeID' THEN '[ATN_LeaveLedger].[LeaveTypeID]'
                        WHEN 'LeaveTypeID DESC' THEN '[ATN_LeaveLedger].[LeaveTypeID] DESC'
                        WHEN 'InProcessDays' THEN '[ATN_LeaveLedger].[InProcessDays]'
                        WHEN 'InProcessDays DESC' THEN '[ATN_LeaveLedger].[InProcessDays] DESC'
                        WHEN 'Days' THEN '[ATN_LeaveLedger].[Days]'
                        WHEN 'Days DESC' THEN '[ATN_LeaveLedger].[Days] DESC'
                        WHEN 'FinYear' THEN '[ATN_LeaveLedger].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_LeaveLedger].[FinYear] DESC'
                        WHEN 'ApplHeaderID' THEN '[ATN_LeaveLedger].[ApplHeaderID]'
                        WHEN 'ApplHeaderID DESC' THEN '[ATN_LeaveLedger].[ApplHeaderID] DESC'
                        WHEN 'ApplDetailID' THEN '[ATN_LeaveLedger].[ApplDetailID]'
                        WHEN 'ApplDetailID DESC' THEN '[ATN_LeaveLedger].[ApplDetailID] DESC'
                        WHEN 'ATN_TranType1_TranType' THEN '[ATN_TranType1].[TranType]'
                        WHEN 'ATN_TranType1_TranType DESC' THEN '[ATN_TranType1].[TranType] DESC'
                        WHEN 'ATN_TranType1_Description' THEN '[ATN_TranType1].[Description]'
                        WHEN 'ATN_TranType1_Description DESC' THEN '[ATN_TranType1].[Description] DESC'
                        WHEN 'HRM_Employees2_CardNo' THEN '[HRM_Employees2].[CardNo]'
                        WHEN 'HRM_Employees2_CardNo DESC' THEN '[HRM_Employees2].[CardNo] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_VerificationRequired' THEN '[HRM_Employees2].[VerificationRequired]'
                        WHEN 'HRM_Employees2_VerificationRequired DESC' THEN '[HRM_Employees2].[VerificationRequired] DESC'
                        WHEN 'HRM_Employees2_VerifierID' THEN '[HRM_Employees2].[VerifierID]'
                        WHEN 'HRM_Employees2_VerifierID DESC' THEN '[HRM_Employees2].[VerifierID] DESC'
                        WHEN 'HRM_Employees2_ApprovalRequired' THEN '[HRM_Employees2].[ApprovalRequired]'
                        WHEN 'HRM_Employees2_ApprovalRequired DESC' THEN '[HRM_Employees2].[ApprovalRequired] DESC'
                        WHEN 'HRM_Employees2_ApproverID' THEN '[HRM_Employees2].[ApproverID]'
                        WHEN 'HRM_Employees2_ApproverID DESC' THEN '[HRM_Employees2].[ApproverID] DESC'
                        WHEN 'HRM_Employees2_C_DateOfJoining' THEN '[HRM_Employees2].[C_DateOfJoining]'
                        WHEN 'HRM_Employees2_C_DateOfJoining DESC' THEN '[HRM_Employees2].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees2_C_DateOfReleaving' THEN '[HRM_Employees2].[C_DateOfReleaving]'
                        WHEN 'HRM_Employees2_C_DateOfReleaving DESC' THEN '[HRM_Employees2].[C_DateOfReleaving] DESC'
                        WHEN 'HRM_Employees2_C_CompanyID' THEN '[HRM_Employees2].[C_CompanyID]'
                        WHEN 'HRM_Employees2_C_CompanyID DESC' THEN '[HRM_Employees2].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees2_C_DivisionID' THEN '[HRM_Employees2].[C_DivisionID]'
                        WHEN 'HRM_Employees2_C_DivisionID DESC' THEN '[HRM_Employees2].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees2_C_OfficeID' THEN '[HRM_Employees2].[C_OfficeID]'
                        WHEN 'HRM_Employees2_C_OfficeID DESC' THEN '[HRM_Employees2].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees2_C_DepartmentID' THEN '[HRM_Employees2].[C_DepartmentID]'
                        WHEN 'HRM_Employees2_C_DepartmentID DESC' THEN '[HRM_Employees2].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees2_C_DesignationID' THEN '[HRM_Employees2].[C_DesignationID]'
                        WHEN 'HRM_Employees2_C_DesignationID DESC' THEN '[HRM_Employees2].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees2_ActiveState' THEN '[HRM_Employees2].[ActiveState]'
                        WHEN 'HRM_Employees2_ActiveState DESC' THEN '[HRM_Employees2].[ActiveState] DESC'
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
                        WHEN 'ATN_FinYear4_FinYear' THEN '[ATN_FinYear4].[FinYear]'
                        WHEN 'ATN_FinYear4_FinYear DESC' THEN '[ATN_FinYear4].[FinYear] DESC'
                        WHEN 'ATN_FinYear4_Description' THEN '[ATN_FinYear4].[Description]'
                        WHEN 'ATN_FinYear4_Description DESC' THEN '[ATN_FinYear4].[Description] DESC'
                        WHEN 'ATN_FinYear4_StartDate' THEN '[ATN_FinYear4].[StartDate]'
                        WHEN 'ATN_FinYear4_StartDate DESC' THEN '[ATN_FinYear4].[StartDate] DESC'
                        WHEN 'ATN_FinYear4_EndDate' THEN '[ATN_FinYear4].[EndDate]'
                        WHEN 'ATN_FinYear4_EndDate DESC' THEN '[ATN_FinYear4].[EndDate] DESC'
                        WHEN 'ATN_FinYear4_Active' THEN '[ATN_FinYear4].[Active]'
                        WHEN 'ATN_FinYear4_Active DESC' THEN '[ATN_FinYear4].[Active] DESC'
                        ELSE '[ATN_LeaveLedger].[RecordID]'
                    END
  EXEC (@LGSQL)

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

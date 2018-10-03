USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  LeaveTypeID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (LeaveTypeID) ' + 
               'SELECT [ATN_LeaveTypes].[LeaveTypeID] FROM [ATN_LeaveTypes] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_LeaveTypes].[ForwardToLeaveTypeID] = [ATN_LeaveTypes1].[LeaveTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_LeaveTypes].[SpecialSanctionBy] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_LeaveTypes].[PostedLeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LeaveTypeID' THEN '[ATN_LeaveTypes].[LeaveTypeID]'
                        WHEN 'LeaveTypeID DESC' THEN '[ATN_LeaveTypes].[LeaveTypeID] DESC'
                        WHEN 'Description' THEN '[ATN_LeaveTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ATN_LeaveTypes].[Description] DESC'
                        WHEN 'OBALApplicable' THEN '[ATN_LeaveTypes].[OBALApplicable]'
                        WHEN 'OBALApplicable DESC' THEN '[ATN_LeaveTypes].[OBALApplicable] DESC'
                        WHEN 'OBALMonthly' THEN '[ATN_LeaveTypes].[OBALMonthly]'
                        WHEN 'OBALMonthly DESC' THEN '[ATN_LeaveTypes].[OBALMonthly] DESC'
                        WHEN 'OpeningBalance' THEN '[ATN_LeaveTypes].[OpeningBalance]'
                        WHEN 'OpeningBalance DESC' THEN '[ATN_LeaveTypes].[OpeningBalance] DESC'
                        WHEN 'CarryForward' THEN '[ATN_LeaveTypes].[CarryForward]'
                        WHEN 'CarryForward DESC' THEN '[ATN_LeaveTypes].[CarryForward] DESC'
                        WHEN 'ForwardToLeaveTypeID' THEN '[ATN_LeaveTypes].[ForwardToLeaveTypeID]'
                        WHEN 'ForwardToLeaveTypeID DESC' THEN '[ATN_LeaveTypes].[ForwardToLeaveTypeID] DESC'
                        WHEN 'AdvanceApplicable' THEN '[ATN_LeaveTypes].[AdvanceApplicable]'
                        WHEN 'AdvanceApplicable DESC' THEN '[ATN_LeaveTypes].[AdvanceApplicable] DESC'
                        WHEN 'SpecialSanctionRequired' THEN '[ATN_LeaveTypes].[SpecialSanctionRequired]'
                        WHEN 'SpecialSanctionRequired DESC' THEN '[ATN_LeaveTypes].[SpecialSanctionRequired] DESC'
                        WHEN 'SpecialSanctionBy' THEN '[ATN_LeaveTypes].[SpecialSanctionBy]'
                        WHEN 'SpecialSanctionBy DESC' THEN '[ATN_LeaveTypes].[SpecialSanctionBy] DESC'
                        WHEN 'Applyiable' THEN '[ATN_LeaveTypes].[Applyiable]'
                        WHEN 'Applyiable DESC' THEN '[ATN_LeaveTypes].[Applyiable] DESC'
                        WHEN 'Postable' THEN '[ATN_LeaveTypes].[Postable]'
                        WHEN 'Postable DESC' THEN '[ATN_LeaveTypes].[Postable] DESC'
                        WHEN 'PostedLeaveTypeID' THEN '[ATN_LeaveTypes].[PostedLeaveTypeID]'
                        WHEN 'PostedLeaveTypeID DESC' THEN '[ATN_LeaveTypes].[PostedLeaveTypeID] DESC'
                        WHEN 'Sequence' THEN '[ATN_LeaveTypes].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[ATN_LeaveTypes].[Sequence] DESC'
                        WHEN 'MainType' THEN '[ATN_LeaveTypes].[MainType]'
                        WHEN 'MainType DESC' THEN '[ATN_LeaveTypes].[MainType] DESC'
                        WHEN 'ATN_LeaveTypes1_LeaveTypeID' THEN '[ATN_LeaveTypes1].[LeaveTypeID]'
                        WHEN 'ATN_LeaveTypes1_LeaveTypeID DESC' THEN '[ATN_LeaveTypes1].[LeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes1_Description' THEN '[ATN_LeaveTypes1].[Description]'
                        WHEN 'ATN_LeaveTypes1_Description DESC' THEN '[ATN_LeaveTypes1].[Description] DESC'
                        WHEN 'ATN_LeaveTypes1_OBALApplicable' THEN '[ATN_LeaveTypes1].[OBALApplicable]'
                        WHEN 'ATN_LeaveTypes1_OBALApplicable DESC' THEN '[ATN_LeaveTypes1].[OBALApplicable] DESC'
                        WHEN 'ATN_LeaveTypes1_OBALMonthly' THEN '[ATN_LeaveTypes1].[OBALMonthly]'
                        WHEN 'ATN_LeaveTypes1_OBALMonthly DESC' THEN '[ATN_LeaveTypes1].[OBALMonthly] DESC'
                        WHEN 'ATN_LeaveTypes1_OpeningBalance' THEN '[ATN_LeaveTypes1].[OpeningBalance]'
                        WHEN 'ATN_LeaveTypes1_OpeningBalance DESC' THEN '[ATN_LeaveTypes1].[OpeningBalance] DESC'
                        WHEN 'ATN_LeaveTypes1_CarryForward' THEN '[ATN_LeaveTypes1].[CarryForward]'
                        WHEN 'ATN_LeaveTypes1_CarryForward DESC' THEN '[ATN_LeaveTypes1].[CarryForward] DESC'
                        WHEN 'ATN_LeaveTypes1_ForwardToLeaveTypeID' THEN '[ATN_LeaveTypes1].[ForwardToLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes1_ForwardToLeaveTypeID DESC' THEN '[ATN_LeaveTypes1].[ForwardToLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes1_AdvanceApplicable' THEN '[ATN_LeaveTypes1].[AdvanceApplicable]'
                        WHEN 'ATN_LeaveTypes1_AdvanceApplicable DESC' THEN '[ATN_LeaveTypes1].[AdvanceApplicable] DESC'
                        WHEN 'ATN_LeaveTypes1_SpecialSanctionRequired' THEN '[ATN_LeaveTypes1].[SpecialSanctionRequired]'
                        WHEN 'ATN_LeaveTypes1_SpecialSanctionRequired DESC' THEN '[ATN_LeaveTypes1].[SpecialSanctionRequired] DESC'
                        WHEN 'ATN_LeaveTypes1_SpecialSanctionBy' THEN '[ATN_LeaveTypes1].[SpecialSanctionBy]'
                        WHEN 'ATN_LeaveTypes1_SpecialSanctionBy DESC' THEN '[ATN_LeaveTypes1].[SpecialSanctionBy] DESC'
                        WHEN 'ATN_LeaveTypes1_Applyiable' THEN '[ATN_LeaveTypes1].[Applyiable]'
                        WHEN 'ATN_LeaveTypes1_Applyiable DESC' THEN '[ATN_LeaveTypes1].[Applyiable] DESC'
                        WHEN 'ATN_LeaveTypes1_Postable' THEN '[ATN_LeaveTypes1].[Postable]'
                        WHEN 'ATN_LeaveTypes1_Postable DESC' THEN '[ATN_LeaveTypes1].[Postable] DESC'
                        WHEN 'ATN_LeaveTypes1_PostedLeaveTypeID' THEN '[ATN_LeaveTypes1].[PostedLeaveTypeID]'
                        WHEN 'ATN_LeaveTypes1_PostedLeaveTypeID DESC' THEN '[ATN_LeaveTypes1].[PostedLeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes1_Sequence' THEN '[ATN_LeaveTypes1].[Sequence]'
                        WHEN 'ATN_LeaveTypes1_Sequence DESC' THEN '[ATN_LeaveTypes1].[Sequence] DESC'
                        WHEN 'ATN_LeaveTypes1_MainType' THEN '[ATN_LeaveTypes1].[MainType]'
                        WHEN 'ATN_LeaveTypes1_MainType DESC' THEN '[ATN_LeaveTypes1].[MainType] DESC'
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
                        WHEN 'ATN_LeaveTypes3_Sequence' THEN '[ATN_LeaveTypes3].[Sequence]'
                        WHEN 'ATN_LeaveTypes3_Sequence DESC' THEN '[ATN_LeaveTypes3].[Sequence] DESC'
                        WHEN 'ATN_LeaveTypes3_MainType' THEN '[ATN_LeaveTypes3].[MainType]'
                        WHEN 'ATN_LeaveTypes3_MainType DESC' THEN '[ATN_LeaveTypes3].[MainType] DESC'
                        ELSE '[ATN_LeaveTypes].[LeaveTypeID]'
                    END
  EXEC (@LGSQL)

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

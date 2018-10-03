USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPostApplicationSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @ApplStatusID Int,
  @FinYear NVarChar(4),
  @AdvanceApplication Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  LeaveApplID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (LeaveApplID) ' + 
               'SELECT [ATN_ApplHeader].[LeaveApplID] FROM [ATN_ApplHeader] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[ApplStatusID] = ' + STR(@ApplStatusID)
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[AdvanceApplication] = ''' + CONVERT(NVarChar(10), @AdvanceApplication) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LeaveApplID' THEN '[ATN_ApplHeader].[LeaveApplID]'
                        WHEN 'LeaveApplID DESC' THEN '[ATN_ApplHeader].[LeaveApplID] DESC'
                        WHEN 'CardNo' THEN '[ATN_ApplHeader].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_ApplHeader].[CardNo] DESC'
                        WHEN 'Remarks' THEN '[ATN_ApplHeader].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ATN_ApplHeader].[Remarks] DESC'
                        WHEN 'AppliedOn' THEN '[ATN_ApplHeader].[AppliedOn]'
                        WHEN 'AppliedOn DESC' THEN '[ATN_ApplHeader].[AppliedOn] DESC'
                        WHEN 'ApplStatusID' THEN '[ATN_ApplHeader].[ApplStatusID]'
                        WHEN 'ApplStatusID DESC' THEN '[ATN_ApplHeader].[ApplStatusID] DESC'
                        WHEN 'PostedOn' THEN '[ATN_ApplHeader].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[ATN_ApplHeader].[PostedOn] DESC'
                        WHEN 'PostedBy' THEN '[ATN_ApplHeader].[PostedBy]'
                        WHEN 'PostedBy DESC' THEN '[ATN_ApplHeader].[PostedBy] DESC'
                        WHEN 'PostingRemark' THEN '[ATN_ApplHeader].[PostingRemark]'
                        WHEN 'PostingRemark DESC' THEN '[ATN_ApplHeader].[PostingRemark] DESC'
                        WHEN 'FinYear' THEN '[ATN_ApplHeader].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_ApplHeader].[FinYear] DESC'
                        WHEN 'AdvanceApplication' THEN '[ATN_ApplHeader].[AdvanceApplication]'
                        WHEN 'AdvanceApplication DESC' THEN '[ATN_ApplHeader].[AdvanceApplication] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees1_VerificationRequired' THEN '[HRM_Employees1].[VerificationRequired]'
                        WHEN 'HRM_Employees1_VerificationRequired DESC' THEN '[HRM_Employees1].[VerificationRequired] DESC'
                        WHEN 'HRM_Employees1_VerifierID' THEN '[HRM_Employees1].[VerifierID]'
                        WHEN 'HRM_Employees1_VerifierID DESC' THEN '[HRM_Employees1].[VerifierID] DESC'
                        WHEN 'HRM_Employees1_ApprovalRequired' THEN '[HRM_Employees1].[ApprovalRequired]'
                        WHEN 'HRM_Employees1_ApprovalRequired DESC' THEN '[HRM_Employees1].[ApprovalRequired] DESC'
                        WHEN 'HRM_Employees1_ApproverID' THEN '[HRM_Employees1].[ApproverID]'
                        WHEN 'HRM_Employees1_ApproverID DESC' THEN '[HRM_Employees1].[ApproverID] DESC'
                        WHEN 'HRM_Employees1_C_DateOfJoining' THEN '[HRM_Employees1].[C_DateOfJoining]'
                        WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN '[HRM_Employees1].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees1_C_DateOfReleaving' THEN '[HRM_Employees1].[C_DateOfReleaving]'
                        WHEN 'HRM_Employees1_C_DateOfReleaving DESC' THEN '[HRM_Employees1].[C_DateOfReleaving] DESC'
                        WHEN 'HRM_Employees1_C_CompanyID' THEN '[HRM_Employees1].[C_CompanyID]'
                        WHEN 'HRM_Employees1_C_CompanyID DESC' THEN '[HRM_Employees1].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees1_C_DivisionID' THEN '[HRM_Employees1].[C_DivisionID]'
                        WHEN 'HRM_Employees1_C_DivisionID DESC' THEN '[HRM_Employees1].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees1_C_OfficeID' THEN '[HRM_Employees1].[C_OfficeID]'
                        WHEN 'HRM_Employees1_C_OfficeID DESC' THEN '[HRM_Employees1].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees1_C_DepartmentID' THEN '[HRM_Employees1].[C_DepartmentID]'
                        WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN '[HRM_Employees1].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees1_C_DesignationID' THEN '[HRM_Employees1].[C_DesignationID]'
                        WHEN 'HRM_Employees1_C_DesignationID DESC' THEN '[HRM_Employees1].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees1_ActiveState' THEN '[HRM_Employees1].[ActiveState]'
                        WHEN 'HRM_Employees1_ActiveState DESC' THEN '[HRM_Employees1].[ActiveState] DESC'
                        WHEN 'ATN_ApplicationStatus2_ApplStatusID' THEN '[ATN_ApplicationStatus2].[ApplStatusID]'
                        WHEN 'ATN_ApplicationStatus2_ApplStatusID DESC' THEN '[ATN_ApplicationStatus2].[ApplStatusID] DESC'
                        WHEN 'ATN_ApplicationStatus2_Description' THEN '[ATN_ApplicationStatus2].[Description]'
                        WHEN 'ATN_ApplicationStatus2_Description DESC' THEN '[ATN_ApplicationStatus2].[Description] DESC'
                        ELSE '[ATN_ApplHeader].[LeaveApplID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[PostedOn],
		[ATN_ApplHeader].[PostedBy],
		[ATN_ApplHeader].[PostingRemark],
		[ATN_ApplHeader].[FinYear],
		[ATN_ApplHeader].[AdvanceApplication],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[VerificationRequired] AS HRM_Employees1_VerificationRequired,
		[HRM_Employees1].[VerifierID] AS HRM_Employees1_VerifierID,
		[HRM_Employees1].[ApprovalRequired] AS HRM_Employees1_ApprovalRequired,
		[HRM_Employees1].[ApproverID] AS HRM_Employees1_ApproverID,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_DateOfReleaving] AS HRM_Employees1_C_DateOfReleaving,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState,
		[HRM_Employees2].[CardNo] AS ApprovedBy,
		[HRM_Employees2].[EmployeeName] AS ApprovedByEmployeeName,
		[ATN_ApplicationStatus2].[ApplStatusID] AS ATN_ApplicationStatus2_ApplStatusID,
		[ATN_ApplicationStatus2].[Description] AS ATN_ApplicationStatus2_Description 
  FROM [ATN_ApplHeader] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplHeader].[LeaveApplID] = #PageIndex.LeaveApplID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Employees1].[ApproverID] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

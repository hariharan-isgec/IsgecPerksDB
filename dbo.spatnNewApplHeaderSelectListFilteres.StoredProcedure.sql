USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnNewApplHeaderSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,LeaveApplID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LeaveApplID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATN_ApplHeader].[LeaveApplID]'
  SET @LGSQL = @LGSQL + ' FROM [ATN_ApplHeader] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_ExecutionStates] AS [ATN_ExecutionStates2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[ExecutionState] = [ATN_ExecutionStates2].[ExecutionState]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees4].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[SanctionedBy] = [HRM_Employees6].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[PostedBy] = [HRM_Employees7].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[FinYear] = (''' + @FinYear + ''')'
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LeaveApplID' THEN '[ATN_ApplHeader].[LeaveApplID]'
                        WHEN 'LeaveApplID DESC' THEN '[ATN_ApplHeader].[LeaveApplID] DESC'
                        WHEN 'CardNo' THEN '[ATN_ApplHeader].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_ApplHeader].[CardNo] DESC'
                        WHEN 'Approved' THEN '[ATN_ApplHeader].[Approved]'
                        WHEN 'Approved DESC' THEN '[ATN_ApplHeader].[Approved] DESC'
                        WHEN 'Rejected' THEN '[ATN_ApplHeader].[Rejected]'
                        WHEN 'Rejected DESC' THEN '[ATN_ApplHeader].[Rejected] DESC'
                        WHEN 'Application' THEN '[ATN_ApplHeader].[Application]'
                        WHEN 'Application DESC' THEN '[ATN_ApplHeader].[Application] DESC'
                        WHEN 'Remarks' THEN '[ATN_ApplHeader].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ATN_ApplHeader].[Remarks] DESC'
                        WHEN 'FinYear' THEN '[ATN_ApplHeader].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_ApplHeader].[FinYear] DESC'
                        WHEN 'ApplStatusID' THEN '[ATN_ApplHeader].[ApplStatusID]'
                        WHEN 'ApplStatusID DESC' THEN '[ATN_ApplHeader].[ApplStatusID] DESC'
                        WHEN 'AppliedOn' THEN '[ATN_ApplHeader].[AppliedOn]'
                        WHEN 'AppliedOn DESC' THEN '[ATN_ApplHeader].[AppliedOn] DESC'
                        WHEN 'VerificationOn' THEN '[ATN_ApplHeader].[VerificationOn]'
                        WHEN 'VerificationOn DESC' THEN '[ATN_ApplHeader].[VerificationOn] DESC'
                        WHEN 'ApprovalOn' THEN '[ATN_ApplHeader].[ApprovalOn]'
                        WHEN 'ApprovalOn DESC' THEN '[ATN_ApplHeader].[ApprovalOn] DESC'
                        WHEN 'SanctionOn' THEN '[ATN_ApplHeader].[SanctionOn]'
                        WHEN 'SanctionOn DESC' THEN '[ATN_ApplHeader].[SanctionOn] DESC'
                        WHEN 'PostedOn' THEN '[ATN_ApplHeader].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[ATN_ApplHeader].[PostedOn] DESC'
                        WHEN 'VerificationRequired' THEN '[ATN_ApplHeader].[VerificationRequired]'
                        WHEN 'VerificationRequired DESC' THEN '[ATN_ApplHeader].[VerificationRequired] DESC'
                        WHEN 'ApprovalRequired' THEN '[ATN_ApplHeader].[ApprovalRequired]'
                        WHEN 'ApprovalRequired DESC' THEN '[ATN_ApplHeader].[ApprovalRequired] DESC'
                        WHEN 'SanctionRequired' THEN '[ATN_ApplHeader].[SanctionRequired]'
                        WHEN 'SanctionRequired DESC' THEN '[ATN_ApplHeader].[SanctionRequired] DESC'
                        WHEN 'VerifiedBy' THEN '[ATN_ApplHeader].[VerifiedBy]'
                        WHEN 'VerifiedBy DESC' THEN '[ATN_ApplHeader].[VerifiedBy] DESC'
                        WHEN 'ApprovedBy' THEN '[ATN_ApplHeader].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[ATN_ApplHeader].[ApprovedBy] DESC'
                        WHEN 'SanctionedBy' THEN '[ATN_ApplHeader].[SanctionedBy]'
                        WHEN 'SanctionedBy DESC' THEN '[ATN_ApplHeader].[SanctionedBy] DESC'
                        WHEN 'PostedBy' THEN '[ATN_ApplHeader].[PostedBy]'
                        WHEN 'PostedBy DESC' THEN '[ATN_ApplHeader].[PostedBy] DESC'
                        WHEN 'VerificationRemark' THEN '[ATN_ApplHeader].[VerificationRemark]'
                        WHEN 'VerificationRemark DESC' THEN '[ATN_ApplHeader].[VerificationRemark] DESC'
                        WHEN 'ApprovalRemark' THEN '[ATN_ApplHeader].[ApprovalRemark]'
                        WHEN 'ApprovalRemark DESC' THEN '[ATN_ApplHeader].[ApprovalRemark] DESC'
                        WHEN 'SanctionRemark' THEN '[ATN_ApplHeader].[SanctionRemark]'
                        WHEN 'SanctionRemark DESC' THEN '[ATN_ApplHeader].[SanctionRemark] DESC'
                        WHEN 'PostingRemark' THEN '[ATN_ApplHeader].[PostingRemark]'
                        WHEN 'PostingRemark DESC' THEN '[ATN_ApplHeader].[PostingRemark] DESC'
                        WHEN 'AdvanceApplication' THEN '[ATN_ApplHeader].[AdvanceApplication]'
                        WHEN 'AdvanceApplication DESC' THEN '[ATN_ApplHeader].[AdvanceApplication] DESC'
                        WHEN 'ExecutionState' THEN '[ATN_ApplHeader].[ExecutionState]'
                        WHEN 'ExecutionState DESC' THEN '[ATN_ApplHeader].[ExecutionState] DESC'
                        WHEN 'ATN_ApplicationStatus1_Description' THEN '[ATN_ApplicationStatus1].[Description]'
                        WHEN 'ATN_ApplicationStatus1_Description DESC' THEN '[ATN_ApplicationStatus1].[Description] DESC'
                        WHEN 'ATN_ExecutionStates2_Description' THEN '[ATN_ExecutionStates2].[Description]'
                        WHEN 'ATN_ExecutionStates2_Description DESC' THEN '[ATN_ExecutionStates2].[Description] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        WHEN 'HRM_Employees4_EmployeeName' THEN '[HRM_Employees4].[EmployeeName]'
                        WHEN 'HRM_Employees4_EmployeeName DESC' THEN '[HRM_Employees4].[EmployeeName] DESC'
                        WHEN 'HRM_Employees5_EmployeeName' THEN '[HRM_Employees5].[EmployeeName]'
                        WHEN 'HRM_Employees5_EmployeeName DESC' THEN '[HRM_Employees5].[EmployeeName] DESC'
                        WHEN 'HRM_Employees6_EmployeeName' THEN '[HRM_Employees6].[EmployeeName]'
                        WHEN 'HRM_Employees6_EmployeeName DESC' THEN '[HRM_Employees6].[EmployeeName] DESC'
                        WHEN 'HRM_Employees7_EmployeeName' THEN '[HRM_Employees7].[EmployeeName]'
                        WHEN 'HRM_Employees7_EmployeeName DESC' THEN '[HRM_Employees7].[EmployeeName] DESC'
                        ELSE '[ATN_ApplHeader].[LeaveApplID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ATN_ApplHeader].* ,
    [ATN_ApplicationStatus1].[Description] AS ATN_ApplicationStatus1_Description,
    [ATN_ExecutionStates2].[Description] AS ATN_ExecutionStates2_Description,
    [HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
    [HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
    [HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
    [HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
    [HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName 
  FROM [ATN_ApplHeader] 
      INNER JOIN #PageIndex
          ON [ATN_ApplHeader].[LeaveApplID] = #PageIndex.LeaveApplID
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]
  LEFT OUTER JOIN [ATN_ExecutionStates] AS [ATN_ExecutionStates2]
    ON [ATN_ApplHeader].[ExecutionState] = [ATN_ExecutionStates2].[ExecutionState]
  INNER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees4].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [ATN_ApplHeader].[SanctionedBy] = [HRM_Employees6].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [ATN_ApplHeader].[PostedBy] = [HRM_Employees7].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

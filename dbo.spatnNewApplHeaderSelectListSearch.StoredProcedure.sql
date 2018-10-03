USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnNewApplHeaderSelectListSearch]
  @LoginID NVarChar(8),
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
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,LeaveApplID Int NOT NULL
  )
  INSERT INTO #PageIndex (LeaveApplID)
  SELECT [ATN_ApplHeader].[LeaveApplID] FROM [ATN_ApplHeader]
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
      [ATN_ApplHeader].[FinYear] = (@FinYear)
   AND ( 
         STR(ISNULL([ATN_ApplHeader].[LeaveApplID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[Approved],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[Rejected],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[Application],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[FinYear],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_ApplHeader].[ApplStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[VerifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[SanctionedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[PostedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[VerificationRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[ApprovalRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[SanctionRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[PostingRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_ApplHeader].[ExecutionState], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'LeaveApplID' THEN [ATN_ApplHeader].[LeaveApplID] END,
     CASE @OrderBy WHEN 'LeaveApplID DESC' THEN [ATN_ApplHeader].[LeaveApplID] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [ATN_ApplHeader].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [ATN_ApplHeader].[CardNo] END DESC,
     CASE @OrderBy WHEN 'Approved' THEN [ATN_ApplHeader].[Approved] END,
     CASE @OrderBy WHEN 'Approved DESC' THEN [ATN_ApplHeader].[Approved] END DESC,
     CASE @OrderBy WHEN 'Rejected' THEN [ATN_ApplHeader].[Rejected] END,
     CASE @OrderBy WHEN 'Rejected DESC' THEN [ATN_ApplHeader].[Rejected] END DESC,
     CASE @OrderBy WHEN 'Application' THEN [ATN_ApplHeader].[Application] END,
     CASE @OrderBy WHEN 'Application DESC' THEN [ATN_ApplHeader].[Application] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [ATN_ApplHeader].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [ATN_ApplHeader].[Remarks] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [ATN_ApplHeader].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [ATN_ApplHeader].[FinYear] END DESC,
     CASE @OrderBy WHEN 'ApplStatusID' THEN [ATN_ApplHeader].[ApplStatusID] END,
     CASE @OrderBy WHEN 'ApplStatusID DESC' THEN [ATN_ApplHeader].[ApplStatusID] END DESC,
     CASE @OrderBy WHEN 'AppliedOn' THEN [ATN_ApplHeader].[AppliedOn] END,
     CASE @OrderBy WHEN 'AppliedOn DESC' THEN [ATN_ApplHeader].[AppliedOn] END DESC,
     CASE @OrderBy WHEN 'VerificationOn' THEN [ATN_ApplHeader].[VerificationOn] END,
     CASE @OrderBy WHEN 'VerificationOn DESC' THEN [ATN_ApplHeader].[VerificationOn] END DESC,
     CASE @OrderBy WHEN 'ApprovalOn' THEN [ATN_ApplHeader].[ApprovalOn] END,
     CASE @OrderBy WHEN 'ApprovalOn DESC' THEN [ATN_ApplHeader].[ApprovalOn] END DESC,
     CASE @OrderBy WHEN 'SanctionOn' THEN [ATN_ApplHeader].[SanctionOn] END,
     CASE @OrderBy WHEN 'SanctionOn DESC' THEN [ATN_ApplHeader].[SanctionOn] END DESC,
     CASE @OrderBy WHEN 'PostedOn' THEN [ATN_ApplHeader].[PostedOn] END,
     CASE @OrderBy WHEN 'PostedOn DESC' THEN [ATN_ApplHeader].[PostedOn] END DESC,
     CASE @OrderBy WHEN 'VerificationRequired' THEN [ATN_ApplHeader].[VerificationRequired] END,
     CASE @OrderBy WHEN 'VerificationRequired DESC' THEN [ATN_ApplHeader].[VerificationRequired] END DESC,
     CASE @OrderBy WHEN 'ApprovalRequired' THEN [ATN_ApplHeader].[ApprovalRequired] END,
     CASE @OrderBy WHEN 'ApprovalRequired DESC' THEN [ATN_ApplHeader].[ApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'SanctionRequired' THEN [ATN_ApplHeader].[SanctionRequired] END,
     CASE @OrderBy WHEN 'SanctionRequired DESC' THEN [ATN_ApplHeader].[SanctionRequired] END DESC,
     CASE @OrderBy WHEN 'VerifiedBy' THEN [ATN_ApplHeader].[VerifiedBy] END,
     CASE @OrderBy WHEN 'VerifiedBy DESC' THEN [ATN_ApplHeader].[VerifiedBy] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [ATN_ApplHeader].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [ATN_ApplHeader].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'SanctionedBy' THEN [ATN_ApplHeader].[SanctionedBy] END,
     CASE @OrderBy WHEN 'SanctionedBy DESC' THEN [ATN_ApplHeader].[SanctionedBy] END DESC,
     CASE @OrderBy WHEN 'PostedBy' THEN [ATN_ApplHeader].[PostedBy] END,
     CASE @OrderBy WHEN 'PostedBy DESC' THEN [ATN_ApplHeader].[PostedBy] END DESC,
     CASE @OrderBy WHEN 'VerificationRemark' THEN [ATN_ApplHeader].[VerificationRemark] END,
     CASE @OrderBy WHEN 'VerificationRemark DESC' THEN [ATN_ApplHeader].[VerificationRemark] END DESC,
     CASE @OrderBy WHEN 'ApprovalRemark' THEN [ATN_ApplHeader].[ApprovalRemark] END,
     CASE @OrderBy WHEN 'ApprovalRemark DESC' THEN [ATN_ApplHeader].[ApprovalRemark] END DESC,
     CASE @OrderBy WHEN 'SanctionRemark' THEN [ATN_ApplHeader].[SanctionRemark] END,
     CASE @OrderBy WHEN 'SanctionRemark DESC' THEN [ATN_ApplHeader].[SanctionRemark] END DESC,
     CASE @OrderBy WHEN 'PostingRemark' THEN [ATN_ApplHeader].[PostingRemark] END,
     CASE @OrderBy WHEN 'PostingRemark DESC' THEN [ATN_ApplHeader].[PostingRemark] END DESC,
     CASE @OrderBy WHEN 'AdvanceApplication' THEN [ATN_ApplHeader].[AdvanceApplication] END,
     CASE @OrderBy WHEN 'AdvanceApplication DESC' THEN [ATN_ApplHeader].[AdvanceApplication] END DESC,
     CASE @OrderBy WHEN 'ExecutionState' THEN [ATN_ApplHeader].[ExecutionState] END,
     CASE @OrderBy WHEN 'ExecutionState DESC' THEN [ATN_ApplHeader].[ExecutionState] END DESC,
     CASE @OrderBy WHEN 'ATN_ApplicationStatus1_Description' THEN [ATN_ApplicationStatus1].[Description] END,
     CASE @OrderBy WHEN 'ATN_ApplicationStatus1_Description DESC' THEN [ATN_ApplicationStatus1].[Description] END DESC,
     CASE @OrderBy WHEN 'ATN_ExecutionStates2_Description' THEN [ATN_ExecutionStates2].[Description] END,
     CASE @OrderBy WHEN 'ATN_ExecutionStates2_Description DESC' THEN [ATN_ExecutionStates2].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees4_EmployeeName' THEN [HRM_Employees4].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees4_EmployeeName DESC' THEN [HRM_Employees4].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName' THEN [HRM_Employees5].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName DESC' THEN [HRM_Employees5].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees6_EmployeeName' THEN [HRM_Employees6].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees6_EmployeeName DESC' THEN [HRM_Employees6].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees7_EmployeeName' THEN [HRM_Employees7].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees7_EmployeeName DESC' THEN [HRM_Employees7].[EmployeeName] END DESC 

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

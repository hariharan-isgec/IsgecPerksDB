USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApproveApplicationSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @ApplStatusID Int,
  @ApprovedBy NVarChar(8),
  @FinYear NVarChar(4),
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus3].[ApplStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees4].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[ApplStatusID] = ' + STR(@ApplStatusID)
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[ApprovedBy] = ''' + @ApprovedBy + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LeaveApplID' THEN '[ATN_ApplHeader].[LeaveApplID]'
                        WHEN 'LeaveApplID DESC' THEN '[ATN_ApplHeader].[LeaveApplID] DESC'
                        WHEN 'CardNo' THEN '[ATN_ApplHeader].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_ApplHeader].[CardNo] DESC'
                        WHEN 'Remarks' THEN '[ATN_ApplHeader].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ATN_ApplHeader].[Remarks] DESC'
                        WHEN 'VerifiedBy' THEN '[ATN_ApplHeader].[VerifiedBy]'
                        WHEN 'VerifiedBy DESC' THEN '[ATN_ApplHeader].[VerifiedBy] DESC'
                        WHEN 'ApplStatusID' THEN '[ATN_ApplHeader].[ApplStatusID]'
                        WHEN 'ApplStatusID DESC' THEN '[ATN_ApplHeader].[ApplStatusID] DESC'
                        WHEN 'ApprovalRemark' THEN '[ATN_ApplHeader].[ApprovalRemark]'
                        WHEN 'ApprovalRemark DESC' THEN '[ATN_ApplHeader].[ApprovalRemark] DESC'
                        WHEN 'ApprovalOn' THEN '[ATN_ApplHeader].[ApprovalOn]'
                        WHEN 'ApprovalOn DESC' THEN '[ATN_ApplHeader].[ApprovalOn] DESC'
                        WHEN 'SanctionRequired' THEN '[ATN_ApplHeader].[SanctionRequired]'
                        WHEN 'SanctionRequired DESC' THEN '[ATN_ApplHeader].[SanctionRequired] DESC'
                        WHEN 'ApprovedBy' THEN '[ATN_ApplHeader].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[ATN_ApplHeader].[ApprovedBy] DESC'
                        WHEN 'AppliedOn' THEN '[ATN_ApplHeader].[AppliedOn]'
                        WHEN 'AppliedOn DESC' THEN '[ATN_ApplHeader].[AppliedOn] DESC'
                        WHEN 'FinYear' THEN '[ATN_ApplHeader].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_ApplHeader].[FinYear] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_CardNo' THEN '[HRM_Employees2].[CardNo]'
                        WHEN 'HRM_Employees2_CardNo DESC' THEN '[HRM_Employees2].[CardNo] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'ATN_ApplicationStatus3_ApplStatusID' THEN '[ATN_ApplicationStatus3].[ApplStatusID]'
                        WHEN 'ATN_ApplicationStatus3_ApplStatusID DESC' THEN '[ATN_ApplicationStatus3].[ApplStatusID] DESC'
                        WHEN 'ATN_ApplicationStatus3_Description' THEN '[ATN_ApplicationStatus3].[Description]'
                        WHEN 'ATN_ApplicationStatus3_Description DESC' THEN '[ATN_ApplicationStatus3].[Description] DESC'
                        WHEN 'HRM_Employees4_CardNo' THEN '[HRM_Employees4].[CardNo]'
                        WHEN 'HRM_Employees4_CardNo DESC' THEN '[HRM_Employees4].[CardNo] DESC'
                        WHEN 'HRM_Employees4_EmployeeName' THEN '[HRM_Employees4].[EmployeeName]'
                        WHEN 'HRM_Employees4_EmployeeName DESC' THEN '[HRM_Employees4].[EmployeeName] DESC'
                        ELSE '[ATN_ApplHeader].[LeaveApplID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[VerifiedBy],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[ApprovalRemark],
		[ATN_ApplHeader].[ApprovalOn],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[ApprovedBy],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[FinYear],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[ATN_ApplicationStatus3].[ApplStatusID] AS ATN_ApplicationStatus3_ApplStatusID,
		[ATN_ApplicationStatus3].[Description] AS ATN_ApplicationStatus3_Description,
		[HRM_Employees4].[CardNo] AS HRM_Employees4_CardNo,
		[HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName 
  FROM [ATN_ApplHeader] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplHeader].[LeaveApplID] = #PageIndex.LeaveApplID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees2].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus3]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus3].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees4].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnVerifedApplicationSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @ApplStatusID Int,
  @VerifiedBy NVarChar(8),
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
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[ApplStatusID] >= ' + STR(@ApplStatusID)
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[VerifiedBy] = ''' + @VerifiedBy + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[FinYear] = ''' + @FinYear + ''''
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
                        WHEN 'VerificationRemark' THEN '[ATN_ApplHeader].[VerificationRemark]'
                        WHEN 'VerificationRemark DESC' THEN '[ATN_ApplHeader].[VerificationRemark] DESC'
                        WHEN 'VerificationOn' THEN '[ATN_ApplHeader].[VerificationOn]'
                        WHEN 'VerificationOn DESC' THEN '[ATN_ApplHeader].[VerificationOn] DESC'
                        WHEN 'VerifiedBy' THEN '[ATN_ApplHeader].[VerifiedBy]'
                        WHEN 'VerifiedBy DESC' THEN '[ATN_ApplHeader].[VerifiedBy] DESC'
                        WHEN 'ApprovalRequired' THEN '[ATN_ApplHeader].[ApprovalRequired]'
                        WHEN 'ApprovalRequired DESC' THEN '[ATN_ApplHeader].[ApprovalRequired] DESC'
                        WHEN 'SanctionRequired' THEN '[ATN_ApplHeader].[SanctionRequired]'
                        WHEN 'SanctionRequired DESC' THEN '[ATN_ApplHeader].[SanctionRequired] DESC'
                        WHEN 'FinYear' THEN '[ATN_ApplHeader].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_ApplHeader].[FinYear] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'ATN_ApplicationStatus2_ApplStatusID' THEN '[ATN_ApplicationStatus2].[ApplStatusID]'
                        WHEN 'ATN_ApplicationStatus2_ApplStatusID DESC' THEN '[ATN_ApplicationStatus2].[ApplStatusID] DESC'
                        WHEN 'ATN_ApplicationStatus2_Description' THEN '[ATN_ApplicationStatus2].[Description]'
                        WHEN 'ATN_ApplicationStatus2_Description DESC' THEN '[ATN_ApplicationStatus2].[Description] DESC'
                        WHEN 'HRM_Employees3_CardNo' THEN '[HRM_Employees3].[CardNo]'
                        WHEN 'HRM_Employees3_CardNo DESC' THEN '[HRM_Employees3].[CardNo] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
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
		[ATN_ApplHeader].[VerificationRemark],
		[ATN_ApplHeader].[VerificationOn],
		[ATN_ApplHeader].[VerifiedBy],
		[ATN_ApplHeader].[ApprovalRequired],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[FinYear],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[ATN_ApplicationStatus2].[ApplStatusID] AS ATN_ApplicationStatus2_ApplStatusID,
		[ATN_ApplicationStatus2].[Description] AS ATN_ApplicationStatus2_Description,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName 
  FROM [ATN_ApplHeader] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplHeader].[LeaveApplID] = #PageIndex.LeaveApplID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees3].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

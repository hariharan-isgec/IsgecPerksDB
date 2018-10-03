USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessedPunchSelectListFilteres]
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
  AttenID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (AttenID) ' + 
               'SELECT [ATN_Attendance].[AttenID] FROM [ATN_Attendance] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_Attendance].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_Attendance].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AttenID' THEN '[ATN_Attendance].[AttenID]'
                        WHEN 'AttenID DESC' THEN '[ATN_Attendance].[AttenID] DESC'
                        WHEN 'AttenDate' THEN '[ATN_Attendance].[AttenDate]'
                        WHEN 'AttenDate DESC' THEN '[ATN_Attendance].[AttenDate] DESC'
                        WHEN 'CardNo' THEN '[ATN_Attendance].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_Attendance].[CardNo] DESC'
                        WHEN 'Punch1Time' THEN '[ATN_Attendance].[Punch1Time]'
                        WHEN 'Punch1Time DESC' THEN '[ATN_Attendance].[Punch1Time] DESC'
                        WHEN 'Punch2Time' THEN '[ATN_Attendance].[Punch2Time]'
                        WHEN 'Punch2Time DESC' THEN '[ATN_Attendance].[Punch2Time] DESC'
                        WHEN 'PunchStatusID' THEN '[ATN_Attendance].[PunchStatusID]'
                        WHEN 'PunchStatusID DESC' THEN '[ATN_Attendance].[PunchStatusID] DESC'
                        WHEN 'Punch9Time' THEN '[ATN_Attendance].[Punch9Time]'
                        WHEN 'Punch9Time DESC' THEN '[ATN_Attendance].[Punch9Time] DESC'
                        WHEN 'PunchValue' THEN '[ATN_Attendance].[PunchValue]'
                        WHEN 'PunchValue DESC' THEN '[ATN_Attendance].[PunchValue] DESC'
                        WHEN 'FinalValue' THEN '[ATN_Attendance].[FinalValue]'
                        WHEN 'FinalValue DESC' THEN '[ATN_Attendance].[FinalValue] DESC'
                        WHEN 'Applied' THEN '[ATN_Attendance].[Applied]'
                        WHEN 'Applied DESC' THEN '[ATN_Attendance].[Applied] DESC'
                        WHEN 'NeedsRegularization' THEN '[ATN_Attendance].[NeedsRegularization]'
                        WHEN 'NeedsRegularization DESC' THEN '[ATN_Attendance].[NeedsRegularization] DESC'
                        WHEN 'FinYear' THEN '[ATN_Attendance].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_Attendance].[FinYear] DESC'
                        WHEN 'AdvanceApplication' THEN '[ATN_Attendance].[AdvanceApplication]'
                        WHEN 'AdvanceApplication DESC' THEN '[ATN_Attendance].[AdvanceApplication] DESC'
                        WHEN 'MannuallyCorrected' THEN '[ATN_Attendance].[MannuallyCorrected]'
                        WHEN 'MannuallyCorrected DESC' THEN '[ATN_Attendance].[MannuallyCorrected] DESC'
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
                        WHEN 'ATN_PunchStatus2_PunchStatusID' THEN '[ATN_PunchStatus2].[PunchStatusID]'
                        WHEN 'ATN_PunchStatus2_PunchStatusID DESC' THEN '[ATN_PunchStatus2].[PunchStatusID] DESC'
                        WHEN 'ATN_PunchStatus2_Description' THEN '[ATN_PunchStatus2].[Description]'
                        WHEN 'ATN_PunchStatus2_Description DESC' THEN '[ATN_PunchStatus2].[Description] DESC'
                        WHEN 'ATN_PunchStatus2_PunchValue' THEN '[ATN_PunchStatus2].[PunchValue]'
                        WHEN 'ATN_PunchStatus2_PunchValue DESC' THEN '[ATN_PunchStatus2].[PunchValue] DESC'
                        ELSE '[ATN_Attendance].[AttenID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_Attendance].[AttenID],
		[ATN_Attendance].[AttenDate],
		[ATN_Attendance].[CardNo],
		[ATN_Attendance].[Punch1Time],
		[ATN_Attendance].[Punch2Time],
		[ATN_Attendance].[PunchStatusID],
		[ATN_Attendance].[Punch9Time],
		[ATN_Attendance].[PunchValue],
		[ATN_Attendance].[FinalValue],
		[ATN_Attendance].[Applied],
		[ATN_Attendance].[NeedsRegularization],
		[ATN_Attendance].[FinYear],
		[ATN_Attendance].[AdvanceApplication],
		[ATN_Attendance].[MannuallyCorrected],
		[ATN_Attendance].[HoliDay],
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
		[ATN_PunchStatus2].[PunchStatusID] AS ATN_PunchStatus2_PunchStatusID,
		[ATN_PunchStatus2].[Description] AS ATN_PunchStatus2_Description,
		[ATN_PunchStatus2].[PunchValue] AS ATN_PunchStatus2_PunchValue 
  FROM [ATN_Attendance] 
    	INNER JOIN #PageIndex
          ON [ATN_Attendance].[AttenID] = #PageIndex.AttenID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_Attendance].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessedPunchStatusSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @Filter_C_OfficeID NVarChar(8),
  @Filter_AttenDate NVarChar(20), 
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[Applied1LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes4]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[Applied2LeaveTypeID] = [ATN_LeaveTypes4].[LeaveTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus5]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Attendance].[ApplStatusID] = [ATN_ApplicationStatus5].[ApplStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_Attendance].[CardNo] = ''' + @Filter_CardNo + ''''
  IF (@Filter_C_OfficeID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees1].[C_OfficeID] = ''' + @Filter_C_OfficeID + ''''
  IF (@Filter_AttenDate > '') 
    SET @LGSQL = @LGSQL + ' AND DATEDIFF(D,[ATN_Attendance].[AttenDate], CONVERT(DateTime,''' + @Filter_AttenDate + ''',103)) = 0 '
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
                        WHEN 'PunchValue' THEN '[ATN_Attendance].[PunchValue]'
                        WHEN 'PunchValue DESC' THEN '[ATN_Attendance].[PunchValue] DESC'
                        WHEN 'NeedsRegularization' THEN '[ATN_Attendance].[NeedsRegularization]'
                        WHEN 'NeedsRegularization DESC' THEN '[ATN_Attendance].[NeedsRegularization] DESC'
                        WHEN 'Applied' THEN '[ATN_Attendance].[Applied]'
                        WHEN 'Applied DESC' THEN '[ATN_Attendance].[Applied] DESC'
                        WHEN 'Applied1LeaveTypeID' THEN '[ATN_Attendance].[Applied1LeaveTypeID]'
                        WHEN 'Applied1LeaveTypeID DESC' THEN '[ATN_Attendance].[Applied1LeaveTypeID] DESC'
                        WHEN 'Applied2LeaveTypeID' THEN '[ATN_Attendance].[Applied2LeaveTypeID]'
                        WHEN 'Applied2LeaveTypeID DESC' THEN '[ATN_Attendance].[Applied2LeaveTypeID] DESC'
                        WHEN 'ApplHeaderID' THEN '[ATN_Attendance].[ApplHeaderID]'
                        WHEN 'ApplHeaderID DESC' THEN '[ATN_Attendance].[ApplHeaderID] DESC'
                        WHEN 'ApplStatusID' THEN '[ATN_Attendance].[ApplStatusID]'
                        WHEN 'ApplStatusID DESC' THEN '[ATN_Attendance].[ApplStatusID] DESC'
                        WHEN 'Posted' THEN '[ATN_Attendance].[Posted]'
                        WHEN 'Posted DESC' THEN '[ATN_Attendance].[Posted] DESC'
                        WHEN 'FinYear' THEN '[ATN_Attendance].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_Attendance].[FinYear] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'ATN_PunchStatus2_PunchStatusID' THEN '[ATN_PunchStatus2].[PunchStatusID]'
                        WHEN 'ATN_PunchStatus2_PunchStatusID DESC' THEN '[ATN_PunchStatus2].[PunchStatusID] DESC'
                        WHEN 'ATN_PunchStatus2_Description' THEN '[ATN_PunchStatus2].[Description]'
                        WHEN 'ATN_PunchStatus2_Description DESC' THEN '[ATN_PunchStatus2].[Description] DESC'
                        WHEN 'ATN_PunchStatus2_PunchValue' THEN '[ATN_PunchStatus2].[PunchValue]'
                        WHEN 'ATN_PunchStatus2_PunchValue DESC' THEN '[ATN_PunchStatus2].[PunchValue] DESC'
                        WHEN 'ATN_LeaveTypes3_LeaveTypeID' THEN '[ATN_LeaveTypes3].[LeaveTypeID]'
                        WHEN 'ATN_LeaveTypes3_LeaveTypeID DESC' THEN '[ATN_LeaveTypes3].[LeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes3_Description' THEN '[ATN_LeaveTypes3].[Description]'
                        WHEN 'ATN_LeaveTypes3_Description DESC' THEN '[ATN_LeaveTypes3].[Description] DESC'
                        WHEN 'ATN_LeaveTypes4_LeaveTypeID' THEN '[ATN_LeaveTypes4].[LeaveTypeID]'
                        WHEN 'ATN_LeaveTypes4_LeaveTypeID DESC' THEN '[ATN_LeaveTypes4].[LeaveTypeID] DESC'
                        WHEN 'ATN_LeaveTypes4_Description' THEN '[ATN_LeaveTypes4].[Description]'
                        WHEN 'ATN_LeaveTypes4_Description DESC' THEN '[ATN_LeaveTypes4].[Description] DESC'
                        WHEN 'ATN_ApplicationStatus5_ApplStatusID' THEN '[ATN_ApplicationStatus5].[ApplStatusID]'
                        WHEN 'ATN_ApplicationStatus5_ApplStatusID DESC' THEN '[ATN_ApplicationStatus5].[ApplStatusID] DESC'
                        WHEN 'ATN_ApplicationStatus5_Description' THEN '[ATN_ApplicationStatus5].[Description]'
                        WHEN 'ATN_ApplicationStatus5_Description DESC' THEN '[ATN_ApplicationStatus5].[Description] DESC'
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
		[ATN_Attendance].[PunchValue],
		[ATN_Attendance].[NeedsRegularization],
		[ATN_Attendance].[Applied],
		[ATN_Attendance].[Applied1LeaveTypeID],
		[ATN_Attendance].[Applied2LeaveTypeID],
		[ATN_Attendance].[ApplHeaderID],
		[ATN_Attendance].[ApplStatusID],
		[ATN_Attendance].[Posted],
		[ATN_Attendance].[FinYear],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[ATN_PunchStatus2].[PunchStatusID] AS ATN_PunchStatus2_PunchStatusID,
		[ATN_PunchStatus2].[Description] AS ATN_PunchStatus2_Description,
		[ATN_PunchStatus2].[PunchValue] AS ATN_PunchStatus2_PunchValue,
		[ATN_LeaveTypes3].[LeaveTypeID] AS ATN_LeaveTypes3_LeaveTypeID,
		[ATN_LeaveTypes3].[Description] AS ATN_LeaveTypes3_Description,
		[ATN_LeaveTypes4].[LeaveTypeID] AS ATN_LeaveTypes4_LeaveTypeID,
		[ATN_LeaveTypes4].[Description] AS ATN_LeaveTypes4_Description,
		[ATN_ApplicationStatus5].[ApplStatusID] AS ATN_ApplicationStatus5_ApplStatusID,
		[ATN_ApplicationStatus5].[Description] AS ATN_ApplicationStatus5_Description 
  FROM [ATN_Attendance] 
    	INNER JOIN #PageIndex
          ON [ATN_Attendance].[AttenID] = #PageIndex.AttenID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_Attendance].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_Attendance].[Applied1LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes4]
    ON [ATN_Attendance].[Applied2LeaveTypeID] = [ATN_LeaveTypes4].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus5]
    ON [ATN_Attendance].[ApplStatusID] = [ATN_ApplicationStatus5].[ApplStatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

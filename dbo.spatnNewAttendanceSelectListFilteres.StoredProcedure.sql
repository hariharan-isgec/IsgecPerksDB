USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnNewAttendanceSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
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
                        WHEN 'NeedsRegularization' THEN '[ATN_Attendance].[NeedsRegularization]'
                        WHEN 'NeedsRegularization DESC' THEN '[ATN_Attendance].[NeedsRegularization] DESC'
                        WHEN 'FinYear' THEN '[ATN_Attendance].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_Attendance].[FinYear] DESC'
                        WHEN 'Applied' THEN '[ATN_Attendance].[Applied]'
                        WHEN 'Applied DESC' THEN '[ATN_Attendance].[Applied] DESC'
                        WHEN 'AppliedValue' THEN '[ATN_Attendance].[AppliedValue]'
                        WHEN 'AppliedValue DESC' THEN '[ATN_Attendance].[AppliedValue] DESC'
                        WHEN 'Applied1LeaveTypeID' THEN '[ATN_Attendance].[Applied1LeaveTypeID]'
                        WHEN 'Applied1LeaveTypeID DESC' THEN '[ATN_Attendance].[Applied1LeaveTypeID] DESC'
                        WHEN 'Applied2LeaveTypeID' THEN '[ATN_Attendance].[Applied2LeaveTypeID]'
                        WHEN 'Applied2LeaveTypeID DESC' THEN '[ATN_Attendance].[Applied2LeaveTypeID] DESC'
                        WHEN 'Posted' THEN '[ATN_Attendance].[Posted]'
                        WHEN 'Posted DESC' THEN '[ATN_Attendance].[Posted] DESC'
                        WHEN 'Posted1LeaveTypeID' THEN '[ATN_Attendance].[Posted1LeaveTypeID]'
                        WHEN 'Posted1LeaveTypeID DESC' THEN '[ATN_Attendance].[Posted1LeaveTypeID] DESC'
                        WHEN 'Posted2LeaveTypeID' THEN '[ATN_Attendance].[Posted2LeaveTypeID]'
                        WHEN 'Posted2LeaveTypeID DESC' THEN '[ATN_Attendance].[Posted2LeaveTypeID] DESC'
                        WHEN 'ApplHeaderID' THEN '[ATN_Attendance].[ApplHeaderID]'
                        WHEN 'ApplHeaderID DESC' THEN '[ATN_Attendance].[ApplHeaderID] DESC'
                        WHEN 'ApplStatusID' THEN '[ATN_Attendance].[ApplStatusID]'
                        WHEN 'ApplStatusID DESC' THEN '[ATN_Attendance].[ApplStatusID] DESC'
                        WHEN 'FinalValue' THEN '[ATN_Attendance].[FinalValue]'
                        WHEN 'FinalValue DESC' THEN '[ATN_Attendance].[FinalValue] DESC'
                        WHEN 'AdvanceApplication' THEN '[ATN_Attendance].[AdvanceApplication]'
                        WHEN 'AdvanceApplication DESC' THEN '[ATN_Attendance].[AdvanceApplication] DESC'
                        WHEN 'MannuallyCorrected' THEN '[ATN_Attendance].[MannuallyCorrected]'
                        WHEN 'MannuallyCorrected DESC' THEN '[ATN_Attendance].[MannuallyCorrected] DESC'
                        WHEN 'Destination' THEN '[ATN_Attendance].[Destination]'
                        WHEN 'Destination DESC' THEN '[ATN_Attendance].[Destination] DESC'
                        WHEN 'Purpose' THEN '[ATN_Attendance].[Purpose]'
                        WHEN 'Purpose DESC' THEN '[ATN_Attendance].[Purpose] DESC'
                        WHEN 'ConfigID' THEN '[ATN_Attendance].[ConfigID]'
                        WHEN 'ConfigID DESC' THEN '[ATN_Attendance].[ConfigID] DESC'
                        WHEN 'ConfigDetailID' THEN '[ATN_Attendance].[ConfigDetailID]'
                        WHEN 'ConfigDetailID DESC' THEN '[ATN_Attendance].[ConfigDetailID] DESC'
                        WHEN 'ConfigStatus' THEN '[ATN_Attendance].[ConfigStatus]'
                        WHEN 'ConfigStatus DESC' THEN '[ATN_Attendance].[ConfigStatus] DESC'
                        WHEN 'TSStatus' THEN '[ATN_Attendance].[TSStatus]'
                        WHEN 'TSStatus DESC' THEN '[ATN_Attendance].[TSStatus] DESC'
                        WHEN 'TSStatusBy' THEN '[ATN_Attendance].[TSStatusBy]'
                        WHEN 'TSStatusBy DESC' THEN '[ATN_Attendance].[TSStatusBy] DESC'
                        WHEN 'TSStatusOn' THEN '[ATN_Attendance].[TSStatusOn]'
                        WHEN 'TSStatusOn DESC' THEN '[ATN_Attendance].[TSStatusOn] DESC'
                        ELSE '[ATN_Attendance].[AttenID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_Attendance].*   
  FROM [ATN_Attendance] 
    	INNER JOIN #PageIndex
          ON [ATN_Attendance].[AttenID] = #PageIndex.AttenID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

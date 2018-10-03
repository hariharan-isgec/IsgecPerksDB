USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigDetailsSelectListFilteres]
  @Filter_ConfigID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (SerialNo) ' + 
               'SELECT [ATN_PunchConfigDetails].[SerialNo] FROM [ATN_PunchConfigDetails] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_PunchConfig] AS [ATN_PunchConfig1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_PunchConfigDetails].[ConfigID] = [ATN_PunchConfig1].[RecordID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ConfigID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ATN_PunchConfigDetails].[ConfigID] = ' + STR(@Filter_ConfigID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[ATN_PunchConfigDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ATN_PunchConfigDetails].[SerialNo] DESC'
                        WHEN 'ConfigID' THEN '[ATN_PunchConfigDetails].[ConfigID]'
                        WHEN 'ConfigID DESC' THEN '[ATN_PunchConfigDetails].[ConfigID] DESC'
                        WHEN 'FPStartTime' THEN '[ATN_PunchConfigDetails].[FPStartTime]'
                        WHEN 'FPStartTime DESC' THEN '[ATN_PunchConfigDetails].[FPStartTime] DESC'
                        WHEN 'FPEndTime' THEN '[ATN_PunchConfigDetails].[FPEndTime]'
                        WHEN 'FPEndTime DESC' THEN '[ATN_PunchConfigDetails].[FPEndTime] DESC'
                        WHEN 'UseDefined' THEN '[ATN_PunchConfigDetails].[UseDefined]'
                        WHEN 'UseDefined DESC' THEN '[ATN_PunchConfigDetails].[UseDefined] DESC'
                        WHEN 'DefinedTime' THEN '[ATN_PunchConfigDetails].[DefinedTime]'
                        WHEN 'DefinedTime DESC' THEN '[ATN_PunchConfigDetails].[DefinedTime] DESC'
                        WHEN 'SPStartTime' THEN '[ATN_PunchConfigDetails].[SPStartTime]'
                        WHEN 'SPStartTime DESC' THEN '[ATN_PunchConfigDetails].[SPStartTime] DESC'
                        WHEN 'SPEndTime' THEN '[ATN_PunchConfigDetails].[SPEndTime]'
                        WHEN 'SPEndTime DESC' THEN '[ATN_PunchConfigDetails].[SPEndTime] DESC'
                        WHEN 'CalculateHours' THEN '[ATN_PunchConfigDetails].[CalculateHours]'
                        WHEN 'CalculateHours DESC' THEN '[ATN_PunchConfigDetails].[CalculateHours] DESC'
                        WHEN 'HoursStatus' THEN '[ATN_PunchConfigDetails].[HoursStatus]'
                        WHEN 'HoursStatus DESC' THEN '[ATN_PunchConfigDetails].[HoursStatus] DESC'
                        WHEN 'HoursValue' THEN '[ATN_PunchConfigDetails].[HoursValue]'
                        WHEN 'HoursValue DESC' THEN '[ATN_PunchConfigDetails].[HoursValue] DESC'
                        WHEN 'LimitedAllowed' THEN '[ATN_PunchConfigDetails].[LimitedAllowed]'
                        WHEN 'LimitedAllowed DESC' THEN '[ATN_PunchConfigDetails].[LimitedAllowed] DESC'
                        WHEN 'LimitCount' THEN '[ATN_PunchConfigDetails].[LimitCount]'
                        WHEN 'LimitCount DESC' THEN '[ATN_PunchConfigDetails].[LimitCount] DESC'
                        WHEN 'LimitPunchStatus' THEN '[ATN_PunchConfigDetails].[LimitPunchStatus]'
                        WHEN 'LimitPunchStatus DESC' THEN '[ATN_PunchConfigDetails].[LimitPunchStatus] DESC'
                        WHEN 'NormalPunchStatus' THEN '[ATN_PunchConfigDetails].[NormalPunchStatus]'
                        WHEN 'NormalPunchStatus DESC' THEN '[ATN_PunchConfigDetails].[NormalPunchStatus] DESC'
                        WHEN 'LimitedLeaveTypes' THEN '[ATN_PunchConfigDetails].[LimitedLeaveTypes]'
                        WHEN 'LimitedLeaveTypes DESC' THEN '[ATN_PunchConfigDetails].[LimitedLeaveTypes] DESC'
                        WHEN 'NormalLeaveTypes' THEN '[ATN_PunchConfigDetails].[NormalLeaveTypes]'
                        WHEN 'NormalLeaveTypes DESC' THEN '[ATN_PunchConfigDetails].[NormalLeaveTypes] DESC'
                        WHEN 'ExceptionRule' THEN '[ATN_PunchConfigDetails].[ExceptionRule]'
                        WHEN 'ExceptionRule DESC' THEN '[ATN_PunchConfigDetails].[ExceptionRule] DESC'
                        WHEN 'ConfigStatus' THEN '[ATN_PunchConfigDetails].[ConfigStatus]'
                        WHEN 'ConfigStatus DESC' THEN '[ATN_PunchConfigDetails].[ConfigStatus] DESC'
                        WHEN 'ATN_PunchConfig1_RecordID' THEN '[ATN_PunchConfig1].[RecordID]'
                        WHEN 'ATN_PunchConfig1_RecordID DESC' THEN '[ATN_PunchConfig1].[RecordID] DESC'
                        WHEN 'ATN_PunchConfig1_Description' THEN '[ATN_PunchConfig1].[Description]'
                        WHEN 'ATN_PunchConfig1_Description DESC' THEN '[ATN_PunchConfig1].[Description] DESC'
                        WHEN 'ATN_PunchConfig1_STD1Time' THEN '[ATN_PunchConfig1].[STD1Time]'
                        WHEN 'ATN_PunchConfig1_STD1Time DESC' THEN '[ATN_PunchConfig1].[STD1Time] DESC'
                        WHEN 'ATN_PunchConfig1_Range1Start' THEN '[ATN_PunchConfig1].[Range1Start]'
                        WHEN 'ATN_PunchConfig1_Range1Start DESC' THEN '[ATN_PunchConfig1].[Range1Start] DESC'
                        WHEN 'ATN_PunchConfig1_Range1End' THEN '[ATN_PunchConfig1].[Range1End]'
                        WHEN 'ATN_PunchConfig1_Range1End DESC' THEN '[ATN_PunchConfig1].[Range1End] DESC'
                        WHEN 'ATN_PunchConfig1_MeanTime' THEN '[ATN_PunchConfig1].[MeanTime]'
                        WHEN 'ATN_PunchConfig1_MeanTime DESC' THEN '[ATN_PunchConfig1].[MeanTime] DESC'
                        WHEN 'ATN_PunchConfig1_STD2Time' THEN '[ATN_PunchConfig1].[STD2Time]'
                        WHEN 'ATN_PunchConfig1_STD2Time DESC' THEN '[ATN_PunchConfig1].[STD2Time] DESC'
                        WHEN 'ATN_PunchConfig1_Range2Start' THEN '[ATN_PunchConfig1].[Range2Start]'
                        WHEN 'ATN_PunchConfig1_Range2Start DESC' THEN '[ATN_PunchConfig1].[Range2Start] DESC'
                        WHEN 'ATN_PunchConfig1_Range2End' THEN '[ATN_PunchConfig1].[Range2End]'
                        WHEN 'ATN_PunchConfig1_Range2End DESC' THEN '[ATN_PunchConfig1].[Range2End] DESC'
                        WHEN 'ATN_PunchConfig1_EnableMinHrs' THEN '[ATN_PunchConfig1].[EnableMinHrs]'
                        WHEN 'ATN_PunchConfig1_EnableMinHrs DESC' THEN '[ATN_PunchConfig1].[EnableMinHrs] DESC'
                        WHEN 'ATN_PunchConfig1_MinHrsFullPresent' THEN '[ATN_PunchConfig1].[MinHrsFullPresent]'
                        WHEN 'ATN_PunchConfig1_MinHrsFullPresent DESC' THEN '[ATN_PunchConfig1].[MinHrsFullPresent] DESC'
                        WHEN 'ATN_PunchConfig1_MinHrsHalfPresent' THEN '[ATN_PunchConfig1].[MinHrsHalfPresent]'
                        WHEN 'ATN_PunchConfig1_MinHrsHalfPresent DESC' THEN '[ATN_PunchConfig1].[MinHrsHalfPresent] DESC'
                        WHEN 'ATN_PunchConfig1_Active' THEN '[ATN_PunchConfig1].[Active]'
                        WHEN 'ATN_PunchConfig1_Active DESC' THEN '[ATN_PunchConfig1].[Active] DESC'
                        WHEN 'ATN_PunchConfig1_FinYear' THEN '[ATN_PunchConfig1].[FinYear]'
                        WHEN 'ATN_PunchConfig1_FinYear DESC' THEN '[ATN_PunchConfig1].[FinYear] DESC'
                        WHEN 'ATN_PunchConfig1_DataFileLocation' THEN '[ATN_PunchConfig1].[DataFileLocation]'
                        WHEN 'ATN_PunchConfig1_DataFileLocation DESC' THEN '[ATN_PunchConfig1].[DataFileLocation] DESC'
                        ELSE '[ATN_PunchConfigDetails].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_PunchConfigDetails].[SerialNo],
		[ATN_PunchConfigDetails].[ConfigID],
		[ATN_PunchConfigDetails].[FPStartTime],
		[ATN_PunchConfigDetails].[FPEndTime],
		[ATN_PunchConfigDetails].[UseDefined],
		[ATN_PunchConfigDetails].[DefinedTime],
		[ATN_PunchConfigDetails].[SPStartTime],
		[ATN_PunchConfigDetails].[SPEndTime],
		[ATN_PunchConfigDetails].[CalculateHours],
		[ATN_PunchConfigDetails].[HoursStatus],
		[ATN_PunchConfigDetails].[HoursValue],
		[ATN_PunchConfigDetails].[LimitedAllowed],
		[ATN_PunchConfigDetails].[LimitCount],
		[ATN_PunchConfigDetails].[LimitPunchStatus],
		[ATN_PunchConfigDetails].[NormalPunchStatus],
		[ATN_PunchConfigDetails].[LimitedLeaveTypes],
		[ATN_PunchConfigDetails].[NormalLeaveTypes],
		[ATN_PunchConfigDetails].[ExceptionRule],
		[ATN_PunchConfigDetails].[ConfigStatus],
		[ATN_PunchConfig1].[RecordID] AS ATN_PunchConfig1_RecordID,
		[ATN_PunchConfig1].[Description] AS ATN_PunchConfig1_Description,
		[ATN_PunchConfig1].[STD1Time] AS ATN_PunchConfig1_STD1Time,
		[ATN_PunchConfig1].[Range1Start] AS ATN_PunchConfig1_Range1Start,
		[ATN_PunchConfig1].[Range1End] AS ATN_PunchConfig1_Range1End,
		[ATN_PunchConfig1].[MeanTime] AS ATN_PunchConfig1_MeanTime,
		[ATN_PunchConfig1].[STD2Time] AS ATN_PunchConfig1_STD2Time,
		[ATN_PunchConfig1].[Range2Start] AS ATN_PunchConfig1_Range2Start,
		[ATN_PunchConfig1].[Range2End] AS ATN_PunchConfig1_Range2End,
		[ATN_PunchConfig1].[EnableMinHrs] AS ATN_PunchConfig1_EnableMinHrs,
		[ATN_PunchConfig1].[MinHrsFullPresent] AS ATN_PunchConfig1_MinHrsFullPresent,
		[ATN_PunchConfig1].[MinHrsHalfPresent] AS ATN_PunchConfig1_MinHrsHalfPresent,
		[ATN_PunchConfig1].[Active] AS ATN_PunchConfig1_Active,
		[ATN_PunchConfig1].[FinYear] AS ATN_PunchConfig1_FinYear,
		[ATN_PunchConfig1].[DataFileLocation] AS ATN_PunchConfig1_DataFileLocation 
  FROM [ATN_PunchConfigDetails] 
    	INNER JOIN #PageIndex
          ON [ATN_PunchConfigDetails].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [ATN_PunchConfig] AS [ATN_PunchConfig1]
    ON [ATN_PunchConfigDetails].[ConfigID] = [ATN_PunchConfig1].[RecordID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigDetailsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [ATN_PunchConfigDetails].[SerialNo] FROM [ATN_PunchConfigDetails]
  INNER JOIN [ATN_PunchConfig] AS [ATN_PunchConfig1]
    ON [ATN_PunchConfigDetails].[ConfigID] = [ATN_PunchConfig1].[RecordID]
 WHERE  
   ( 
         STR(ISNULL([ATN_PunchConfigDetails].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfigDetails].[ConfigID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfigDetails].[FPStartTime], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfigDetails].[FPEndTime], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfigDetails].[DefinedTime], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfigDetails].[SPStartTime], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfigDetails].[SPEndTime], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchConfigDetails].[HoursStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfigDetails].[HoursValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfigDetails].[LimitCount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchConfigDetails].[LimitPunchStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchConfigDetails].[NormalPunchStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchConfigDetails].[LimitedLeaveTypes],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchConfigDetails].[NormalLeaveTypes],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchConfigDetails].[ConfigStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchConfig1].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfig1].[STD1Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfig1].[Range1Start], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfig1].[Range1End], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfig1].[MeanTime], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfig1].[STD2Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfig1].[Range2Start], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfig1].[Range2End], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfig1].[MinHrsFullPresent], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchConfig1].[MinHrsHalfPresent], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchConfig1].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchConfig1].[DataFileLocation],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SerialNo' THEN [ATN_PunchConfigDetails].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [ATN_PunchConfigDetails].[SerialNo] END DESC,
     CASE @orderBy WHEN 'ConfigID' THEN [ATN_PunchConfigDetails].[ConfigID] END,
     CASE @orderBy WHEN 'ConfigID DESC' THEN [ATN_PunchConfigDetails].[ConfigID] END DESC,
     CASE @orderBy WHEN 'FPStartTime' THEN [ATN_PunchConfigDetails].[FPStartTime] END,
     CASE @orderBy WHEN 'FPStartTime DESC' THEN [ATN_PunchConfigDetails].[FPStartTime] END DESC,
     CASE @orderBy WHEN 'FPEndTime' THEN [ATN_PunchConfigDetails].[FPEndTime] END,
     CASE @orderBy WHEN 'FPEndTime DESC' THEN [ATN_PunchConfigDetails].[FPEndTime] END DESC,
     CASE @orderBy WHEN 'UseDefined' THEN [ATN_PunchConfigDetails].[UseDefined] END,
     CASE @orderBy WHEN 'UseDefined DESC' THEN [ATN_PunchConfigDetails].[UseDefined] END DESC,
     CASE @orderBy WHEN 'DefinedTime' THEN [ATN_PunchConfigDetails].[DefinedTime] END,
     CASE @orderBy WHEN 'DefinedTime DESC' THEN [ATN_PunchConfigDetails].[DefinedTime] END DESC,
     CASE @orderBy WHEN 'SPStartTime' THEN [ATN_PunchConfigDetails].[SPStartTime] END,
     CASE @orderBy WHEN 'SPStartTime DESC' THEN [ATN_PunchConfigDetails].[SPStartTime] END DESC,
     CASE @orderBy WHEN 'SPEndTime' THEN [ATN_PunchConfigDetails].[SPEndTime] END,
     CASE @orderBy WHEN 'SPEndTime DESC' THEN [ATN_PunchConfigDetails].[SPEndTime] END DESC,
     CASE @orderBy WHEN 'CalculateHours' THEN [ATN_PunchConfigDetails].[CalculateHours] END,
     CASE @orderBy WHEN 'CalculateHours DESC' THEN [ATN_PunchConfigDetails].[CalculateHours] END DESC,
     CASE @orderBy WHEN 'HoursStatus' THEN [ATN_PunchConfigDetails].[HoursStatus] END,
     CASE @orderBy WHEN 'HoursStatus DESC' THEN [ATN_PunchConfigDetails].[HoursStatus] END DESC,
     CASE @orderBy WHEN 'HoursValue' THEN [ATN_PunchConfigDetails].[HoursValue] END,
     CASE @orderBy WHEN 'HoursValue DESC' THEN [ATN_PunchConfigDetails].[HoursValue] END DESC,
     CASE @orderBy WHEN 'LimitedAllowed' THEN [ATN_PunchConfigDetails].[LimitedAllowed] END,
     CASE @orderBy WHEN 'LimitedAllowed DESC' THEN [ATN_PunchConfigDetails].[LimitedAllowed] END DESC,
     CASE @orderBy WHEN 'LimitCount' THEN [ATN_PunchConfigDetails].[LimitCount] END,
     CASE @orderBy WHEN 'LimitCount DESC' THEN [ATN_PunchConfigDetails].[LimitCount] END DESC,
     CASE @orderBy WHEN 'LimitPunchStatus' THEN [ATN_PunchConfigDetails].[LimitPunchStatus] END,
     CASE @orderBy WHEN 'LimitPunchStatus DESC' THEN [ATN_PunchConfigDetails].[LimitPunchStatus] END DESC,
     CASE @orderBy WHEN 'NormalPunchStatus' THEN [ATN_PunchConfigDetails].[NormalPunchStatus] END,
     CASE @orderBy WHEN 'NormalPunchStatus DESC' THEN [ATN_PunchConfigDetails].[NormalPunchStatus] END DESC,
     CASE @orderBy WHEN 'LimitedLeaveTypes' THEN [ATN_PunchConfigDetails].[LimitedLeaveTypes] END,
     CASE @orderBy WHEN 'LimitedLeaveTypes DESC' THEN [ATN_PunchConfigDetails].[LimitedLeaveTypes] END DESC,
     CASE @orderBy WHEN 'NormalLeaveTypes' THEN [ATN_PunchConfigDetails].[NormalLeaveTypes] END,
     CASE @orderBy WHEN 'NormalLeaveTypes DESC' THEN [ATN_PunchConfigDetails].[NormalLeaveTypes] END DESC,
     CASE @orderBy WHEN 'ExceptionRule' THEN [ATN_PunchConfigDetails].[ExceptionRule] END,
     CASE @orderBy WHEN 'ExceptionRule DESC' THEN [ATN_PunchConfigDetails].[ExceptionRule] END DESC,
     CASE @orderBy WHEN 'ConfigStatus' THEN [ATN_PunchConfigDetails].[ConfigStatus] END,
     CASE @orderBy WHEN 'ConfigStatus DESC' THEN [ATN_PunchConfigDetails].[ConfigStatus] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_RecordID' THEN [ATN_PunchConfig1].[RecordID] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_RecordID DESC' THEN [ATN_PunchConfig1].[RecordID] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Description' THEN [ATN_PunchConfig1].[Description] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Description DESC' THEN [ATN_PunchConfig1].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_STD1Time' THEN [ATN_PunchConfig1].[STD1Time] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_STD1Time DESC' THEN [ATN_PunchConfig1].[STD1Time] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Range1Start' THEN [ATN_PunchConfig1].[Range1Start] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Range1Start DESC' THEN [ATN_PunchConfig1].[Range1Start] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Range1End' THEN [ATN_PunchConfig1].[Range1End] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Range1End DESC' THEN [ATN_PunchConfig1].[Range1End] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_MeanTime' THEN [ATN_PunchConfig1].[MeanTime] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_MeanTime DESC' THEN [ATN_PunchConfig1].[MeanTime] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_STD2Time' THEN [ATN_PunchConfig1].[STD2Time] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_STD2Time DESC' THEN [ATN_PunchConfig1].[STD2Time] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Range2Start' THEN [ATN_PunchConfig1].[Range2Start] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Range2Start DESC' THEN [ATN_PunchConfig1].[Range2Start] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Range2End' THEN [ATN_PunchConfig1].[Range2End] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Range2End DESC' THEN [ATN_PunchConfig1].[Range2End] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_EnableMinHrs' THEN [ATN_PunchConfig1].[EnableMinHrs] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_EnableMinHrs DESC' THEN [ATN_PunchConfig1].[EnableMinHrs] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_MinHrsFullPresent' THEN [ATN_PunchConfig1].[MinHrsFullPresent] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_MinHrsFullPresent DESC' THEN [ATN_PunchConfig1].[MinHrsFullPresent] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_MinHrsHalfPresent' THEN [ATN_PunchConfig1].[MinHrsHalfPresent] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_MinHrsHalfPresent DESC' THEN [ATN_PunchConfig1].[MinHrsHalfPresent] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Active' THEN [ATN_PunchConfig1].[Active] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_Active DESC' THEN [ATN_PunchConfig1].[Active] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_FinYear' THEN [ATN_PunchConfig1].[FinYear] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_FinYear DESC' THEN [ATN_PunchConfig1].[FinYear] END DESC,
     CASE @orderBy WHEN 'ATN_PunchConfig1_DataFileLocation' THEN [ATN_PunchConfig1].[DataFileLocation] END,
     CASE @orderBy WHEN 'ATN_PunchConfig1_DataFileLocation DESC' THEN [ATN_PunchConfig1].[DataFileLocation] END DESC 

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

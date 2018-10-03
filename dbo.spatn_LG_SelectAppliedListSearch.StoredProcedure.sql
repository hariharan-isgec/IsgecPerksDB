USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_SelectAppliedListSearch]
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
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AttenID Int NOT NULL
  )
  INSERT INTO #PageIndex (AttenID)
  SELECT [ATN_Attendance].[AttenID] FROM [ATN_Attendance]
 WHERE  
      [ATN_Attendance].[FinYear] = @FinYear
   AND [ATN_Attendance].[Applied] = 1  
   AND ( 
         STR(ISNULL([ATN_Attendance].[AttenID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[Punch1Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[Punch2Time], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[PunchStatusID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[Punch9Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[PunchValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[FinYear],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[AppliedValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[Applied1LeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[Applied2LeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[Posted1LeaveTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[Posted2LeaveTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[ApplHeaderID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[ApplStatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[FinalValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[Destination],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[Purpose],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[ConfigID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Attendance].[ConfigDetailID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[ConfigStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[TSStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Attendance].[TSStatusBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY 
     CASE @orderBy WHEN 'AttenID' THEN [ATN_Attendance].[AttenID] END,
     CASE @orderBy WHEN 'AttenID DESC' THEN [ATN_Attendance].[AttenID] END DESC,
     CASE @orderBy WHEN 'AttenDate' THEN [ATN_Attendance].[AttenDate] END,
     CASE @orderBy WHEN 'AttenDate DESC' THEN [ATN_Attendance].[AttenDate] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_Attendance].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_Attendance].[CardNo] END DESC,
     CASE @orderBy WHEN 'Punch1Time' THEN [ATN_Attendance].[Punch1Time] END,
     CASE @orderBy WHEN 'Punch1Time DESC' THEN [ATN_Attendance].[Punch1Time] END DESC,
     CASE @orderBy WHEN 'Punch2Time' THEN [ATN_Attendance].[Punch2Time] END,
     CASE @orderBy WHEN 'Punch2Time DESC' THEN [ATN_Attendance].[Punch2Time] END DESC,
     CASE @orderBy WHEN 'PunchStatusID' THEN [ATN_Attendance].[PunchStatusID] END,
     CASE @orderBy WHEN 'PunchStatusID DESC' THEN [ATN_Attendance].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'Punch9Time' THEN [ATN_Attendance].[Punch9Time] END,
     CASE @orderBy WHEN 'Punch9Time DESC' THEN [ATN_Attendance].[Punch9Time] END DESC,
     CASE @orderBy WHEN 'PunchValue' THEN [ATN_Attendance].[PunchValue] END,
     CASE @orderBy WHEN 'PunchValue DESC' THEN [ATN_Attendance].[PunchValue] END DESC,
     CASE @orderBy WHEN 'NeedsRegularization' THEN [ATN_Attendance].[NeedsRegularization] END,
     CASE @orderBy WHEN 'NeedsRegularization DESC' THEN [ATN_Attendance].[NeedsRegularization] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_Attendance].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_Attendance].[FinYear] END DESC,
     CASE @orderBy WHEN 'Applied' THEN [ATN_Attendance].[Applied] END,
     CASE @orderBy WHEN 'Applied DESC' THEN [ATN_Attendance].[Applied] END DESC,
     CASE @orderBy WHEN 'AppliedValue' THEN [ATN_Attendance].[AppliedValue] END,
     CASE @orderBy WHEN 'AppliedValue DESC' THEN [ATN_Attendance].[AppliedValue] END DESC,
     CASE @orderBy WHEN 'Applied1LeaveTypeID' THEN [ATN_Attendance].[Applied1LeaveTypeID] END,
     CASE @orderBy WHEN 'Applied1LeaveTypeID DESC' THEN [ATN_Attendance].[Applied1LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'Applied2LeaveTypeID' THEN [ATN_Attendance].[Applied2LeaveTypeID] END,
     CASE @orderBy WHEN 'Applied2LeaveTypeID DESC' THEN [ATN_Attendance].[Applied2LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'Posted' THEN [ATN_Attendance].[Posted] END,
     CASE @orderBy WHEN 'Posted DESC' THEN [ATN_Attendance].[Posted] END DESC,
     CASE @orderBy WHEN 'Posted1LeaveTypeID' THEN [ATN_Attendance].[Posted1LeaveTypeID] END,
     CASE @orderBy WHEN 'Posted1LeaveTypeID DESC' THEN [ATN_Attendance].[Posted1LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'Posted2LeaveTypeID' THEN [ATN_Attendance].[Posted2LeaveTypeID] END,
     CASE @orderBy WHEN 'Posted2LeaveTypeID DESC' THEN [ATN_Attendance].[Posted2LeaveTypeID] END DESC,
     CASE @orderBy WHEN 'ApplHeaderID' THEN [ATN_Attendance].[ApplHeaderID] END,
     CASE @orderBy WHEN 'ApplHeaderID DESC' THEN [ATN_Attendance].[ApplHeaderID] END DESC,
     CASE @orderBy WHEN 'ApplStatusID' THEN [ATN_Attendance].[ApplStatusID] END,
     CASE @orderBy WHEN 'ApplStatusID DESC' THEN [ATN_Attendance].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'FinalValue' THEN [ATN_Attendance].[FinalValue] END,
     CASE @orderBy WHEN 'FinalValue DESC' THEN [ATN_Attendance].[FinalValue] END DESC,
     CASE @orderBy WHEN 'AdvanceApplication' THEN [ATN_Attendance].[AdvanceApplication] END,
     CASE @orderBy WHEN 'AdvanceApplication DESC' THEN [ATN_Attendance].[AdvanceApplication] END DESC,
     CASE @orderBy WHEN 'MannuallyCorrected' THEN [ATN_Attendance].[MannuallyCorrected] END,
     CASE @orderBy WHEN 'MannuallyCorrected DESC' THEN [ATN_Attendance].[MannuallyCorrected] END DESC,
     CASE @orderBy WHEN 'Destination' THEN [ATN_Attendance].[Destination] END,
     CASE @orderBy WHEN 'Destination DESC' THEN [ATN_Attendance].[Destination] END DESC,
     CASE @orderBy WHEN 'Purpose' THEN [ATN_Attendance].[Purpose] END,
     CASE @orderBy WHEN 'Purpose DESC' THEN [ATN_Attendance].[Purpose] END DESC,
     CASE @orderBy WHEN 'ConfigID' THEN [ATN_Attendance].[ConfigID] END,
     CASE @orderBy WHEN 'ConfigID DESC' THEN [ATN_Attendance].[ConfigID] END DESC,
     CASE @orderBy WHEN 'ConfigDetailID' THEN [ATN_Attendance].[ConfigDetailID] END,
     CASE @orderBy WHEN 'ConfigDetailID DESC' THEN [ATN_Attendance].[ConfigDetailID] END DESC,
     CASE @orderBy WHEN 'ConfigStatus' THEN [ATN_Attendance].[ConfigStatus] END,
     CASE @orderBy WHEN 'ConfigStatus DESC' THEN [ATN_Attendance].[ConfigStatus] END DESC,
     CASE @orderBy WHEN 'TSStatus' THEN [ATN_Attendance].[TSStatus] END,
     CASE @orderBy WHEN 'TSStatus DESC' THEN [ATN_Attendance].[TSStatus] END DESC,
     CASE @orderBy WHEN 'TSStatusBy' THEN [ATN_Attendance].[TSStatusBy] END,
     CASE @orderBy WHEN 'TSStatusBy DESC' THEN [ATN_Attendance].[TSStatusBy] END DESC,
     CASE @orderBy WHEN 'TSStatusOn' THEN [ATN_Attendance].[TSStatusOn] END,
     CASE @orderBy WHEN 'TSStatusOn DESC' THEN [ATN_Attendance].[TSStatusOn] END DESC 

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
		[ATN_Attendance].[NeedsRegularization],
		[ATN_Attendance].[FinYear],
		[ATN_Attendance].[Applied],
		[ATN_Attendance].[AppliedValue],
		[ATN_Attendance].[Applied1LeaveTypeID],
		[ATN_Attendance].[Applied2LeaveTypeID],
		[ATN_Attendance].[Posted],
		[ATN_Attendance].[Posted1LeaveTypeID],
		[ATN_Attendance].[Posted2LeaveTypeID],
		[ATN_Attendance].[ApplHeaderID],
		[ATN_Attendance].[ApplStatusID],
		[ATN_Attendance].[FinalValue],
		[ATN_Attendance].[AdvanceApplication],
		[ATN_Attendance].[MannuallyCorrected],
		[ATN_Attendance].[Destination],
		[ATN_Attendance].[Purpose],
		[ATN_Attendance].[ConfigID],
		[ATN_Attendance].[ConfigDetailID],
		[ATN_Attendance].[ConfigStatus],
		[ATN_Attendance].[TSStatus],
		[ATN_Attendance].[TSStatusBy],
		[ATN_Attendance].[TSStatusOn], 
		[ATN_Attendance].[HoliDay] 
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

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigSelectList]
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_PunchConfig].[RecordID],
		[ATN_PunchConfig].[STD1Time],
		[ATN_PunchConfig].[Range1Start],
		[ATN_PunchConfig].[Range1End],
		[ATN_PunchConfig].[MeanTime],
		[ATN_PunchConfig].[STD2Time],
		[ATN_PunchConfig].[Range2Start],
		[ATN_PunchConfig].[Range2End],
		[ATN_PunchConfig].[EnableMinHrs],
		[ATN_PunchConfig].[MinHrsFullPresent],
		[ATN_PunchConfig].[MinHrsHalfPresent],
		[ATN_PunchConfig].[Active],
		[ATN_PunchConfig].[FinYear],
		[ATN_PunchConfig].[DataFileLocation] 
  FROM [ATN_PunchConfig] 
  WHERE [ATN_PunchConfig].[FinYear] = @FinYear
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [ATN_PunchConfig].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [ATN_PunchConfig].[RecordID] END DESC,
     CASE @orderBy WHEN 'STD1Time' THEN [ATN_PunchConfig].[STD1Time] END,
     CASE @orderBy WHEN 'STD1Time DESC' THEN [ATN_PunchConfig].[STD1Time] END DESC,
     CASE @orderBy WHEN 'Range1Start' THEN [ATN_PunchConfig].[Range1Start] END,
     CASE @orderBy WHEN 'Range1Start DESC' THEN [ATN_PunchConfig].[Range1Start] END DESC,
     CASE @orderBy WHEN 'Range1End' THEN [ATN_PunchConfig].[Range1End] END,
     CASE @orderBy WHEN 'Range1End DESC' THEN [ATN_PunchConfig].[Range1End] END DESC,
     CASE @orderBy WHEN 'MeanTime' THEN [ATN_PunchConfig].[MeanTime] END,
     CASE @orderBy WHEN 'MeanTime DESC' THEN [ATN_PunchConfig].[MeanTime] END DESC,
     CASE @orderBy WHEN 'STD2Time' THEN [ATN_PunchConfig].[STD2Time] END,
     CASE @orderBy WHEN 'STD2Time DESC' THEN [ATN_PunchConfig].[STD2Time] END DESC,
     CASE @orderBy WHEN 'Range2Start' THEN [ATN_PunchConfig].[Range2Start] END,
     CASE @orderBy WHEN 'Range2Start DESC' THEN [ATN_PunchConfig].[Range2Start] END DESC,
     CASE @orderBy WHEN 'Range2End' THEN [ATN_PunchConfig].[Range2End] END,
     CASE @orderBy WHEN 'Range2End DESC' THEN [ATN_PunchConfig].[Range2End] END DESC,
     CASE @orderBy WHEN 'EnableMinHrs' THEN [ATN_PunchConfig].[EnableMinHrs] END,
     CASE @orderBy WHEN 'EnableMinHrs DESC' THEN [ATN_PunchConfig].[EnableMinHrs] END DESC,
     CASE @orderBy WHEN 'MinHrsFullPresent' THEN [ATN_PunchConfig].[MinHrsFullPresent] END,
     CASE @orderBy WHEN 'MinHrsFullPresent DESC' THEN [ATN_PunchConfig].[MinHrsFullPresent] END DESC,
     CASE @orderBy WHEN 'MinHrsHalfPresent' THEN [ATN_PunchConfig].[MinHrsHalfPresent] END,
     CASE @orderBy WHEN 'MinHrsHalfPresent DESC' THEN [ATN_PunchConfig].[MinHrsHalfPresent] END DESC,
     CASE @orderBy WHEN 'Active' THEN [ATN_PunchConfig].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [ATN_PunchConfig].[Active] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_PunchConfig].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_PunchConfig].[FinYear] END DESC,
     CASE @orderBy WHEN 'DataFileLocation' THEN [ATN_PunchConfig].[DataFileLocation] END,
     CASE @orderBy WHEN 'DataFileLocation DESC' THEN [ATN_PunchConfig].[DataFileLocation] END DESC 
  SET @RecordCount = @@RowCount
GO

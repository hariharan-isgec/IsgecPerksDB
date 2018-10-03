USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMannualCorrectionHistorySelectListSearch]
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
  SELECT [ATN_MannualCorrectionHistory].[SerialNo] FROM [ATN_MannualCorrectionHistory]
 WHERE  
   ( 
         STR(ISNULL([ATN_MannualCorrectionHistory].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_MannualCorrectionHistory].[AttenID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_MannualCorrectionHistory].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_MannualCorrectionHistory].[Punch1Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_MannualCorrectionHistory].[Punch2Time], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_MannualCorrectionHistory].[PunchStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_MannualCorrectionHistory].[MannuallyCorrectedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_MannualCorrectionHistory].[NewPunch1Time], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_MannualCorrectionHistory].[NewPunch2Time], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_MannualCorrectionHistory].[NewPunchStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_MannualCorrectionHistory].[Remarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SerialNo' THEN [ATN_MannualCorrectionHistory].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [ATN_MannualCorrectionHistory].[SerialNo] END DESC,
     CASE @orderBy WHEN 'AttenID' THEN [ATN_MannualCorrectionHistory].[AttenID] END,
     CASE @orderBy WHEN 'AttenID DESC' THEN [ATN_MannualCorrectionHistory].[AttenID] END DESC,
     CASE @orderBy WHEN 'AttenDate' THEN [ATN_MannualCorrectionHistory].[AttenDate] END,
     CASE @orderBy WHEN 'AttenDate DESC' THEN [ATN_MannualCorrectionHistory].[AttenDate] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_MannualCorrectionHistory].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_MannualCorrectionHistory].[CardNo] END DESC,
     CASE @orderBy WHEN 'Punch1Time' THEN [ATN_MannualCorrectionHistory].[Punch1Time] END,
     CASE @orderBy WHEN 'Punch1Time DESC' THEN [ATN_MannualCorrectionHistory].[Punch1Time] END DESC,
     CASE @orderBy WHEN 'Punch2Time' THEN [ATN_MannualCorrectionHistory].[Punch2Time] END,
     CASE @orderBy WHEN 'Punch2Time DESC' THEN [ATN_MannualCorrectionHistory].[Punch2Time] END DESC,
     CASE @orderBy WHEN 'PunchStatusID' THEN [ATN_MannualCorrectionHistory].[PunchStatusID] END,
     CASE @orderBy WHEN 'PunchStatusID DESC' THEN [ATN_MannualCorrectionHistory].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'MannuallyCorrectedOn' THEN [ATN_MannualCorrectionHistory].[MannuallyCorrectedOn] END,
     CASE @orderBy WHEN 'MannuallyCorrectedOn DESC' THEN [ATN_MannualCorrectionHistory].[MannuallyCorrectedOn] END DESC,
     CASE @orderBy WHEN 'MannuallyCorrectedBy' THEN [ATN_MannualCorrectionHistory].[MannuallyCorrectedBy] END,
     CASE @orderBy WHEN 'MannuallyCorrectedBy DESC' THEN [ATN_MannualCorrectionHistory].[MannuallyCorrectedBy] END DESC,
     CASE @orderBy WHEN 'NewPunch1Time' THEN [ATN_MannualCorrectionHistory].[NewPunch1Time] END,
     CASE @orderBy WHEN 'NewPunch1Time DESC' THEN [ATN_MannualCorrectionHistory].[NewPunch1Time] END DESC,
     CASE @orderBy WHEN 'NewPunch2Time' THEN [ATN_MannualCorrectionHistory].[NewPunch2Time] END,
     CASE @orderBy WHEN 'NewPunch2Time DESC' THEN [ATN_MannualCorrectionHistory].[NewPunch2Time] END DESC,
     CASE @orderBy WHEN 'NewPunchStatusID' THEN [ATN_MannualCorrectionHistory].[NewPunchStatusID] END,
     CASE @orderBy WHEN 'NewPunchStatusID DESC' THEN [ATN_MannualCorrectionHistory].[NewPunchStatusID] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ATN_MannualCorrectionHistory].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ATN_MannualCorrectionHistory].[Remarks] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_MannualCorrectionHistory].[SerialNo],
		[ATN_MannualCorrectionHistory].[AttenID],
		[ATN_MannualCorrectionHistory].[AttenDate],
		[ATN_MannualCorrectionHistory].[CardNo],
		[ATN_MannualCorrectionHistory].[Punch1Time],
		[ATN_MannualCorrectionHistory].[Punch2Time],
		[ATN_MannualCorrectionHistory].[PunchStatusID],
		[ATN_MannualCorrectionHistory].[MannuallyCorrectedOn],
		[ATN_MannualCorrectionHistory].[MannuallyCorrectedBy],
		[ATN_MannualCorrectionHistory].[NewPunch1Time],
		[ATN_MannualCorrectionHistory].[NewPunch2Time],
		[ATN_MannualCorrectionHistory].[NewPunchStatusID],
		[ATN_MannualCorrectionHistory].[Remarks] 
  FROM [ATN_MannualCorrectionHistory] 
    	INNER JOIN #PageIndex
          ON [ATN_MannualCorrectionHistory].[SerialNo] = #PageIndex.SerialNo
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

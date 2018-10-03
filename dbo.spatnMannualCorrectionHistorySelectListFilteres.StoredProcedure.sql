USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMannualCorrectionHistorySelectListFilteres]
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
               'SELECT [ATN_MannualCorrectionHistory].[SerialNo] FROM [ATN_MannualCorrectionHistory] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[ATN_MannualCorrectionHistory].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ATN_MannualCorrectionHistory].[SerialNo] DESC'
                        WHEN 'AttenID' THEN '[ATN_MannualCorrectionHistory].[AttenID]'
                        WHEN 'AttenID DESC' THEN '[ATN_MannualCorrectionHistory].[AttenID] DESC'
                        WHEN 'AttenDate' THEN '[ATN_MannualCorrectionHistory].[AttenDate]'
                        WHEN 'AttenDate DESC' THEN '[ATN_MannualCorrectionHistory].[AttenDate] DESC'
                        WHEN 'CardNo' THEN '[ATN_MannualCorrectionHistory].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_MannualCorrectionHistory].[CardNo] DESC'
                        WHEN 'Punch1Time' THEN '[ATN_MannualCorrectionHistory].[Punch1Time]'
                        WHEN 'Punch1Time DESC' THEN '[ATN_MannualCorrectionHistory].[Punch1Time] DESC'
                        WHEN 'Punch2Time' THEN '[ATN_MannualCorrectionHistory].[Punch2Time]'
                        WHEN 'Punch2Time DESC' THEN '[ATN_MannualCorrectionHistory].[Punch2Time] DESC'
                        WHEN 'PunchStatusID' THEN '[ATN_MannualCorrectionHistory].[PunchStatusID]'
                        WHEN 'PunchStatusID DESC' THEN '[ATN_MannualCorrectionHistory].[PunchStatusID] DESC'
                        WHEN 'MannuallyCorrectedOn' THEN '[ATN_MannualCorrectionHistory].[MannuallyCorrectedOn]'
                        WHEN 'MannuallyCorrectedOn DESC' THEN '[ATN_MannualCorrectionHistory].[MannuallyCorrectedOn] DESC'
                        WHEN 'MannuallyCorrectedBy' THEN '[ATN_MannualCorrectionHistory].[MannuallyCorrectedBy]'
                        WHEN 'MannuallyCorrectedBy DESC' THEN '[ATN_MannualCorrectionHistory].[MannuallyCorrectedBy] DESC'
                        WHEN 'NewPunch1Time' THEN '[ATN_MannualCorrectionHistory].[NewPunch1Time]'
                        WHEN 'NewPunch1Time DESC' THEN '[ATN_MannualCorrectionHistory].[NewPunch1Time] DESC'
                        WHEN 'NewPunch2Time' THEN '[ATN_MannualCorrectionHistory].[NewPunch2Time]'
                        WHEN 'NewPunch2Time DESC' THEN '[ATN_MannualCorrectionHistory].[NewPunch2Time] DESC'
                        WHEN 'NewPunchStatusID' THEN '[ATN_MannualCorrectionHistory].[NewPunchStatusID]'
                        WHEN 'NewPunchStatusID DESC' THEN '[ATN_MannualCorrectionHistory].[NewPunchStatusID] DESC'
                        WHEN 'Remarks' THEN '[ATN_MannualCorrectionHistory].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ATN_MannualCorrectionHistory].[Remarks] DESC'
                        ELSE '[ATN_MannualCorrectionHistory].[SerialNo]'
                    END
  EXEC (@LGSQL)

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

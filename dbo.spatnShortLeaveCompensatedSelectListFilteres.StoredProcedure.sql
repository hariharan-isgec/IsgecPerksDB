USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnShortLeaveCompensatedSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,AttenID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'AttenID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATNv_ShortLeaveCompensated].[AttenID]'
  SET @LGSQL = @LGSQL + ' FROM [ATNv_ShortLeaveCompensated] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AttenID' THEN '[ATNv_ShortLeaveCompensated].[AttenID]'
                        WHEN 'AttenID DESC' THEN '[ATNv_ShortLeaveCompensated].[AttenID] DESC'
                        WHEN 'CardNo' THEN '[ATNv_ShortLeaveCompensated].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATNv_ShortLeaveCompensated].[CardNo] DESC'
                        WHEN 'AttenDate' THEN '[ATNv_ShortLeaveCompensated].[AttenDate]'
                        WHEN 'AttenDate DESC' THEN '[ATNv_ShortLeaveCompensated].[AttenDate] DESC'
                        WHEN 'Punch1Time' THEN '[ATNv_ShortLeaveCompensated].[Punch1Time]'
                        WHEN 'Punch1Time DESC' THEN '[ATNv_ShortLeaveCompensated].[Punch1Time] DESC'
                        WHEN 'Punch2Time' THEN '[ATNv_ShortLeaveCompensated].[Punch2Time]'
                        WHEN 'Punch2Time DESC' THEN '[ATNv_ShortLeaveCompensated].[Punch2Time] DESC'
                        WHEN 'p1t' THEN '[ATNv_ShortLeaveCompensated].[p1t]'
                        WHEN 'p1t DESC' THEN '[ATNv_ShortLeaveCompensated].[p1t] DESC'
                        WHEN 'p2t' THEN '[ATNv_ShortLeaveCompensated].[p2t]'
                        WHEN 'p2t DESC' THEN '[ATNv_ShortLeaveCompensated].[p2t] DESC'
                        WHEN 'difmin' THEN '[ATNv_ShortLeaveCompensated].[difmin]'
                        WHEN 'difmin DESC' THEN '[ATNv_ShortLeaveCompensated].[difmin] DESC'
                        ELSE '[ATNv_ShortLeaveCompensated].[AttenID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATNv_ShortLeaveCompensated].[AttenID] ,
		[ATNv_ShortLeaveCompensated].[CardNo] ,
		[ATNv_ShortLeaveCompensated].[AttenDate] ,
		[ATNv_ShortLeaveCompensated].[Punch1Time] ,
		[ATNv_ShortLeaveCompensated].[Punch2Time] ,
		[ATNv_ShortLeaveCompensated].[p1t] ,
		[ATNv_ShortLeaveCompensated].[p2t] ,
		[ATNv_ShortLeaveCompensated].[difmin]  
  FROM [ATNv_ShortLeaveCompensated] 
    	INNER JOIN #PageIndex
          ON [ATNv_ShortLeaveCompensated].[AttenID] = #PageIndex.AttenID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

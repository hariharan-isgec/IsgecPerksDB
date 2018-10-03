USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnShortLeaveAvailedSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[ATNv_ShortLeaveAvailed].[AttenID]'
  SET @LGSQL = @LGSQL + ' FROM [ATNv_ShortLeaveAvailed] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AttenID' THEN '[ATNv_ShortLeaveAvailed].[AttenID]'
                        WHEN 'AttenID DESC' THEN '[ATNv_ShortLeaveAvailed].[AttenID] DESC'
                        WHEN 'AttenDate' THEN '[ATNv_ShortLeaveAvailed].[AttenDate]'
                        WHEN 'AttenDate DESC' THEN '[ATNv_ShortLeaveAvailed].[AttenDate] DESC'
                        WHEN 'CardNo' THEN '[ATNv_ShortLeaveAvailed].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATNv_ShortLeaveAvailed].[CardNo] DESC'
                        WHEN 'Punch1Time' THEN '[ATNv_ShortLeaveAvailed].[Punch1Time]'
                        WHEN 'Punch1Time DESC' THEN '[ATNv_ShortLeaveAvailed].[Punch1Time] DESC'
                        WHEN 'Punch2Time' THEN '[ATNv_ShortLeaveAvailed].[Punch2Time]'
                        WHEN 'Punch2Time DESC' THEN '[ATNv_ShortLeaveAvailed].[Punch2Time] DESC'
                        WHEN 'p1t' THEN '[ATNv_ShortLeaveAvailed].[p1t]'
                        WHEN 'p1t DESC' THEN '[ATNv_ShortLeaveAvailed].[p1t] DESC'
                        WHEN 'p2t' THEN '[ATNv_ShortLeaveAvailed].[p2t]'
                        WHEN 'p2t DESC' THEN '[ATNv_ShortLeaveAvailed].[p2t] DESC'
                        WHEN 'difmin' THEN '[ATNv_ShortLeaveAvailed].[difmin]'
                        WHEN 'difmin DESC' THEN '[ATNv_ShortLeaveAvailed].[difmin] DESC'
                        WHEN 'EmployeeName' THEN '[ATNv_ShortLeaveAvailed].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[ATNv_ShortLeaveAvailed].[EmployeeName] DESC'
                        WHEN 'Designation' THEN '[ATNv_ShortLeaveAvailed].[Designation]'
                        WHEN 'Designation DESC' THEN '[ATNv_ShortLeaveAvailed].[Designation] DESC'
                        WHEN 'Department' THEN '[ATNv_ShortLeaveAvailed].[Department]'
                        WHEN 'Department DESC' THEN '[ATNv_ShortLeaveAvailed].[Department] DESC'
                        WHEN 'Division' THEN '[ATNv_ShortLeaveAvailed].[Division]'
                        WHEN 'Division DESC' THEN '[ATNv_ShortLeaveAvailed].[Division] DESC'
                        WHEN 'Location' THEN '[ATNv_ShortLeaveAvailed].[Location]'
                        WHEN 'Location DESC' THEN '[ATNv_ShortLeaveAvailed].[Location] DESC'
                        ELSE '[ATNv_ShortLeaveAvailed].[AttenID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATNv_ShortLeaveAvailed].[AttenID] ,
		[ATNv_ShortLeaveAvailed].[AttenDate] ,
		[ATNv_ShortLeaveAvailed].[CardNo] ,
		[ATNv_ShortLeaveAvailed].[Punch1Time] ,
		[ATNv_ShortLeaveAvailed].[Punch2Time] ,
		[ATNv_ShortLeaveAvailed].[p1t] ,
		[ATNv_ShortLeaveAvailed].[p2t] ,
		[ATNv_ShortLeaveAvailed].[difmin] ,
		[ATNv_ShortLeaveAvailed].[EmployeeName] ,
		[ATNv_ShortLeaveAvailed].[Designation] ,
		[ATNv_ShortLeaveAvailed].[Department] ,
		[ATNv_ShortLeaveAvailed].[Division] ,
		[ATNv_ShortLeaveAvailed].[Location]  
  FROM [ATNv_ShortLeaveAvailed] 
    	INNER JOIN #PageIndex
          ON [ATNv_ShortLeaveAvailed].[AttenID] = #PageIndex.AttenID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

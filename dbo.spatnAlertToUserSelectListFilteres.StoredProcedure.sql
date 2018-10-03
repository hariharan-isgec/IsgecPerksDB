USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAlertToUserSelectListFilteres]
  @Filter_AttenMonth Int,
  @Filter_OfficeID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
 ,AttenMonth Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CardNo'  
  SET @LGSQL = @LGSQL + ', FinYear'  
  SET @LGSQL = @LGSQL + ', AttenMonth'  
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATNv_PendingRegularization].[CardNo]'  
  SET @LGSQL = @LGSQL + ', [ATNv_PendingRegularization].[FinYear]'  
  SET @LGSQL = @LGSQL + ', [ATNv_PendingRegularization].[AttenMonth]'  
  SET @LGSQL = @LGSQL + ' FROM [ATNv_PendingRegularization] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_Months] AS [ATN_Months1]'
  SET @LGSQL = @LGSQL + '    ON [ATNv_PendingRegularization].[AttenMonth] = [ATN_Months1].[MonthID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_AttenMonth > 0) 
    SET @LGSQL = @LGSQL + ' AND [ATNv_PendingRegularization].[AttenMonth] = ' + STR(@Filter_AttenMonth)
  IF (@Filter_OfficeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ATNv_PendingRegularization].[OfficeID] = ' + STR(@Filter_OfficeID)
  SET @LGSQL = @LGSQL + ' AND [ATNv_PendingRegularization].[FinYear] = ' + @FinYear 
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[ATNv_PendingRegularization].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATNv_PendingRegularization].[CardNo] DESC'
                        WHEN 'AttenMonth' THEN '[ATNv_PendingRegularization].[AttenMonth]'
                        WHEN 'AttenMonth DESC' THEN '[ATNv_PendingRegularization].[AttenMonth] DESC'
                        WHEN 'EmployeeName' THEN '[ATNv_PendingRegularization].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[ATNv_PendingRegularization].[EmployeeName] DESC'
                        WHEN 'SFinalValue' THEN '[ATNv_PendingRegularization].[SFinalValue]'
                        WHEN 'SFinalValue DESC' THEN '[ATNv_PendingRegularization].[SFinalValue] DESC'
                        WHEN 'Designation_Description' THEN '[ATNv_PendingRegularization].[Designation_Description]'
                        WHEN 'Designation_Description DESC' THEN '[ATNv_PendingRegularization].[Designation_Description] DESC'
                        WHEN 'Department_Description' THEN '[ATNv_PendingRegularization].[Department_Description]'
                        WHEN 'Department_Description DESC' THEN '[ATNv_PendingRegularization].[Department_Description] DESC'
                        WHEN 'Office_Description' THEN '[ATNv_PendingRegularization].[Office_Description]'
                        WHEN 'Office_Description DESC' THEN '[ATNv_PendingRegularization].[Office_Description] DESC'
                        WHEN 'FinYear' THEN '[ATNv_PendingRegularization].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATNv_PendingRegularization].[FinYear] DESC'
                        WHEN 'EMailID' THEN '[ATNv_PendingRegularization].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[ATNv_PendingRegularization].[EMailID] DESC'
                        WHEN 'ATN_Months1_MonthID' THEN '[ATN_Months1].[MonthID]'
                        WHEN 'ATN_Months1_MonthID DESC' THEN '[ATN_Months1].[MonthID] DESC'
                        WHEN 'ATN_Months1_Description' THEN '[ATN_Months1].[Description]'
                        WHEN 'ATN_Months1_Description DESC' THEN '[ATN_Months1].[Description] DESC'
                        WHEN 'ATN_Months1_ShortName' THEN '[ATN_Months1].[ShortName]'
                        WHEN 'ATN_Months1_ShortName DESC' THEN '[ATN_Months1].[ShortName] DESC'
                        ELSE '[ATNv_PendingRegularization].[CardNo],[ATNv_PendingRegularization].[AttenMonth]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATNv_PendingRegularization].[CardNo],
		[ATNv_PendingRegularization].[AttenMonth],
		[ATNv_PendingRegularization].[EmployeeName],
		[ATNv_PendingRegularization].[SFinalValue],
		[ATNv_PendingRegularization].[Designation_Description],
		[ATNv_PendingRegularization].[Department_Description],
		[ATNv_PendingRegularization].[Office_Description],
		[ATNv_PendingRegularization].[FinYear],
		[ATNv_PendingRegularization].[EMailID],
		[ATN_Months1].[MonthID] AS ATN_Months1_MonthID,
		[ATN_Months1].[Description] AS ATN_Months1_Description,
		[ATN_Months1].[ShortName] AS ATN_Months1_ShortName 
  FROM [ATNv_PendingRegularization] 
    	INNER JOIN #PageIndex
          ON [ATNv_PendingRegularization].[CardNo] = #PageIndex.CardNo
          AND [ATNv_PendingRegularization].[FinYear] = #PageIndex.FinYear 
          AND [ATNv_PendingRegularization].[AttenMonth] = #PageIndex.AttenMonth
  LEFT OUTER JOIN [ATN_Months] AS [ATN_Months1]
    ON [ATNv_PendingRegularization].[AttenMonth] = [ATN_Months1].[MonthID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

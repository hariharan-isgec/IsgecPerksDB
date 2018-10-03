USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAlertToUserSelectListSearch]
  @Filter_AttenMonth Int,
  @Filter_OfficeID Int,
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
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
 ,AttenMonth Int NOT NULL
  )
  INSERT INTO #PageIndex (CardNo, AttenMonth)
  SELECT [ATNv_PendingRegularization].[CardNo], [ATNv_PendingRegularization].[AttenMonth] FROM [ATNv_PendingRegularization]
  LEFT OUTER JOIN [ATN_Months] AS [ATN_Months1]
    ON [ATNv_PendingRegularization].[AttenMonth] = [ATN_Months1].[MonthID]
 WHERE  
      [ATNv_PendingRegularization].[FinYear] = @FinYear
   AND [ATNv_PendingRegularization].[AttenMonth] = case when @Filter_AttenMonth > 0 then @Filter_AttenMonth else [ATNv_PendingRegularization].[AttenMonth] end
   AND [ATNv_PendingRegularization].[OfficeID] = case when @Filter_OfficeID > 0 then @Filter_OfficeID else [ATNv_PendingRegularization].[OfficeID] end
   AND ( 
         LOWER(ISNULL([ATNv_PendingRegularization].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATNv_PendingRegularization].[AttenMonth], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_PendingRegularization].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATNv_PendingRegularization].[SFinalValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_PendingRegularization].[Designation_Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_PendingRegularization].[Department_Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_PendingRegularization].[Office_Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_PendingRegularization].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_PendingRegularization].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Months1].[MonthID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Months1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Months1].[ShortName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [ATNv_PendingRegularization].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATNv_PendingRegularization].[CardNo] END DESC,
     CASE @orderBy WHEN 'AttenMonth' THEN [ATNv_PendingRegularization].[AttenMonth] END,
     CASE @orderBy WHEN 'AttenMonth DESC' THEN [ATNv_PendingRegularization].[AttenMonth] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [ATNv_PendingRegularization].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [ATNv_PendingRegularization].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'SFinalValue' THEN [ATNv_PendingRegularization].[SFinalValue] END,
     CASE @orderBy WHEN 'SFinalValue DESC' THEN [ATNv_PendingRegularization].[SFinalValue] END DESC,
     CASE @orderBy WHEN 'Designation_Description' THEN [ATNv_PendingRegularization].[Designation_Description] END,
     CASE @orderBy WHEN 'Designation_Description DESC' THEN [ATNv_PendingRegularization].[Designation_Description] END DESC,
     CASE @orderBy WHEN 'Department_Description' THEN [ATNv_PendingRegularization].[Department_Description] END,
     CASE @orderBy WHEN 'Department_Description DESC' THEN [ATNv_PendingRegularization].[Department_Description] END DESC,
     CASE @orderBy WHEN 'Office_Description' THEN [ATNv_PendingRegularization].[Office_Description] END,
     CASE @orderBy WHEN 'Office_Description DESC' THEN [ATNv_PendingRegularization].[Office_Description] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATNv_PendingRegularization].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATNv_PendingRegularization].[FinYear] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [ATNv_PendingRegularization].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [ATNv_PendingRegularization].[EMailID] END DESC,
     CASE @orderBy WHEN 'ATN_Months1_MonthID' THEN [ATN_Months1].[MonthID] END,
     CASE @orderBy WHEN 'ATN_Months1_MonthID DESC' THEN [ATN_Months1].[MonthID] END DESC,
     CASE @orderBy WHEN 'ATN_Months1_Description' THEN [ATN_Months1].[Description] END,
     CASE @orderBy WHEN 'ATN_Months1_Description DESC' THEN [ATN_Months1].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_Months1_ShortName' THEN [ATN_Months1].[ShortName] END,
     CASE @orderBy WHEN 'ATN_Months1_ShortName DESC' THEN [ATN_Months1].[ShortName] END DESC 

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

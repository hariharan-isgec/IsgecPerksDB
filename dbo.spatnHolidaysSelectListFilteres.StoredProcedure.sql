USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnHolidaysSelectListFilteres]
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
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RecordID) ' + 
               'SELECT [ATN_Holidays].[RecordID] FROM [ATN_Holidays] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Holidays].[OfficeID] = [HRM_Offices1].[OfficeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Holidays].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_FinYear] AS [ATN_FinYear3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_Holidays].[FinYear] = [ATN_FinYear3].[FinYear]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_OfficeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ATN_Holidays].[OfficeID] = ' + STR(@Filter_OfficeID)
  SET @LGSQL = @LGSQL + ' AND [ATN_Holidays].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[ATN_Holidays].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[ATN_Holidays].[RecordID] DESC'
                        WHEN 'Holiday' THEN '[ATN_Holidays].[Holiday]'
                        WHEN 'Holiday DESC' THEN '[ATN_Holidays].[Holiday] DESC'
                        WHEN 'OfficeID' THEN '[ATN_Holidays].[OfficeID]'
                        WHEN 'OfficeID DESC' THEN '[ATN_Holidays].[OfficeID] DESC'
                        WHEN 'Description' THEN '[ATN_Holidays].[Description]'
                        WHEN 'Description DESC' THEN '[ATN_Holidays].[Description] DESC'
                        WHEN 'PunchStatusID' THEN '[ATN_Holidays].[PunchStatusID]'
                        WHEN 'PunchStatusID DESC' THEN '[ATN_Holidays].[PunchStatusID] DESC'
                        WHEN 'FinYear' THEN '[ATN_Holidays].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_Holidays].[FinYear] DESC'
                        WHEN 'HRM_Offices1_OfficeID' THEN '[HRM_Offices1].[OfficeID]'
                        WHEN 'HRM_Offices1_OfficeID DESC' THEN '[HRM_Offices1].[OfficeID] DESC'
                        WHEN 'HRM_Offices1_Description' THEN '[HRM_Offices1].[Description]'
                        WHEN 'HRM_Offices1_Description DESC' THEN '[HRM_Offices1].[Description] DESC'
                        WHEN 'HRM_Offices1_Address' THEN '[HRM_Offices1].[Address]'
                        WHEN 'HRM_Offices1_Address DESC' THEN '[HRM_Offices1].[Address] DESC'
                        WHEN 'HRM_Offices1_City' THEN '[HRM_Offices1].[City]'
                        WHEN 'HRM_Offices1_City DESC' THEN '[HRM_Offices1].[City] DESC'
                        WHEN 'ATN_PunchStatus2_PunchStatusID' THEN '[ATN_PunchStatus2].[PunchStatusID]'
                        WHEN 'ATN_PunchStatus2_PunchStatusID DESC' THEN '[ATN_PunchStatus2].[PunchStatusID] DESC'
                        WHEN 'ATN_PunchStatus2_Description' THEN '[ATN_PunchStatus2].[Description]'
                        WHEN 'ATN_PunchStatus2_Description DESC' THEN '[ATN_PunchStatus2].[Description] DESC'
                        WHEN 'ATN_PunchStatus2_PunchValue' THEN '[ATN_PunchStatus2].[PunchValue]'
                        WHEN 'ATN_PunchStatus2_PunchValue DESC' THEN '[ATN_PunchStatus2].[PunchValue] DESC'
                        WHEN 'ATN_FinYear3_FinYear' THEN '[ATN_FinYear3].[FinYear]'
                        WHEN 'ATN_FinYear3_FinYear DESC' THEN '[ATN_FinYear3].[FinYear] DESC'
                        WHEN 'ATN_FinYear3_Description' THEN '[ATN_FinYear3].[Description]'
                        WHEN 'ATN_FinYear3_Description DESC' THEN '[ATN_FinYear3].[Description] DESC'
                        WHEN 'ATN_FinYear3_StartDate' THEN '[ATN_FinYear3].[StartDate]'
                        WHEN 'ATN_FinYear3_StartDate DESC' THEN '[ATN_FinYear3].[StartDate] DESC'
                        WHEN 'ATN_FinYear3_EndDate' THEN '[ATN_FinYear3].[EndDate]'
                        WHEN 'ATN_FinYear3_EndDate DESC' THEN '[ATN_FinYear3].[EndDate] DESC'
                        WHEN 'ATN_FinYear3_Active' THEN '[ATN_FinYear3].[Active]'
                        WHEN 'ATN_FinYear3_Active DESC' THEN '[ATN_FinYear3].[Active] DESC'
                        ELSE '[ATN_Holidays].[Holiday]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_Holidays].[RecordID],
		[ATN_Holidays].[Holiday],
		[ATN_Holidays].[OfficeID],
		[ATN_Holidays].[Description],
		[ATN_Holidays].[PunchStatusID],
		[ATN_Holidays].[FinYear],
		[HRM_Offices1].[OfficeID] AS HRM_Offices1_OfficeID,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description,
		[HRM_Offices1].[Address] AS HRM_Offices1_Address,
		[HRM_Offices1].[City] AS HRM_Offices1_City,
		[ATN_PunchStatus2].[PunchStatusID] AS ATN_PunchStatus2_PunchStatusID,
		[ATN_PunchStatus2].[Description] AS ATN_PunchStatus2_Description,
		[ATN_PunchStatus2].[PunchValue] AS ATN_PunchStatus2_PunchValue,
		[ATN_FinYear3].[FinYear] AS ATN_FinYear3_FinYear,
		[ATN_FinYear3].[Description] AS ATN_FinYear3_Description,
		[ATN_FinYear3].[StartDate] AS ATN_FinYear3_StartDate,
		[ATN_FinYear3].[EndDate] AS ATN_FinYear3_EndDate,
		[ATN_FinYear3].[Active] AS ATN_FinYear3_Active 
  FROM [ATN_Holidays] 
    	INNER JOIN #PageIndex
          ON [ATN_Holidays].[RecordID] = #PageIndex.RecordID
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [ATN_Holidays].[OfficeID] = [HRM_Offices1].[OfficeID]
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Holidays].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear3]
    ON [ATN_Holidays].[FinYear] = [ATN_FinYear3].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

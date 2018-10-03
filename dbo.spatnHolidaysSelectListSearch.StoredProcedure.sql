USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnHolidaysSelectListSearch]
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
  RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [ATN_Holidays].[RecordID] FROM [ATN_Holidays]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [ATN_Holidays].[OfficeID] = [HRM_Offices1].[OfficeID]
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Holidays].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear3]
    ON [ATN_Holidays].[FinYear] = [ATN_FinYear3].[FinYear]
 WHERE  
      [ATN_Holidays].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([ATN_Holidays].[RecordID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Holidays].[OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Holidays].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Holidays].[PunchStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Holidays].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices1].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices1].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchStatus2].[PunchStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchStatus2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchStatus2].[PunchValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_FinYear3].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_FinYear3].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [ATN_Holidays].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [ATN_Holidays].[RecordID] END DESC,
     CASE @orderBy WHEN 'Holiday' THEN [ATN_Holidays].[Holiday] END,
     CASE @orderBy WHEN 'Holiday DESC' THEN [ATN_Holidays].[Holiday] END DESC,
     CASE @orderBy WHEN 'OfficeID' THEN [ATN_Holidays].[OfficeID] END,
     CASE @orderBy WHEN 'OfficeID DESC' THEN [ATN_Holidays].[OfficeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_Holidays].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_Holidays].[Description] END DESC,
     CASE @orderBy WHEN 'PunchStatusID' THEN [ATN_Holidays].[PunchStatusID] END,
     CASE @orderBy WHEN 'PunchStatusID DESC' THEN [ATN_Holidays].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_Holidays].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_Holidays].[FinYear] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_OfficeID' THEN [HRM_Offices1].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices1_OfficeID DESC' THEN [HRM_Offices1].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_Description' THEN [HRM_Offices1].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices1_Description DESC' THEN [HRM_Offices1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_Address' THEN [HRM_Offices1].[Address] END,
     CASE @orderBy WHEN 'HRM_Offices1_Address DESC' THEN [HRM_Offices1].[Address] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_City' THEN [HRM_Offices1].[City] END,
     CASE @orderBy WHEN 'HRM_Offices1_City DESC' THEN [HRM_Offices1].[City] END DESC,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchStatusID' THEN [ATN_PunchStatus2].[PunchStatusID] END,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchStatusID DESC' THEN [ATN_PunchStatus2].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'ATN_PunchStatus2_Description' THEN [ATN_PunchStatus2].[Description] END,
     CASE @orderBy WHEN 'ATN_PunchStatus2_Description DESC' THEN [ATN_PunchStatus2].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchValue' THEN [ATN_PunchStatus2].[PunchValue] END,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchValue DESC' THEN [ATN_PunchStatus2].[PunchValue] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear3_FinYear' THEN [ATN_FinYear3].[FinYear] END,
     CASE @orderBy WHEN 'ATN_FinYear3_FinYear DESC' THEN [ATN_FinYear3].[FinYear] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear3_Description' THEN [ATN_FinYear3].[Description] END,
     CASE @orderBy WHEN 'ATN_FinYear3_Description DESC' THEN [ATN_FinYear3].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear3_StartDate' THEN [ATN_FinYear3].[StartDate] END,
     CASE @orderBy WHEN 'ATN_FinYear3_StartDate DESC' THEN [ATN_FinYear3].[StartDate] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear3_EndDate' THEN [ATN_FinYear3].[EndDate] END,
     CASE @orderBy WHEN 'ATN_FinYear3_EndDate DESC' THEN [ATN_FinYear3].[EndDate] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear3_Active' THEN [ATN_FinYear3].[Active] END,
     CASE @orderBy WHEN 'ATN_FinYear3_Active DESC' THEN [ATN_FinYear3].[Active] END DESC 

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

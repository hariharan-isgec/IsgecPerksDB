USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtAttendanceSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @Filter_DataMonth Int,
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @ProjectID NVarChar(6),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,RecordID NVarChar(15) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RecordID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATNv_SiteAttendance].[RecordID]'  
  SET @LGSQL = @LGSQL + ' FROM [ATNv_SiteAttendance] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATNv_SiteAttendance].[CardNo] = ''' + @Filter_CardNo + ''''
  IF (@Filter_DataMonth > 0) 
    SET @LGSQL = @LGSQL + ' AND [ATNv_SiteAttendance].[DataMonth] = ' + STR(@Filter_DataMonth)
  SET @LGSQL = @LGSQL + ' AND [ATNv_SiteAttendance].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + ' AND [ATNv_SiteAttendance].[C_ProjectSiteID] = ''' + @ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UnVerified' THEN '[ATNv_SiteAttendance].[UnVerified]'
                        WHEN 'UnVerified DESC' THEN '[ATNv_SiteAttendance].[UnVerified] DESC'
                        WHEN 'CardNo' THEN '[ATNv_SiteAttendance].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATNv_SiteAttendance].[CardNo] DESC'
                        WHEN 'DataMonth' THEN '[ATNv_SiteAttendance].[DataMonth]'
                        WHEN 'DataMonth DESC' THEN '[ATNv_SiteAttendance].[DataMonth] DESC'
                        WHEN 'FinYear' THEN '[ATNv_SiteAttendance].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATNv_SiteAttendance].[FinYear] DESC'
                        WHEN 'D1' THEN '[ATNv_SiteAttendance].[D1]'
                        WHEN 'D1 DESC' THEN '[ATNv_SiteAttendance].[D1] DESC'
                        WHEN 'D2' THEN '[ATNv_SiteAttendance].[D2]'
                        WHEN 'D2 DESC' THEN '[ATNv_SiteAttendance].[D2] DESC'
                        WHEN 'D3' THEN '[ATNv_SiteAttendance].[D3]'
                        WHEN 'D3 DESC' THEN '[ATNv_SiteAttendance].[D3] DESC'
                        WHEN 'D4' THEN '[ATNv_SiteAttendance].[D4]'
                        WHEN 'D4 DESC' THEN '[ATNv_SiteAttendance].[D4] DESC'
                        WHEN 'D5' THEN '[ATNv_SiteAttendance].[D5]'
                        WHEN 'D5 DESC' THEN '[ATNv_SiteAttendance].[D5] DESC'
                        WHEN 'D6' THEN '[ATNv_SiteAttendance].[D6]'
                        WHEN 'D6 DESC' THEN '[ATNv_SiteAttendance].[D6] DESC'
                        WHEN 'D7' THEN '[ATNv_SiteAttendance].[D7]'
                        WHEN 'D7 DESC' THEN '[ATNv_SiteAttendance].[D7] DESC'
                        WHEN 'D8' THEN '[ATNv_SiteAttendance].[D8]'
                        WHEN 'D8 DESC' THEN '[ATNv_SiteAttendance].[D8] DESC'
                        WHEN 'D9' THEN '[ATNv_SiteAttendance].[D9]'
                        WHEN 'D9 DESC' THEN '[ATNv_SiteAttendance].[D9] DESC'
                        WHEN 'D10' THEN '[ATNv_SiteAttendance].[D10]'
                        WHEN 'D10 DESC' THEN '[ATNv_SiteAttendance].[D10] DESC'
                        WHEN 'D11' THEN '[ATNv_SiteAttendance].[D11]'
                        WHEN 'D11 DESC' THEN '[ATNv_SiteAttendance].[D11] DESC'
                        WHEN 'D12' THEN '[ATNv_SiteAttendance].[D12]'
                        WHEN 'D12 DESC' THEN '[ATNv_SiteAttendance].[D12] DESC'
                        WHEN 'D13' THEN '[ATNv_SiteAttendance].[D13]'
                        WHEN 'D13 DESC' THEN '[ATNv_SiteAttendance].[D13] DESC'
                        WHEN 'D14' THEN '[ATNv_SiteAttendance].[D14]'
                        WHEN 'D14 DESC' THEN '[ATNv_SiteAttendance].[D14] DESC'
                        WHEN 'D15' THEN '[ATNv_SiteAttendance].[D15]'
                        WHEN 'D15 DESC' THEN '[ATNv_SiteAttendance].[D15] DESC'
                        WHEN 'D16' THEN '[ATNv_SiteAttendance].[D16]'
                        WHEN 'D16 DESC' THEN '[ATNv_SiteAttendance].[D16] DESC'
                        WHEN 'D17' THEN '[ATNv_SiteAttendance].[D17]'
                        WHEN 'D17 DESC' THEN '[ATNv_SiteAttendance].[D17] DESC'
                        WHEN 'D18' THEN '[ATNv_SiteAttendance].[D18]'
                        WHEN 'D18 DESC' THEN '[ATNv_SiteAttendance].[D18] DESC'
                        WHEN 'D19' THEN '[ATNv_SiteAttendance].[D19]'
                        WHEN 'D19 DESC' THEN '[ATNv_SiteAttendance].[D19] DESC'
                        WHEN 'D20' THEN '[ATNv_SiteAttendance].[D20]'
                        WHEN 'D20 DESC' THEN '[ATNv_SiteAttendance].[D20] DESC'
                        WHEN 'D21' THEN '[ATNv_SiteAttendance].[D21]'
                        WHEN 'D21 DESC' THEN '[ATNv_SiteAttendance].[D21] DESC'
                        WHEN 'D22' THEN '[ATNv_SiteAttendance].[D22]'
                        WHEN 'D22 DESC' THEN '[ATNv_SiteAttendance].[D22] DESC'
                        WHEN 'D23' THEN '[ATNv_SiteAttendance].[D23]'
                        WHEN 'D23 DESC' THEN '[ATNv_SiteAttendance].[D23] DESC'
                        WHEN 'D24' THEN '[ATNv_SiteAttendance].[D24]'
                        WHEN 'D24 DESC' THEN '[ATNv_SiteAttendance].[D24] DESC'
                        WHEN 'D25' THEN '[ATNv_SiteAttendance].[D25]'
                        WHEN 'D25 DESC' THEN '[ATNv_SiteAttendance].[D25] DESC'
                        WHEN 'D26' THEN '[ATNv_SiteAttendance].[D26]'
                        WHEN 'D26 DESC' THEN '[ATNv_SiteAttendance].[D26] DESC'
                        WHEN 'D27' THEN '[ATNv_SiteAttendance].[D27]'
                        WHEN 'D27 DESC' THEN '[ATNv_SiteAttendance].[D27] DESC'
                        WHEN 'D28' THEN '[ATNv_SiteAttendance].[D28]'
                        WHEN 'D28 DESC' THEN '[ATNv_SiteAttendance].[D28] DESC'
                        WHEN 'D29' THEN '[ATNv_SiteAttendance].[D29]'
                        WHEN 'D29 DESC' THEN '[ATNv_SiteAttendance].[D29] DESC'
                        WHEN 'D30' THEN '[ATNv_SiteAttendance].[D30]'
                        WHEN 'D30 DESC' THEN '[ATNv_SiteAttendance].[D30] DESC'
                        WHEN 'D31' THEN '[ATNv_SiteAttendance].[D31]'
                        WHEN 'D31 DESC' THEN '[ATNv_SiteAttendance].[D31] DESC'
                        WHEN 'C_ProjectSiteID' THEN '[ATNv_SiteAttendance].[C_ProjectSiteID]'
                        WHEN 'C_ProjectSiteID DESC' THEN '[ATNv_SiteAttendance].[C_ProjectSiteID] DESC'
                        WHEN 'HRM_Employees3_CardNo' THEN '[HRM_Employees3].[CardNo]'
                        WHEN 'HRM_Employees3_CardNo DESC' THEN '[HRM_Employees3].[CardNo] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        WHEN 'IDM_Projects1_ProjectID' THEN '[IDM_Projects1].[ProjectID]'
                        WHEN 'IDM_Projects1_ProjectID DESC' THEN '[IDM_Projects1].[ProjectID] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        ELSE '[ATNv_SiteAttendance].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IJT_Attendance].[RecordID],
		[IJT_Attendance].[CardNo],
		[IJT_Attendance].[DataMonth],
		[IJT_Attendance].[FinYear],
		[IJT_Attendance].[C_ProjectSiteID],
		[IJT_Attendance].[UnVerified],
		[IJT_Attendance].[UnVerifiedCount],
		[IJT_Attendance].[D1],
		[IJT_Attendance].[D2],
		[IJT_Attendance].[D3],
		[IJT_Attendance].[D4],
		[IJT_Attendance].[D5],
		[IJT_Attendance].[D6],
		[IJT_Attendance].[D7],
		[IJT_Attendance].[D8],
		[IJT_Attendance].[D9],
		[IJT_Attendance].[D10],
		[IJT_Attendance].[D11],
		[IJT_Attendance].[D12],
		[IJT_Attendance].[D13],
		[IJT_Attendance].[D14],
		[IJT_Attendance].[D15],
		[IJT_Attendance].[D16],
		[IJT_Attendance].[D17],
		[IJT_Attendance].[D18],
		[IJT_Attendance].[D19],
		[IJT_Attendance].[D20],
		[IJT_Attendance].[D21],
		[IJT_Attendance].[D22],
		[IJT_Attendance].[D23],
		[IJT_Attendance].[D24],
		[IJT_Attendance].[D25],
		[IJT_Attendance].[D26],
		[IJT_Attendance].[D27],
		[IJT_Attendance].[D28],
		[IJT_Attendance].[D29],
		[IJT_Attendance].[D30],
		[IJT_Attendance].[D31],
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[IDM_Projects1].[ProjectID] AS IDM_Projects1_ProjectID,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description 
  FROM [ATNv_SiteAttendance] AS [IJT_Attendance] 
    	INNER JOIN #PageIndex
          ON [IJT_Attendance].[RecordID] = #PageIndex.RecordID
  INNER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [IJT_Attendance].[CardNo] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [IJT_Attendance].[C_ProjectSiteID] = [IDM_Projects1].[ProjectID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

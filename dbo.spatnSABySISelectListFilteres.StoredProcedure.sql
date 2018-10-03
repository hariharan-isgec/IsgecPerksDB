USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySISelectListFilteres]
  @Filter_MonthID Int,
  @Filter_ProjectID NVarChar(6),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @VerifiedBy NVarChar(8),
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATN_SABySI].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [ATN_SABySI] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SABySI].[SAStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_FinYear] AS [ATN_FinYear2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SABySI].[FinYear] = [ATN_FinYear2].[FinYear]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_Months] AS [ATN_Months3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SABySI].[MonthID] = [ATN_Months3].[MonthID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SABySI].[VerifiedBy] = [HRM_Employees4].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects5]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SABySI].[ProjectID] = [IDM_Projects5].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@LoginID <> '0340') 
    SET @LGSQL = @LGSQL + ' AND [ATN_SABySI].[VerifiedBy] = (''' + @VerifiedBy + ''')'
  SET @LGSQL = @LGSQL + ' AND [ATN_SABySI].[FinYear] = (''' + @FinYear + ''')'
  IF (@Filter_MonthID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ATN_SABySI].[MonthID] = ' + STR(@Filter_MonthID)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_SABySI].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[ATN_SABySI].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ATN_SABySI].[SerialNo] DESC'
                        WHEN 'MonthID' THEN '[ATN_SABySI].[MonthID]'
                        WHEN 'MonthID DESC' THEN '[ATN_SABySI].[MonthID] DESC'
                        WHEN 'ProjectID' THEN '[ATN_SABySI].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[ATN_SABySI].[ProjectID] DESC'
                        WHEN 'SiteName' THEN '[ATN_SABySI].[SiteName]'
                        WHEN 'SiteName DESC' THEN '[ATN_SABySI].[SiteName] DESC'
                        WHEN 'Remarks' THEN '[ATN_SABySI].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ATN_SABySI].[Remarks] DESC'
                        WHEN 'SAStatusID' THEN '[ATN_SABySI].[SAStatusID]'
                        WHEN 'SAStatusID DESC' THEN '[ATN_SABySI].[SAStatusID] DESC'
                        WHEN 'VerifiedBy' THEN '[ATN_SABySI].[VerifiedBy]'
                        WHEN 'VerifiedBy DESC' THEN '[ATN_SABySI].[VerifiedBy] DESC'
                        WHEN 'FinYear' THEN '[ATN_SABySI].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_SABySI].[FinYear] DESC'
                        WHEN 'VerifiedOn' THEN '[ATN_SABySI].[VerifiedOn]'
                        WHEN 'VerifiedOn DESC' THEN '[ATN_SABySI].[VerifiedOn] DESC'
                        WHEN 'ATN_ApplicationStatus1_Description' THEN '[ATN_ApplicationStatus1].[Description]'
                        WHEN 'ATN_ApplicationStatus1_Description DESC' THEN '[ATN_ApplicationStatus1].[Description] DESC'
                        WHEN 'ATN_FinYear2_Description' THEN '[ATN_FinYear2].[Description]'
                        WHEN 'ATN_FinYear2_Description DESC' THEN '[ATN_FinYear2].[Description] DESC'
                        WHEN 'ATN_Months3_Description' THEN '[ATN_Months3].[Description]'
                        WHEN 'ATN_Months3_Description DESC' THEN '[ATN_Months3].[Description] DESC'
                        WHEN 'HRM_Employees4_EmployeeName' THEN '[HRM_Employees4].[EmployeeName]'
                        WHEN 'HRM_Employees4_EmployeeName DESC' THEN '[HRM_Employees4].[EmployeeName] DESC'
                        WHEN 'IDM_Projects5_Description' THEN '[IDM_Projects5].[Description]'
                        WHEN 'IDM_Projects5_Description DESC' THEN '[IDM_Projects5].[Description] DESC'
                        ELSE '[ATN_SABySI].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ATN_SABySI].* ,
    [ATN_ApplicationStatus1].[Description] AS ATN_ApplicationStatus1_Description,
    [ATN_FinYear2].[Description] AS ATN_FinYear2_Description,
    [ATN_Months3].[Description] AS ATN_Months3_Description,
    [HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
    [IDM_Projects5].[Description] AS IDM_Projects5_Description 
  FROM [ATN_SABySI] 
      INNER JOIN #PageIndex
          ON [ATN_SABySI].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]
    ON [ATN_SABySI].[SAStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]
  LEFT OUTER JOIN [ATN_FinYear] AS [ATN_FinYear2]
    ON [ATN_SABySI].[FinYear] = [ATN_FinYear2].[FinYear]
  LEFT OUTER JOIN [ATN_Months] AS [ATN_Months3]
    ON [ATN_SABySI].[MonthID] = [ATN_Months3].[MonthID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [ATN_SABySI].[VerifiedBy] = [HRM_Employees4].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects5]
    ON [ATN_SABySI].[ProjectID] = [IDM_Projects5].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

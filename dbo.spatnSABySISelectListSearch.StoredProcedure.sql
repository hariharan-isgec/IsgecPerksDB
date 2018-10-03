USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySISelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @VerifiedBy NVarChar(8),
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [ATN_SABySI].[SerialNo] FROM [ATN_SABySI]
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
      [ATN_SABySI].[VerifiedBy] = (@VerifiedBy)
  AND [ATN_SABySI].[FinYear] = (@FinYear)
   AND ( 
         STR(ISNULL([ATN_SABySI].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ATN_SABySI].[MonthID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySI].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySI].[SiteName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySI].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_SABySI].[SAStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySI].[VerifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySI].[FinYear],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [ATN_SABySI].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [ATN_SABySI].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'MonthID' THEN [ATN_SABySI].[MonthID] END,
     CASE @OrderBy WHEN 'MonthID DESC' THEN [ATN_SABySI].[MonthID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [ATN_SABySI].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [ATN_SABySI].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SiteName' THEN [ATN_SABySI].[SiteName] END,
     CASE @OrderBy WHEN 'SiteName DESC' THEN [ATN_SABySI].[SiteName] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [ATN_SABySI].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [ATN_SABySI].[Remarks] END DESC,
     CASE @OrderBy WHEN 'SAStatusID' THEN [ATN_SABySI].[SAStatusID] END,
     CASE @OrderBy WHEN 'SAStatusID DESC' THEN [ATN_SABySI].[SAStatusID] END DESC,
     CASE @OrderBy WHEN 'VerifiedBy' THEN [ATN_SABySI].[VerifiedBy] END,
     CASE @OrderBy WHEN 'VerifiedBy DESC' THEN [ATN_SABySI].[VerifiedBy] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [ATN_SABySI].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [ATN_SABySI].[FinYear] END DESC,
     CASE @OrderBy WHEN 'VerifiedOn' THEN [ATN_SABySI].[VerifiedOn] END,
     CASE @OrderBy WHEN 'VerifiedOn DESC' THEN [ATN_SABySI].[VerifiedOn] END DESC,
     CASE @OrderBy WHEN 'ATN_ApplicationStatus1_Description' THEN [ATN_ApplicationStatus1].[Description] END,
     CASE @OrderBy WHEN 'ATN_ApplicationStatus1_Description DESC' THEN [ATN_ApplicationStatus1].[Description] END DESC,
     CASE @OrderBy WHEN 'ATN_FinYear2_Description' THEN [ATN_FinYear2].[Description] END,
     CASE @OrderBy WHEN 'ATN_FinYear2_Description DESC' THEN [ATN_FinYear2].[Description] END DESC,
     CASE @OrderBy WHEN 'ATN_Months3_Description' THEN [ATN_Months3].[Description] END,
     CASE @OrderBy WHEN 'ATN_Months3_Description DESC' THEN [ATN_Months3].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees4_EmployeeName' THEN [HRM_Employees4].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees4_EmployeeName DESC' THEN [HRM_Employees4].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects5_Description' THEN [IDM_Projects5].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects5_Description DESC' THEN [IDM_Projects5].[Description] END DESC 

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

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sppms_LG_FormsR2HSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @LoginID NVarChar(8), 
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (FinYear, CardNo)
  SELECT [PMS_FormsH].[FinYear], [PMS_FormsH].[CardNo] FROM [PMS_FormsH]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_FormsH].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMS_FormsH].[ApprovedBy] = [HRM_Employees2].[CardNo]
    AND [PMS_FormsH].[CardNo] = [HRM_Employees2].[CardNo]
  INNER JOIN [PMS_Approvers] AS [PMS_Approvers3]
    ON [PMS_FormsH].[FinYear] = [PMS_Approvers3].[FinYear]
    AND [PMS_FormsH].[CardNo] = [PMS_Approvers3].[CardNo]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear4]
    ON [PMS_FormsH].[FinYear] = [PMS_FinYear4].[FinYear]
  INNER JOIN [PMS_FormStatus] AS [PMS_FormStatus5]
    ON [PMS_FormsH].[FormStatusID] = [PMS_FormStatus5].[FormStatusID]
 WHERE [PMS_FormsH].[CardNo] IN (SELECT CardNo FROM PMS_Approvers WHERE ReviewerII =  @LoginID  AND FinYear =  @FinYear  ) 
      AND [PMS_FormsH].[FinYear] = (@FinYear)
   AND ( 
         LOWER(ISNULL([PMS_FormsH].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FormsH].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FormsH].[FormStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FormsH].[ApprovedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [PMS_FormsH].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PMS_FormsH].[FinYear] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [PMS_FormsH].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [PMS_FormsH].[CardNo] END DESC,
     CASE @OrderBy WHEN 'FormStatusID' THEN [PMS_FormsH].[FormStatusID] END,
     CASE @OrderBy WHEN 'FormStatusID DESC' THEN [PMS_FormsH].[FormStatusID] END DESC,
     CASE @OrderBy WHEN 'SubmittedOn' THEN [PMS_FormsH].[SubmittedOn] END,
     CASE @OrderBy WHEN 'SubmittedOn DESC' THEN [PMS_FormsH].[SubmittedOn] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [PMS_FormsH].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [PMS_FormsH].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [PMS_FormsH].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [PMS_FormsH].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'SubmittedToHROn' THEN [PMS_FormsH].[SubmittedToHROn] END,
     CASE @OrderBy WHEN 'SubmittedToHROn DESC' THEN [PMS_FormsH].[SubmittedToHROn] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PMS_FinYear4_Description' THEN [PMS_FinYear4].[Description] END,
     CASE @OrderBy WHEN 'PMS_FinYear4_Description DESC' THEN [PMS_FinYear4].[Description] END DESC,
     CASE @OrderBy WHEN 'PMS_FormStatus5_Description' THEN [PMS_FormStatus5].[Description] END,
     CASE @OrderBy WHEN 'PMS_FormStatus5_Description DESC' THEN [PMS_FormStatus5].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMS_FormsH].[FinYear] ,
		[PMS_FormsH].[CardNo] ,
		[PMS_FormsH].[FormStatusID] ,
		[PMS_FormsH].[SubmittedOn] ,
		[PMS_FormsH].[ApprovedOn] ,
		[PMS_FormsH].[ApprovedBy] ,
		[PMS_FormsH].[SubmittedToHROn] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[PMS_FinYear4].[Description] AS PMS_FinYear4_Description,
		[PMS_FormStatus5].[Description] AS PMS_FormStatus5_Description 
  FROM [PMS_FormsH] 
    	INNER JOIN #PageIndex
          ON [PMS_FormsH].[FinYear] = #PageIndex.FinYear
          AND [PMS_FormsH].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_FormsH].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMS_FormsH].[ApprovedBy] = [HRM_Employees2].[CardNo]
    AND [PMS_FormsH].[CardNo] = [HRM_Employees2].[CardNo]
  INNER JOIN [PMS_Approvers] AS [PMS_Approvers3]
    ON [PMS_FormsH].[FinYear] = [PMS_Approvers3].[FinYear]
    AND [PMS_FormsH].[CardNo] = [PMS_Approvers3].[CardNo]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear4]
    ON [PMS_FormsH].[FinYear] = [PMS_FinYear4].[FinYear]
  INNER JOIN [PMS_FormStatus] AS [PMS_FormStatus5]
    ON [PMS_FormsH].[FormStatusID] = [PMS_FormStatus5].[FormStatusID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

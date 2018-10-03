USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsApproversSelectListSearch]
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (FinYear, CardNo)
  SELECT [PMS_Approvers].[FinYear], [PMS_Approvers].[CardNo] FROM [PMS_Approvers]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_Approvers].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMS_Approvers].[Apparaiser] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [PMS_Approvers].[ReviewerI] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [PMS_Approvers].[ReviewerII] = [HRM_Employees4].[CardNo]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear5]
    ON [PMS_Approvers].[FinYear] = [PMS_FinYear5].[FinYear]
 WHERE  
      [PMS_Approvers].[FinYear] = (@FinYear)
   AND ( 
         LOWER(ISNULL([PMS_Approvers].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_Approvers].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_Approvers].[Apparaiser],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_Approvers].[ReviewerI],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_Approvers].[ReviewerII],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [PMS_Approvers].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PMS_Approvers].[FinYear] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [PMS_Approvers].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [PMS_Approvers].[CardNo] END DESC,
     CASE @OrderBy WHEN 'Apparaiser' THEN [PMS_Approvers].[Apparaiser] END,
     CASE @OrderBy WHEN 'Apparaiser DESC' THEN [PMS_Approvers].[Apparaiser] END DESC,
     CASE @OrderBy WHEN 'ReviewerI' THEN [PMS_Approvers].[ReviewerI] END,
     CASE @OrderBy WHEN 'ReviewerI DESC' THEN [PMS_Approvers].[ReviewerI] END DESC,
     CASE @OrderBy WHEN 'ReviewerII' THEN [PMS_Approvers].[ReviewerII] END,
     CASE @OrderBy WHEN 'ReviewerII DESC' THEN [PMS_Approvers].[ReviewerII] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees4_EmployeeName' THEN [HRM_Employees4].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees4_EmployeeName DESC' THEN [HRM_Employees4].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PMS_FinYear5_Description' THEN [PMS_FinYear5].[Description] END,
     CASE @OrderBy WHEN 'PMS_FinYear5_Description DESC' THEN [PMS_FinYear5].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMS_Approvers].[FinYear] ,
		[PMS_Approvers].[CardNo] ,
		[PMS_Approvers].[Apparaiser] ,
		[PMS_Approvers].[ReviewerI] ,
		[PMS_Approvers].[ReviewerII] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
		[PMS_FinYear5].[Description] AS PMS_FinYear5_Description 
  FROM [PMS_Approvers] 
    	INNER JOIN #PageIndex
          ON [PMS_Approvers].[FinYear] = #PageIndex.FinYear
          AND [PMS_Approvers].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_Approvers].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMS_Approvers].[Apparaiser] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [PMS_Approvers].[ReviewerI] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [PMS_Approvers].[ReviewerII] = [HRM_Employees4].[CardNo]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear5]
    ON [PMS_Approvers].[FinYear] = [PMS_FinYear5].[FinYear]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

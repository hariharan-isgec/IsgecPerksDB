USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsUDSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @DetailTypeID NVarChar(6),
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
 ,SrNo Int NOT NULL
  )
  INSERT INTO #PageIndex (FinYear, CardNo, SrNo)
  SELECT [PMS_FormsD].[FinYear], [PMS_FormsD].[CardNo], [PMS_FormsD].[SrNo] FROM [PMS_FormsD]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_FormsD].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [PMS_DetailTypes] AS [PMS_DetailTypes2]
    ON [PMS_FormsD].[DetailTypeID] = [PMS_DetailTypes2].[DetailTypeID]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear3]
    ON [PMS_FormsD].[FinYear] = [PMS_FinYear3].[FinYear]
  INNER JOIN [PMS_FormsH] AS [PMS_FormsH4]
    ON [PMS_FormsD].[FinYear] = [PMS_FormsH4].[FinYear]
    AND [PMS_FormsD].[CardNo] = [PMS_FormsH4].[CardNo]
 WHERE  
      [PMS_FormsD].[FinYear] = (@FinYear)
  AND [PMS_FormsD].[CardNo] = (@CardNo)
  AND [PMS_FormsD].[DetailTypeID] = (@DetailTypeID)
   AND ( 
         LOWER(ISNULL([PMS_FormsD].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FormsD].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMS_FormsD].[SrNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FormsD].[KRA],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FormsD].[KPI],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FormsD].[Competancy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FormsD].[DetailTypeID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [PMS_FormsD].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PMS_FormsD].[FinYear] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [PMS_FormsD].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [PMS_FormsD].[CardNo] END DESC,
     CASE @OrderBy WHEN 'SrNo' THEN [PMS_FormsD].[SrNo] END,
     CASE @OrderBy WHEN 'SrNo DESC' THEN [PMS_FormsD].[SrNo] END DESC,
     CASE @OrderBy WHEN 'KRA' THEN [PMS_FormsD].[KRA] END,
     CASE @OrderBy WHEN 'KRA DESC' THEN [PMS_FormsD].[KRA] END DESC,
     CASE @OrderBy WHEN 'KPI' THEN [PMS_FormsD].[KPI] END,
     CASE @OrderBy WHEN 'KPI DESC' THEN [PMS_FormsD].[KPI] END DESC,
     CASE @OrderBy WHEN 'Competancy' THEN [PMS_FormsD].[Competancy] END,
     CASE @OrderBy WHEN 'Competancy DESC' THEN [PMS_FormsD].[Competancy] END DESC,
     CASE @OrderBy WHEN 'DetailTypeID' THEN [PMS_FormsD].[DetailTypeID] END,
     CASE @OrderBy WHEN 'DetailTypeID DESC' THEN [PMS_FormsD].[DetailTypeID] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PMS_DetailTypes2_Description' THEN [PMS_DetailTypes2].[Description] END,
     CASE @OrderBy WHEN 'PMS_DetailTypes2_Description DESC' THEN [PMS_DetailTypes2].[Description] END DESC,
     CASE @OrderBy WHEN 'PMS_FinYear3_Description' THEN [PMS_FinYear3].[Description] END,
     CASE @OrderBy WHEN 'PMS_FinYear3_Description DESC' THEN [PMS_FinYear3].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMS_FormsD].[FinYear] ,
		[PMS_FormsD].[CardNo] ,
		[PMS_FormsD].[SrNo] ,
		[PMS_FormsD].[KRA] ,
		[PMS_FormsD].[KPI] ,
		[PMS_FormsD].[Competancy] ,
		[PMS_FormsD].[DetailTypeID] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[PMS_DetailTypes2].[Description] AS PMS_DetailTypes2_Description,
		[PMS_FinYear3].[Description] AS PMS_FinYear3_Description 
  FROM [PMS_FormsD] 
    	INNER JOIN #PageIndex
          ON [PMS_FormsD].[FinYear] = #PageIndex.FinYear
          AND [PMS_FormsD].[CardNo] = #PageIndex.CardNo
          AND [PMS_FormsD].[SrNo] = #PageIndex.SrNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_FormsD].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [PMS_DetailTypes] AS [PMS_DetailTypes2]
    ON [PMS_FormsD].[DetailTypeID] = [PMS_DetailTypes2].[DetailTypeID]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear3]
    ON [PMS_FormsD].[FinYear] = [PMS_FinYear3].[FinYear]
  INNER JOIN [PMS_FormsH] AS [PMS_FormsH4]
    ON [PMS_FormsD].[FinYear] = [PMS_FormsH4].[FinYear]
    AND [PMS_FormsD].[CardNo] = [PMS_FormsH4].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupUsersSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,GroupID Int NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (GroupID, CardNo)
  SELECT [QCM_InspectorGroupUsers].[GroupID], [QCM_InspectorGroupUsers].[CardNo] FROM [QCM_InspectorGroupUsers]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_InspectorGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [QCM_InspectorGroups] AS [QCM_InspectorGroups2]
    ON [QCM_InspectorGroupUsers].[GroupID] = [QCM_InspectorGroups2].[GroupID]
 WHERE  
   ( 
         STR(ISNULL([QCM_InspectorGroupUsers].[GroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_InspectorGroupUsers].[CardNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [QCM_InspectorGroupUsers].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [QCM_InspectorGroupUsers].[GroupID] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [QCM_InspectorGroupUsers].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [QCM_InspectorGroupUsers].[CardNo] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'QCM_InspectorGroups2_Description' THEN [QCM_InspectorGroups2].[Description] END,
     CASE @OrderBy WHEN 'QCM_InspectorGroups2_Description DESC' THEN [QCM_InspectorGroups2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QCM_InspectorGroupUsers].[GroupID] ,
		[QCM_InspectorGroupUsers].[CardNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[QCM_InspectorGroups2].[Description] AS QCM_InspectorGroups2_Description 
  FROM [QCM_InspectorGroupUsers] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectorGroupUsers].[GroupID] = #PageIndex.GroupID
          AND [QCM_InspectorGroupUsers].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_InspectorGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [QCM_InspectorGroups] AS [QCM_InspectorGroups2]
    ON [QCM_InspectorGroupUsers].[GroupID] = [QCM_InspectorGroups2].[GroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

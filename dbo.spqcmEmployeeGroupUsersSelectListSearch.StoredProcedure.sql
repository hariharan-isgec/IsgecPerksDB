USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupUsersSelectListSearch]
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
 ,GroupiD Int NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (GroupiD, CardNo)
  SELECT [QCM_EmployeeGroupUsers].[GroupiD], [QCM_EmployeeGroupUsers].[CardNo] FROM [QCM_EmployeeGroupUsers]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_EmployeeGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [QCM_EmployeeGroups] AS [QCM_EmployeeGroups2]
    ON [QCM_EmployeeGroupUsers].[GroupiD] = [QCM_EmployeeGroups2].[GroupID]
 WHERE  
   ( 
         STR(ISNULL([QCM_EmployeeGroupUsers].[GroupiD], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_EmployeeGroupUsers].[CardNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GroupiD' THEN [QCM_EmployeeGroupUsers].[GroupiD] END,
     CASE @OrderBy WHEN 'GroupiD DESC' THEN [QCM_EmployeeGroupUsers].[GroupiD] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [QCM_EmployeeGroupUsers].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [QCM_EmployeeGroupUsers].[CardNo] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'QCM_EmployeeGroups2_Description' THEN [QCM_EmployeeGroups2].[Description] END,
     CASE @OrderBy WHEN 'QCM_EmployeeGroups2_Description DESC' THEN [QCM_EmployeeGroups2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QCM_EmployeeGroupUsers].[GroupiD] ,
		[QCM_EmployeeGroupUsers].[CardNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[QCM_EmployeeGroups2].[Description] AS QCM_EmployeeGroups2_Description 
  FROM [QCM_EmployeeGroupUsers] 
    	INNER JOIN #PageIndex
          ON [QCM_EmployeeGroupUsers].[GroupiD] = #PageIndex.GroupiD
          AND [QCM_EmployeeGroupUsers].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_EmployeeGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [QCM_EmployeeGroups] AS [QCM_EmployeeGroups2]
    ON [QCM_EmployeeGroupUsers].[GroupiD] = [QCM_EmployeeGroups2].[GroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

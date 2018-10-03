USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmEmployeeEMailGroupSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
 ,EMailGroup NVarChar(50) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo, EMailGroup)
  SELECT [HRM_EmployeeEMailGroup].[CardNo], [HRM_EmployeeEMailGroup].[EMailGroup] FROM [HRM_EmployeeEMailGroup]
  INNER JOIN [HRM_EMailGroups] AS [HRM_EMailGroups1]
    ON [HRM_EmployeeEMailGroup].[EMailGroup] = [HRM_EMailGroups1].[EMailGroup]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_EmployeeEMailGroup].[CardNo] = [HRM_Employees2].[CardNo]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_EmployeeEMailGroup].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_EmployeeEMailGroup].[EMailGroup],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_EMailGroups1].[EMailGroup],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_EMailGroups1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_EmployeeEMailGroup].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_EmployeeEMailGroup].[CardNo] END DESC,
     CASE @orderBy WHEN 'EMailGroup' THEN [HRM_EmployeeEMailGroup].[EMailGroup] END,
     CASE @orderBy WHEN 'EMailGroup DESC' THEN [HRM_EmployeeEMailGroup].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'HRM_EMailGroups1_EMailGroup' THEN [HRM_EMailGroups1].[EMailGroup] END,
     CASE @orderBy WHEN 'HRM_EMailGroups1_EMailGroup DESC' THEN [HRM_EMailGroups1].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'HRM_EMailGroups1_Description' THEN [HRM_EMailGroups1].[Description] END,
     CASE @orderBy WHEN 'HRM_EMailGroups1_Description DESC' THEN [HRM_EMailGroups1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID' THEN [HRM_Employees2].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID DESC' THEN [HRM_Employees2].[C_OfficeID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_EmployeeEMailGroup].[CardNo],
		[HRM_EmployeeEMailGroup].[EMailGroup],
		[HRM_EMailGroups1].[EMailGroup] AS HRM_EMailGroups1_EMailGroup,
		[HRM_EMailGroups1].[Description] AS HRM_EMailGroups1_Description,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID 
  FROM [HRM_EmployeeEMailGroup] 
    	INNER JOIN #PageIndex
          ON [HRM_EmployeeEMailGroup].[CardNo] = #PageIndex.CardNo
          AND [HRM_EmployeeEMailGroup].[EMailGroup] = #PageIndex.EMailGroup
  INNER JOIN [HRM_EMailGroups] AS [HRM_EMailGroups1]
    ON [HRM_EmployeeEMailGroup].[EMailGroup] = [HRM_EMailGroups1].[EMailGroup]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_EmployeeEMailGroup].[CardNo] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

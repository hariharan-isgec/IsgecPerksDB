USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscCommitteesSelectByDivisionID]
  @DivisionID NVarChar(6),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SC_Committees].* ,
    [HRM_Divisions1].[Description] AS HRM_Divisions1_Description,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName 
  FROM [SC_Committees] 
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions1]
    ON [SC_Committees].[DivisionID] = [HRM_Divisions1].[DivisionID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [SC_Committees].[EmployeeID] = [HRM_Employees2].[CardNo]
  WHERE 1 = case when @DivisionID = '' 
                 then
				   case when [SC_Committees].[IsItUnitLevelCommittee] = 1 then 1 else 0 end
                 else 
				   case [SC_Committees].[DivisionID] when  @DivisionID then 1 else 0 end
				 end
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [SC_Committees].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [SC_Committees].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'IsItUnitLevelCommittee' THEN [SC_Committees].[IsItUnitLevelCommittee] END,
     CASE @OrderBy WHEN 'IsItUnitLevelCommittee DESC' THEN [SC_Committees].[IsItUnitLevelCommittee] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [SC_Committees].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [SC_Committees].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [SC_Committees].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [SC_Committees].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions1_Description' THEN [HRM_Divisions1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions1_Description DESC' THEN [HRM_Divisions1].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC 
  SET @RecordCount = @@RowCount
GO

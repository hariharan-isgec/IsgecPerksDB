USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscCommitteesSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
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
  WHERE
  [SC_Committees].[SerialNo] = @SerialNo
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnEmployeeConfigurationSelectByID]
  @LoginID NVarChar(8),
  @CardNo NVarChar(8) 
  AS
  SELECT
    [ATN_EmployeeConfiguration].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [ATN_EmployeeConfiguration] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_EmployeeConfiguration].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
  [ATN_EmployeeConfiguration].[CardNo] = @CardNo
GO

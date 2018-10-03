USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwDivisionsSelectByID]
  @LoginID NVarChar(8),
  @DivisionID NVarChar(6) 
  AS
  SELECT
    [HRM_Divisions].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [HRM_Divisions] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Divisions].[DivisionHead] = [HRM_Employees1].[CardNo]
  WHERE
  [HRM_Divisions].[DivisionID] = @DivisionID
GO

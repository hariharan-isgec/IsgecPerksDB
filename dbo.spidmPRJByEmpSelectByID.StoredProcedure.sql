USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmPRJByEmpSelectByID]
  @ProjectID NVarChar(6),
  @CardNo NVarChar(8) 
  AS
  SELECT
		[IDM_ProjectsByEmployee].[ProjectID] ,
		[IDM_ProjectsByEmployee].[CardNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [IDM_ProjectsByEmployee] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [IDM_ProjectsByEmployee].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [IDM_ProjectsByEmployee].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
  [IDM_ProjectsByEmployee].[ProjectID] = @ProjectID
  AND [IDM_ProjectsByEmployee].[CardNo] = @CardNo
GO

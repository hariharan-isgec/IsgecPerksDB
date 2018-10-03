USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtUsersSelectByID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8) 
  AS
  SELECT
		[GRT_Users].[UserID] ,
		[GRT_Users].[Designation] ,
		[GRT_Users].[Department] ,
		[GRT_Users].[DirectNo] ,
		[GRT_Users].[CellNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [GRT_Users] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [GRT_Users].[UserID] = [HRM_Employees1].[CardNo]
  WHERE
  [GRT_Users].[UserID] = @UserID
GO

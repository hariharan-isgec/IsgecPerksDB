USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupsSelectByID]
  @LoginID NVarChar(8),
  @GroupID Int 
  AS
  SELECT
		[QCM_EmployeeGroups].[GroupID] ,
		[QCM_EmployeeGroups].[Description]  
  FROM [QCM_EmployeeGroups] 
  WHERE
  [QCM_EmployeeGroups].[GroupID] = @GroupID
GO

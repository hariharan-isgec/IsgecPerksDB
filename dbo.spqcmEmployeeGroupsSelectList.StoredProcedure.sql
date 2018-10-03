USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_EmployeeGroups].[GroupID] ,
		[QCM_EmployeeGroups].[Description]  
  FROM [QCM_EmployeeGroups] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [QCM_EmployeeGroups].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [QCM_EmployeeGroups].[GroupID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_EmployeeGroups].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_EmployeeGroups].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

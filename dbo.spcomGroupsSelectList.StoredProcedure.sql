USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SYS_Groups].*  
  FROM [SYS_Groups] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [SYS_Groups].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [SYS_Groups].[GroupID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SYS_Groups].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SYS_Groups].[Description] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [SYS_Groups].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [SYS_Groups].[Active] END DESC 
  SET @RecordCount = @@RowCount
GO

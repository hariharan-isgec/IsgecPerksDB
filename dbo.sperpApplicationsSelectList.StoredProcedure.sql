USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpApplicationsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ERP_Applications].[ApplID] ,
		[ERP_Applications].[ApplName]  
  FROM [ERP_Applications] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ApplID' THEN [ERP_Applications].[ApplID] END,
     CASE @OrderBy WHEN 'ApplID DESC' THEN [ERP_Applications].[ApplID] END DESC,
     CASE @OrderBy WHEN 'ApplName' THEN [ERP_Applications].[ApplName] END,
     CASE @OrderBy WHEN 'ApplName DESC' THEN [ERP_Applications].[ApplName] END DESC 
  SET @RecordCount = @@RowCount
GO

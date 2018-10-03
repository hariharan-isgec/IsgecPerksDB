USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomProjectsSelectList]
  @FinanceCompany NVarChar(10) ='',
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_Projects].* 
  FROM [IDM_Projects] 
  WHERE 1 = 1  
   AND  [IDM_Projects].[FinanceCompany] = case when @FinanceCompany='' then [IDM_Projects].[FinanceCompany] else @FinanceCompany end
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgencySelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [IDM_ResponsibleAgency].*  
  FROM [IDM_ResponsibleAgency] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ResponsibleAgencyID' THEN [IDM_ResponsibleAgency].[ResponsibleAgencyID] END,
     CASE @OrderBy WHEN 'ResponsibleAgencyID DESC' THEN [IDM_ResponsibleAgency].[ResponsibleAgencyID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [IDM_ResponsibleAgency].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [IDM_ResponsibleAgency].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakElementsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_Elements].* ,
    [PAK_Elements1].[Description] AS PAK_Elements1_Description,
    [PAK_ResponsibleAgencies2].[Description] AS PAK_ResponsibleAgencies2_Description 
  FROM [PAK_Elements] 
  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements1]
    ON [PAK_Elements].[ParentElementID] = [PAK_Elements1].[ElementID]
  LEFT OUTER JOIN [PAK_ResponsibleAgencies] AS [PAK_ResponsibleAgencies2]
    ON [PAK_Elements].[ResponsibleAgencyID] = [PAK_ResponsibleAgencies2].[ResponsibleAgencyID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ElementID' THEN [PAK_Elements].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [PAK_Elements].[ElementID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_Elements].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_Elements].[Description] END DESC,
     CASE @OrderBy WHEN 'ResponsibleAgencyID' THEN [PAK_Elements].[ResponsibleAgencyID] END,
     CASE @OrderBy WHEN 'ResponsibleAgencyID DESC' THEN [PAK_Elements].[ResponsibleAgencyID] END DESC,
     CASE @OrderBy WHEN 'ParentElementID' THEN [PAK_Elements].[ParentElementID] END,
     CASE @OrderBy WHEN 'ParentElementID DESC' THEN [PAK_Elements].[ParentElementID] END DESC,
     CASE @OrderBy WHEN 'ElementLevel' THEN [PAK_Elements].[ElementLevel] END,
     CASE @OrderBy WHEN 'ElementLevel DESC' THEN [PAK_Elements].[ElementLevel] END DESC,
     CASE @OrderBy WHEN 'Prefix' THEN [PAK_Elements].[Prefix] END,
     CASE @OrderBy WHEN 'Prefix DESC' THEN [PAK_Elements].[Prefix] END DESC,
     CASE @OrderBy WHEN 'PAK_Elements1_Description' THEN [PAK_Elements1].[Description] END,
     CASE @OrderBy WHEN 'PAK_Elements1_Description DESC' THEN [PAK_Elements1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_ResponsibleAgencies2_Description' THEN [PAK_ResponsibleAgencies2].[Description] END,
     CASE @OrderBy WHEN 'PAK_ResponsibleAgencies2_Description DESC' THEN [PAK_ResponsibleAgencies2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

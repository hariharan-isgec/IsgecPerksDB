USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgenciesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_ResponsibleAgencies].*  
  FROM [PAK_ResponsibleAgencies] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ResponsibleAgencyID' THEN [PAK_ResponsibleAgencies].[ResponsibleAgencyID] END,
     CASE @OrderBy WHEN 'ResponsibleAgencyID DESC' THEN [PAK_ResponsibleAgencies].[ResponsibleAgencyID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_ResponsibleAgencies].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_ResponsibleAgencies].[Description] END DESC,
     CASE @OrderBy WHEN 'ExternalAgency' THEN [PAK_ResponsibleAgencies].[ExternalAgency] END,
     CASE @OrderBy WHEN 'ExternalAgency DESC' THEN [PAK_ResponsibleAgencies].[ExternalAgency] END DESC 
  SET @RecordCount = @@RowCount
GO

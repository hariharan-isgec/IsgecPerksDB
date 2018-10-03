USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmResponsibleAgencySelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_ResponsibleAgency].[ResponsibleAgencyID] ,
		[IDM_ResponsibleAgency].[Description]  
  FROM [IDM_ResponsibleAgency] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'ResponsibleAgencyID' THEN [IDM_ResponsibleAgency].[ResponsibleAgencyID] END,
     CASE @orderBy WHEN 'ResponsibleAgencyID DESC' THEN [IDM_ResponsibleAgency].[ResponsibleAgencyID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_ResponsibleAgency].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_ResponsibleAgency].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

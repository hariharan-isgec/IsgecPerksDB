USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosProjectsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_Projects].[ProjectID] ,
		[IDM_Projects].[Description] ,
		[IDM_Projects].[ContactPerson] ,
		[IDM_Projects].[EmailID] ,
		[IDM_Projects].[ContactNo] ,
		[IDM_Projects].[Address1] ,
		[IDM_Projects].[Address2] ,
		[IDM_Projects].[Address3] ,
		[IDM_Projects].[Address4]  
  FROM [IDM_Projects] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC,
     CASE @OrderBy WHEN 'ContactPerson' THEN [IDM_Projects].[ContactPerson] END,
     CASE @OrderBy WHEN 'ContactPerson DESC' THEN [IDM_Projects].[ContactPerson] END DESC,
     CASE @OrderBy WHEN 'EmailID' THEN [IDM_Projects].[EmailID] END,
     CASE @OrderBy WHEN 'EmailID DESC' THEN [IDM_Projects].[EmailID] END DESC,
     CASE @OrderBy WHEN 'ContactNo' THEN [IDM_Projects].[ContactNo] END,
     CASE @OrderBy WHEN 'ContactNo DESC' THEN [IDM_Projects].[ContactNo] END DESC,
     CASE @OrderBy WHEN 'Address1' THEN [IDM_Projects].[Address1] END,
     CASE @OrderBy WHEN 'Address1 DESC' THEN [IDM_Projects].[Address1] END DESC,
     CASE @OrderBy WHEN 'Address2' THEN [IDM_Projects].[Address2] END,
     CASE @OrderBy WHEN 'Address2 DESC' THEN [IDM_Projects].[Address2] END DESC,
     CASE @OrderBy WHEN 'Address3' THEN [IDM_Projects].[Address3] END,
     CASE @OrderBy WHEN 'Address3 DESC' THEN [IDM_Projects].[Address3] END DESC,
     CASE @OrderBy WHEN 'Address4' THEN [IDM_Projects].[Address4] END,
     CASE @OrderBy WHEN 'Address4 DESC' THEN [IDM_Projects].[Address4] END DESC 
  SET @RecordCount = @@RowCount
GO

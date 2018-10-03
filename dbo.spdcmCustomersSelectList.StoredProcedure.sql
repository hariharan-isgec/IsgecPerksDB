USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomersSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[DCM_Customers].[CustomerID],
		[DCM_Customers].[ProjectID],
		[DCM_Customers].[Description],
		[DCM_Customers].[Address1],
		[DCM_Customers].[Address2],
		[DCM_Customers].[Address3],
		[DCM_Customers].[Address4],
		[DCM_Customers].[ToEMailID],
		[DCM_Customers].[CCEmailID],
		[DCM_Projects1].[ProjectID] AS DCM_Projects1_ProjectID,
		[DCM_Projects1].[Description] AS DCM_Projects1_Description 
  FROM [DCM_Customers] 
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_Customers].[ProjectID] = [DCM_Projects1].[ProjectID]
  ORDER BY
     CASE @orderBy WHEN 'CustomerID' THEN [DCM_Customers].[CustomerID] END,
     CASE @orderBy WHEN 'CustomerID DESC' THEN [DCM_Customers].[CustomerID] END DESC,
     CASE @orderBy WHEN 'ProjectID' THEN [DCM_Customers].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [DCM_Customers].[ProjectID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_Customers].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_Customers].[Description] END DESC,
     CASE @orderBy WHEN 'Address1' THEN [DCM_Customers].[Address1] END,
     CASE @orderBy WHEN 'Address1 DESC' THEN [DCM_Customers].[Address1] END DESC,
     CASE @orderBy WHEN 'Address2' THEN [DCM_Customers].[Address2] END,
     CASE @orderBy WHEN 'Address2 DESC' THEN [DCM_Customers].[Address2] END DESC,
     CASE @orderBy WHEN 'Address3' THEN [DCM_Customers].[Address3] END,
     CASE @orderBy WHEN 'Address3 DESC' THEN [DCM_Customers].[Address3] END DESC,
     CASE @orderBy WHEN 'Address4' THEN [DCM_Customers].[Address4] END,
     CASE @orderBy WHEN 'Address4 DESC' THEN [DCM_Customers].[Address4] END DESC,
     CASE @orderBy WHEN 'ToEMailID' THEN [DCM_Customers].[ToEMailID] END,
     CASE @orderBy WHEN 'ToEMailID DESC' THEN [DCM_Customers].[ToEMailID] END DESC,
     CASE @orderBy WHEN 'CCEmailID' THEN [DCM_Customers].[CCEmailID] END,
     CASE @orderBy WHEN 'CCEmailID DESC' THEN [DCM_Customers].[CCEmailID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects1_ProjectID' THEN [DCM_Projects1].[ProjectID] END,
     CASE @orderBy WHEN 'DCM_Projects1_ProjectID DESC' THEN [DCM_Projects1].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects1_Description' THEN [DCM_Projects1].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects1_Description DESC' THEN [DCM_Projects1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

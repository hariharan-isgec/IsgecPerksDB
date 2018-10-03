USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmProjectContactsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_ProjectContacts].[ProjectID] ,
		[IDM_ProjectContacts].[SerialNo] ,
		[IDM_ProjectContacts].[CardNo] ,
		[IDM_ProjectContacts].[ContactPerson] ,
		[IDM_ProjectContacts].[EmailID] ,
		[IDM_ProjectContacts].[ContactNo] ,
		[IDM_ProjectContacts].[Address1] ,
		[IDM_ProjectContacts].[Address2] ,
		[IDM_ProjectContacts].[Address3] ,
		[IDM_ProjectContacts].[Address4] ,
		[IDM_ProjectContacts].[Remarks] ,
		[IDM_ProjectContacts].[CCEmailID] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [IDM_ProjectContacts] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [IDM_ProjectContacts].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [IDM_ProjectContacts].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [IDM_ProjectContacts].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_ProjectContacts].[ProjectID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [IDM_ProjectContacts].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [IDM_ProjectContacts].[SerialNo] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [IDM_ProjectContacts].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [IDM_ProjectContacts].[CardNo] END DESC,
     CASE @orderBy WHEN 'ContactPerson' THEN [IDM_ProjectContacts].[ContactPerson] END,
     CASE @orderBy WHEN 'ContactPerson DESC' THEN [IDM_ProjectContacts].[ContactPerson] END DESC,
     CASE @orderBy WHEN 'EmailID' THEN [IDM_ProjectContacts].[EmailID] END,
     CASE @orderBy WHEN 'EmailID DESC' THEN [IDM_ProjectContacts].[EmailID] END DESC,
     CASE @orderBy WHEN 'ContactNo' THEN [IDM_ProjectContacts].[ContactNo] END,
     CASE @orderBy WHEN 'ContactNo DESC' THEN [IDM_ProjectContacts].[ContactNo] END DESC,
     CASE @orderBy WHEN 'Address1' THEN [IDM_ProjectContacts].[Address1] END,
     CASE @orderBy WHEN 'Address1 DESC' THEN [IDM_ProjectContacts].[Address1] END DESC,
     CASE @orderBy WHEN 'Address2' THEN [IDM_ProjectContacts].[Address2] END,
     CASE @orderBy WHEN 'Address2 DESC' THEN [IDM_ProjectContacts].[Address2] END DESC,
     CASE @orderBy WHEN 'Address3' THEN [IDM_ProjectContacts].[Address3] END,
     CASE @orderBy WHEN 'Address3 DESC' THEN [IDM_ProjectContacts].[Address3] END DESC,
     CASE @orderBy WHEN 'Address4' THEN [IDM_ProjectContacts].[Address4] END,
     CASE @orderBy WHEN 'Address4 DESC' THEN [IDM_ProjectContacts].[Address4] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [IDM_ProjectContacts].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [IDM_ProjectContacts].[Remarks] END DESC,
     CASE @orderBy WHEN 'CCEmailID' THEN [IDM_ProjectContacts].[CCEmailID] END,
     CASE @orderBy WHEN 'CCEmailID DESC' THEN [IDM_ProjectContacts].[CCEmailID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

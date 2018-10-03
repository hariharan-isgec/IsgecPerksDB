USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmProjectContactsSelectByID]
  @ProjectID NVarChar(6),
  @SerialNo Int 
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
  WHERE
  [IDM_ProjectContacts].[ProjectID] = @ProjectID
  AND [IDM_ProjectContacts].[SerialNo] = @SerialNo
GO

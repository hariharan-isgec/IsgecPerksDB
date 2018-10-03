USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomersSelectByID]
  @CustomerID NVarChar(6),
  @ProjectID NVarChar(6) 
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
  WHERE
  [DCM_Customers].[CustomerID] = @CustomerID
  AND [DCM_Customers].[ProjectID] = @ProjectID
GO

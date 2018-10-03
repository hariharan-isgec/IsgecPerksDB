USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spdcm_LG_CustomerTmtlHeaderSelectByTmtlID]
  @TmtlID Int 
  AS
  SELECT
		[DCM_CustomerTmtlHeader].[TmtlID],
		[DCM_CustomerTmtlHeader].[ProjectID],
		[DCM_CustomerTmtlHeader].[CustomerID],
		[DCM_CustomerTmtlHeader].[TmtlReference],
		[DCM_CustomerTmtlHeader].[Subject],
		[DCM_CustomerTmtlHeader].[Remarks],
		[DCM_CustomerTmtlHeader].[TmtlStatusID],
		[DCM_CustomerTmtlHeader].[CreatedOn],
		[DCM_CustomerTmtlHeader].[CreatedBy],
		[DCM_CustomerTmtlHeader].[ApprovedOn],
		[DCM_CustomerTmtlHeader].[ApprovedBy],
		[DCM_Customers1].[CustomerID] AS DCM_Customers1_CustomerID,
		[DCM_Customers1].[ProjectID] AS DCM_Customers1_ProjectID,
		[DCM_Customers1].[Description] AS DCM_Customers1_Description,
		[DCM_Customers1].[Address1] AS DCM_Customers1_Address1,
		[DCM_Customers1].[Address2] AS DCM_Customers1_Address2,
		[DCM_Customers1].[Address3] AS DCM_Customers1_Address3,
		[DCM_Customers1].[Address4] AS DCM_Customers1_Address4,
		[DCM_Customers1].[ToEMailID] AS DCM_Customers1_ToEMailID,
		[DCM_Customers1].[CCEmailID] AS DCM_Customers1_CCEmailID,
		[DCM_Projects2].[ProjectID] AS DCM_Projects2_ProjectID,
		[DCM_Projects2].[Description] AS DCM_Projects2_Description,
		[DCM_Projects2].[ProjectCode] AS DCM_Projects2_ProjectCode,
		[DCM_TmtlStatus3].[StatusID] AS DCM_TmtlStatus3_StatusID,
		[DCM_TmtlStatus3].[Description] AS DCM_TmtlStatus3_Description 
  FROM [DCM_CustomerTmtlHeader] 
  LEFT OUTER JOIN [DCM_Customers] AS [DCM_Customers1]
    ON [DCM_CustomerTmtlHeader].[CustomerID] = [DCM_Customers1].[CustomerID]
    AND [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Customers1].[ProjectID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects2]
    ON [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Projects2].[ProjectID]
  LEFT OUTER JOIN [DCM_TmtlStatus] AS [DCM_TmtlStatus3]
    ON [DCM_CustomerTmtlHeader].[TmtlStatusID] = [DCM_TmtlStatus3].[StatusID]
  WHERE
  [DCM_CustomerTmtlHeader].[TmtlID] = @TmtlID
GO

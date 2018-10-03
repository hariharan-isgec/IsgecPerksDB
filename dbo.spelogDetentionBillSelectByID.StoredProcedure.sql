USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillSelectByID]
  @LoginID NVarChar(8),
  @IRNo Int 
  AS
  SELECT
    [ELOG_DetentionBill].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [ELOG_DetentionBillStatus2].[Description] AS ELOG_DetentionBillStatus2_Description,
    [ELOG_DetentionBillTypes3].[Description] AS ELOG_DetentionBillTypes3_Description,
    [IDM_Projects4].[Description] AS IDM_Projects4_Description,
    [VR_BusinessPartner5].[BPName] AS VR_BusinessPartner5_BPName 
  FROM [ELOG_DetentionBill] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [ELOG_DetentionBill].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [ELOG_DetentionBillStatus] AS [ELOG_DetentionBillStatus2]
    ON [ELOG_DetentionBill].[StatusID] = [ELOG_DetentionBillStatus2].[StatusID]
  LEFT OUTER JOIN [ELOG_DetentionBillTypes] AS [ELOG_DetentionBillTypes3]
    ON [ELOG_DetentionBill].[BillTypeID] = [ELOG_DetentionBillTypes3].[BillTypeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [ELOG_DetentionBill].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner5]
    ON [ELOG_DetentionBill].[SupplierID] = [VR_BusinessPartner5].[BPID]
  WHERE
  [ELOG_DetentionBill].[IRNo] = @IRNo
GO

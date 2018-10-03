USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpCreateTPTBillSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[ERP_TransporterBill].* ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName,
		[aspnet_Users6].[UserFullName] AS aspnet_Users6_UserFullName,
		[aspnet_Users7].[UserFullName] AS aspnet_Users7_UserFullName,
		[ERP_TPTBillStatus8].[Description] AS ERP_TPTBillStatus8_Description,
		[IDM_Projects9].[Description] AS IDM_Projects9_Description,
		[VR_Transporters10].[TransporterName] AS VR_Transporters10_TransporterName 
  FROM [ERP_TransporterBill] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [ERP_TransporterBill].[FWDToAccountsBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [ERP_TransporterBill].[RECDinAccountsBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [ERP_TransporterBill].[DiscReturnedinAcBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [ERP_TransporterBill].[DiscReturnedToByAC] = [aspnet_Users4].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users5]
    ON [ERP_TransporterBill].[DiscRecdInLgstBy] = [aspnet_Users5].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users6]
    ON [ERP_TransporterBill].[ReFwdToAcBy] = [aspnet_Users6].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users7]
    ON [ERP_TransporterBill].[CreatedBy] = [aspnet_Users7].[LoginID]
  LEFT OUTER JOIN [ERP_TPTBillStatus] AS [ERP_TPTBillStatus8]
    ON [ERP_TransporterBill].[BillStatus] = [ERP_TPTBillStatus8].[BillStatusID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]
    ON [ERP_TransporterBill].[ProjectID] = [IDM_Projects9].[ProjectID]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters10]
    ON [ERP_TransporterBill].[TPTCode] = [VR_Transporters10].[TransporterID]
  WHERE
  [ERP_TransporterBill].[SerialNo] = @SerialNo
GO

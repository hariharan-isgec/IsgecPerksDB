USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpProcessTPTBillSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [ERP_TransporterBill].[SerialNo] FROM [ERP_TransporterBill]
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
 WHERE [ERP_TransporterBill].[BillStatus] IN (3,6,7,8)  
   AND ( 
         STR(ISNULL([ERP_TransporterBill].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[TPTBillNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[IRNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[GRNos],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[TPTCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[PONumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[TPTBillAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[BasicFreightValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[BasicFvODC], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[DetentionatLP], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[DetentionatULP], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[ODCChargesInContract], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[ODCChargesOutOfContract], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[EmptyReturnCharges], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[RTOChallanAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[OtherAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[ServiceTax], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[TotalBillPassedAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[FWDToAccountsBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[RECDinAccountsBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[DiscReturnedinAcBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[DiscReturnedToByAC],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[DiscRecdInLgstBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[ReFwdToAcBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[PTRNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[PTRAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[BankVCHNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[BankVCHAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[AccountsRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[LgstRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([ERP_TransporterBill].[BillStatus], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TransporterBill].[ChequeNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [ERP_TransporterBill].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [ERP_TransporterBill].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'TPTBillNo' THEN [ERP_TransporterBill].[TPTBillNo] END,
     CASE @OrderBy WHEN 'TPTBillNo DESC' THEN [ERP_TransporterBill].[TPTBillNo] END DESC,
     CASE @OrderBy WHEN 'TPTBillDate' THEN [ERP_TransporterBill].[TPTBillDate] END,
     CASE @OrderBy WHEN 'TPTBillDate DESC' THEN [ERP_TransporterBill].[TPTBillDate] END DESC,
     CASE @OrderBy WHEN 'TPTBillReceivedOn' THEN [ERP_TransporterBill].[TPTBillReceivedOn] END,
     CASE @OrderBy WHEN 'TPTBillReceivedOn DESC' THEN [ERP_TransporterBill].[TPTBillReceivedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [ERP_TransporterBill].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [ERP_TransporterBill].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [ERP_TransporterBill].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [ERP_TransporterBill].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'GRNos' THEN [ERP_TransporterBill].[GRNos] END,
     CASE @OrderBy WHEN 'GRNos DESC' THEN [ERP_TransporterBill].[GRNos] END DESC,
     CASE @OrderBy WHEN 'TPTCode' THEN [ERP_TransporterBill].[TPTCode] END,
     CASE @OrderBy WHEN 'TPTCode DESC' THEN [ERP_TransporterBill].[TPTCode] END DESC,
     CASE @OrderBy WHEN 'PONumber' THEN [ERP_TransporterBill].[PONumber] END,
     CASE @OrderBy WHEN 'PONumber DESC' THEN [ERP_TransporterBill].[PONumber] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [ERP_TransporterBill].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [ERP_TransporterBill].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'TPTBillAmount' THEN [ERP_TransporterBill].[TPTBillAmount] END,
     CASE @OrderBy WHEN 'TPTBillAmount DESC' THEN [ERP_TransporterBill].[TPTBillAmount] END DESC,
     CASE @OrderBy WHEN 'BasicFreightValue' THEN [ERP_TransporterBill].[BasicFreightValue] END,
     CASE @OrderBy WHEN 'BasicFreightValue DESC' THEN [ERP_TransporterBill].[BasicFreightValue] END DESC,
     CASE @OrderBy WHEN 'BasicFvODC' THEN [ERP_TransporterBill].[BasicFvODC] END,
     CASE @OrderBy WHEN 'BasicFvODC DESC' THEN [ERP_TransporterBill].[BasicFvODC] END DESC,
     CASE @OrderBy WHEN 'DetentionatLP' THEN [ERP_TransporterBill].[DetentionatLP] END,
     CASE @OrderBy WHEN 'DetentionatLP DESC' THEN [ERP_TransporterBill].[DetentionatLP] END DESC,
     CASE @OrderBy WHEN 'DetentionatULP' THEN [ERP_TransporterBill].[DetentionatULP] END,
     CASE @OrderBy WHEN 'DetentionatULP DESC' THEN [ERP_TransporterBill].[DetentionatULP] END DESC,
     CASE @OrderBy WHEN 'ODCChargesInContract' THEN [ERP_TransporterBill].[ODCChargesInContract] END,
     CASE @OrderBy WHEN 'ODCChargesInContract DESC' THEN [ERP_TransporterBill].[ODCChargesInContract] END DESC,
     CASE @OrderBy WHEN 'ODCChargesOutOfContract' THEN [ERP_TransporterBill].[ODCChargesOutOfContract] END,
     CASE @OrderBy WHEN 'ODCChargesOutOfContract DESC' THEN [ERP_TransporterBill].[ODCChargesOutOfContract] END DESC,
     CASE @OrderBy WHEN 'EmptyReturnCharges' THEN [ERP_TransporterBill].[EmptyReturnCharges] END,
     CASE @OrderBy WHEN 'EmptyReturnCharges DESC' THEN [ERP_TransporterBill].[EmptyReturnCharges] END DESC,
     CASE @OrderBy WHEN 'RTOChallanAmount' THEN [ERP_TransporterBill].[RTOChallanAmount] END,
     CASE @OrderBy WHEN 'RTOChallanAmount DESC' THEN [ERP_TransporterBill].[RTOChallanAmount] END DESC,
     CASE @OrderBy WHEN 'OtherAmount' THEN [ERP_TransporterBill].[OtherAmount] END,
     CASE @OrderBy WHEN 'OtherAmount DESC' THEN [ERP_TransporterBill].[OtherAmount] END DESC,
     CASE @OrderBy WHEN 'ServiceTax' THEN [ERP_TransporterBill].[ServiceTax] END,
     CASE @OrderBy WHEN 'ServiceTax DESC' THEN [ERP_TransporterBill].[ServiceTax] END DESC,
     CASE @OrderBy WHEN 'TotalBillPassedAmount' THEN [ERP_TransporterBill].[TotalBillPassedAmount] END,
     CASE @OrderBy WHEN 'TotalBillPassedAmount DESC' THEN [ERP_TransporterBill].[TotalBillPassedAmount] END DESC,
     CASE @OrderBy WHEN 'FWDToAccountsOn' THEN [ERP_TransporterBill].[FWDToAccountsOn] END,
     CASE @OrderBy WHEN 'FWDToAccountsOn DESC' THEN [ERP_TransporterBill].[FWDToAccountsOn] END DESC,
     CASE @OrderBy WHEN 'FWDToAccountsBy' THEN [ERP_TransporterBill].[FWDToAccountsBy] END,
     CASE @OrderBy WHEN 'FWDToAccountsBy DESC' THEN [ERP_TransporterBill].[FWDToAccountsBy] END DESC,
     CASE @OrderBy WHEN 'RECDByAccountsOn' THEN [ERP_TransporterBill].[RECDByAccountsOn] END,
     CASE @OrderBy WHEN 'RECDByAccountsOn DESC' THEN [ERP_TransporterBill].[RECDByAccountsOn] END DESC,
     CASE @OrderBy WHEN 'RECDinAccountsBy' THEN [ERP_TransporterBill].[RECDinAccountsBy] END,
     CASE @OrderBy WHEN 'RECDinAccountsBy DESC' THEN [ERP_TransporterBill].[RECDinAccountsBy] END DESC,
     CASE @OrderBy WHEN 'DiscReturnedByACOn' THEN [ERP_TransporterBill].[DiscReturnedByACOn] END,
     CASE @OrderBy WHEN 'DiscReturnedByACOn DESC' THEN [ERP_TransporterBill].[DiscReturnedByACOn] END DESC,
     CASE @OrderBy WHEN 'DiscReturnedinAcBy' THEN [ERP_TransporterBill].[DiscReturnedinAcBy] END,
     CASE @OrderBy WHEN 'DiscReturnedinAcBy DESC' THEN [ERP_TransporterBill].[DiscReturnedinAcBy] END DESC,
     CASE @OrderBy WHEN 'DiscReturnedToByAC' THEN [ERP_TransporterBill].[DiscReturnedToByAC] END,
     CASE @OrderBy WHEN 'DiscReturnedToByAC DESC' THEN [ERP_TransporterBill].[DiscReturnedToByAC] END DESC,
     CASE @OrderBy WHEN 'DiscRecdInLgstBy' THEN [ERP_TransporterBill].[DiscRecdInLgstBy] END,
     CASE @OrderBy WHEN 'DiscRecdInLgstBy DESC' THEN [ERP_TransporterBill].[DiscRecdInLgstBy] END DESC,
     CASE @OrderBy WHEN 'DiscRecdInLgstOn' THEN [ERP_TransporterBill].[DiscRecdInLgstOn] END,
     CASE @OrderBy WHEN 'DiscRecdInLgstOn DESC' THEN [ERP_TransporterBill].[DiscRecdInLgstOn] END DESC,
     CASE @OrderBy WHEN 'ReFwdToAcBy' THEN [ERP_TransporterBill].[ReFwdToAcBy] END,
     CASE @OrderBy WHEN 'ReFwdToAcBy DESC' THEN [ERP_TransporterBill].[ReFwdToAcBy] END DESC,
     CASE @OrderBy WHEN 'ReFwdToACOn' THEN [ERP_TransporterBill].[ReFwdToACOn] END,
     CASE @OrderBy WHEN 'ReFwdToACOn DESC' THEN [ERP_TransporterBill].[ReFwdToACOn] END DESC,
     CASE @OrderBy WHEN 'PTRNo' THEN [ERP_TransporterBill].[PTRNo] END,
     CASE @OrderBy WHEN 'PTRNo DESC' THEN [ERP_TransporterBill].[PTRNo] END DESC,
     CASE @OrderBy WHEN 'PTRAmount' THEN [ERP_TransporterBill].[PTRAmount] END,
     CASE @OrderBy WHEN 'PTRAmount DESC' THEN [ERP_TransporterBill].[PTRAmount] END DESC,
     CASE @OrderBy WHEN 'PTRDate' THEN [ERP_TransporterBill].[PTRDate] END,
     CASE @OrderBy WHEN 'PTRDate DESC' THEN [ERP_TransporterBill].[PTRDate] END DESC,
     CASE @OrderBy WHEN 'BankVCHNo' THEN [ERP_TransporterBill].[BankVCHNo] END,
     CASE @OrderBy WHEN 'BankVCHNo DESC' THEN [ERP_TransporterBill].[BankVCHNo] END DESC,
     CASE @OrderBy WHEN 'BankVCHAmount' THEN [ERP_TransporterBill].[BankVCHAmount] END,
     CASE @OrderBy WHEN 'BankVCHAmount DESC' THEN [ERP_TransporterBill].[BankVCHAmount] END DESC,
     CASE @OrderBy WHEN 'BankVCHDate' THEN [ERP_TransporterBill].[BankVCHDate] END,
     CASE @OrderBy WHEN 'BankVCHDate DESC' THEN [ERP_TransporterBill].[BankVCHDate] END DESC,
     CASE @OrderBy WHEN 'AccountsRemarks' THEN [ERP_TransporterBill].[AccountsRemarks] END,
     CASE @OrderBy WHEN 'AccountsRemarks DESC' THEN [ERP_TransporterBill].[AccountsRemarks] END DESC,
     CASE @OrderBy WHEN 'LgstRemarks' THEN [ERP_TransporterBill].[LgstRemarks] END,
     CASE @OrderBy WHEN 'LgstRemarks DESC' THEN [ERP_TransporterBill].[LgstRemarks] END DESC,
     CASE @OrderBy WHEN 'BillStatus' THEN [ERP_TransporterBill].[BillStatus] END,
     CASE @OrderBy WHEN 'BillStatus DESC' THEN [ERP_TransporterBill].[BillStatus] END DESC,
     CASE @OrderBy WHEN 'ChequeNo' THEN [ERP_TransporterBill].[ChequeNo] END,
     CASE @OrderBy WHEN 'ChequeNo DESC' THEN [ERP_TransporterBill].[ChequeNo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName' THEN [aspnet_Users4].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName DESC' THEN [aspnet_Users4].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users5_UserFullName' THEN [aspnet_Users5].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users5_UserFullName DESC' THEN [aspnet_Users5].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users6_UserFullName' THEN [aspnet_Users6].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users6_UserFullName DESC' THEN [aspnet_Users6].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName' THEN [aspnet_Users7].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName DESC' THEN [aspnet_Users7].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'ERP_TPTBillStatus8_Description' THEN [ERP_TPTBillStatus8].[Description] END,
     CASE @OrderBy WHEN 'ERP_TPTBillStatus8_Description DESC' THEN [ERP_TPTBillStatus8].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects9_Description' THEN [IDM_Projects9].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects9_Description DESC' THEN [IDM_Projects9].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_Transporters10_TransporterName' THEN [VR_Transporters10].[TransporterName] END,
     CASE @OrderBy WHEN 'VR_Transporters10_TransporterName DESC' THEN [VR_Transporters10].[TransporterName] END DESC 

    SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [ERP_TransporterBill].[SerialNo] = #PageIndex.SerialNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

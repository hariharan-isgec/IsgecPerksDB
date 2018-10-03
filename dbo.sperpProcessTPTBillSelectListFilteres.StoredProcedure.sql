USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpProcessTPTBillSelectListFilteres]
  @Filter_TPTCode NVarChar(9),
  @Filter_ProjectID NVarChar(6),
  @Filter_BillStatus Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_TransporterBill].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_TransporterBill] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[FWDToAccountsBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[RECDinAccountsBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[DiscReturnedinAcBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[DiscReturnedToByAC] = [aspnet_Users4].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users5]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[DiscRecdInLgstBy] = [aspnet_Users5].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users6]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[ReFwdToAcBy] = [aspnet_Users6].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users7]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[CreatedBy] = [aspnet_Users7].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ERP_TPTBillStatus] AS [ERP_TPTBillStatus8]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[BillStatus] = [ERP_TPTBillStatus8].[BillStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[ProjectID] = [IDM_Projects9].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters10]'
  SET @LGSQL = @LGSQL + '    ON [ERP_TransporterBill].[TPTCode] = [VR_Transporters10].[TransporterID]'
  SET @LGSQL = @LGSQL + '  WHERE [ERP_TransporterBill].[BillStatus] IN (3,6,7,8) '
  IF (@Filter_TPTCode > '') 
    SET @LGSQL = @LGSQL + ' AND [ERP_TransporterBill].[TPTCode] = ''' + @Filter_TPTCode + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [ERP_TransporterBill].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_BillStatus > 0) 
    SET @LGSQL = @LGSQL + ' AND [ERP_TransporterBill].[BillStatus] = ' + STR(@Filter_BillStatus)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[ERP_TransporterBill].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ERP_TransporterBill].[SerialNo] DESC'
                        WHEN 'TPTBillNo' THEN '[ERP_TransporterBill].[TPTBillNo]'
                        WHEN 'TPTBillNo DESC' THEN '[ERP_TransporterBill].[TPTBillNo] DESC'
                        WHEN 'TPTBillDate' THEN '[ERP_TransporterBill].[TPTBillDate]'
                        WHEN 'TPTBillDate DESC' THEN '[ERP_TransporterBill].[TPTBillDate] DESC'
                        WHEN 'TPTBillReceivedOn' THEN '[ERP_TransporterBill].[TPTBillReceivedOn]'
                        WHEN 'TPTBillReceivedOn DESC' THEN '[ERP_TransporterBill].[TPTBillReceivedOn] DESC'
                        WHEN 'CreatedBy' THEN '[ERP_TransporterBill].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[ERP_TransporterBill].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[ERP_TransporterBill].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[ERP_TransporterBill].[CreatedOn] DESC'
                        WHEN 'GRNos' THEN '[ERP_TransporterBill].[GRNos]'
                        WHEN 'GRNos DESC' THEN '[ERP_TransporterBill].[GRNos] DESC'
                        WHEN 'TPTCode' THEN '[ERP_TransporterBill].[TPTCode]'
                        WHEN 'TPTCode DESC' THEN '[ERP_TransporterBill].[TPTCode] DESC'
                        WHEN 'PONumber' THEN '[ERP_TransporterBill].[PONumber]'
                        WHEN 'PONumber DESC' THEN '[ERP_TransporterBill].[PONumber] DESC'
                        WHEN 'ProjectID' THEN '[ERP_TransporterBill].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[ERP_TransporterBill].[ProjectID] DESC'
                        WHEN 'TPTBillAmount' THEN '[ERP_TransporterBill].[TPTBillAmount]'
                        WHEN 'TPTBillAmount DESC' THEN '[ERP_TransporterBill].[TPTBillAmount] DESC'
                        WHEN 'BasicFreightValue' THEN '[ERP_TransporterBill].[BasicFreightValue]'
                        WHEN 'BasicFreightValue DESC' THEN '[ERP_TransporterBill].[BasicFreightValue] DESC'
                        WHEN 'BasicFvODC' THEN '[ERP_TransporterBill].[BasicFvODC]'
                        WHEN 'BasicFvODC DESC' THEN '[ERP_TransporterBill].[BasicFvODC] DESC'
                        WHEN 'DetentionatLP' THEN '[ERP_TransporterBill].[DetentionatLP]'
                        WHEN 'DetentionatLP DESC' THEN '[ERP_TransporterBill].[DetentionatLP] DESC'
                        WHEN 'DetentionatULP' THEN '[ERP_TransporterBill].[DetentionatULP]'
                        WHEN 'DetentionatULP DESC' THEN '[ERP_TransporterBill].[DetentionatULP] DESC'
                        WHEN 'ODCChargesInContract' THEN '[ERP_TransporterBill].[ODCChargesInContract]'
                        WHEN 'ODCChargesInContract DESC' THEN '[ERP_TransporterBill].[ODCChargesInContract] DESC'
                        WHEN 'ODCChargesOutOfContract' THEN '[ERP_TransporterBill].[ODCChargesOutOfContract]'
                        WHEN 'ODCChargesOutOfContract DESC' THEN '[ERP_TransporterBill].[ODCChargesOutOfContract] DESC'
                        WHEN 'EmptyReturnCharges' THEN '[ERP_TransporterBill].[EmptyReturnCharges]'
                        WHEN 'EmptyReturnCharges DESC' THEN '[ERP_TransporterBill].[EmptyReturnCharges] DESC'
                        WHEN 'RTOChallanAmount' THEN '[ERP_TransporterBill].[RTOChallanAmount]'
                        WHEN 'RTOChallanAmount DESC' THEN '[ERP_TransporterBill].[RTOChallanAmount] DESC'
                        WHEN 'OtherAmount' THEN '[ERP_TransporterBill].[OtherAmount]'
                        WHEN 'OtherAmount DESC' THEN '[ERP_TransporterBill].[OtherAmount] DESC'
                        WHEN 'ServiceTax' THEN '[ERP_TransporterBill].[ServiceTax]'
                        WHEN 'ServiceTax DESC' THEN '[ERP_TransporterBill].[ServiceTax] DESC'
                        WHEN 'TotalBillPassedAmount' THEN '[ERP_TransporterBill].[TotalBillPassedAmount]'
                        WHEN 'TotalBillPassedAmount DESC' THEN '[ERP_TransporterBill].[TotalBillPassedAmount] DESC'
                        WHEN 'FWDToAccountsOn' THEN '[ERP_TransporterBill].[FWDToAccountsOn]'
                        WHEN 'FWDToAccountsOn DESC' THEN '[ERP_TransporterBill].[FWDToAccountsOn] DESC'
                        WHEN 'FWDToAccountsBy' THEN '[ERP_TransporterBill].[FWDToAccountsBy]'
                        WHEN 'FWDToAccountsBy DESC' THEN '[ERP_TransporterBill].[FWDToAccountsBy] DESC'
                        WHEN 'RECDByAccountsOn' THEN '[ERP_TransporterBill].[RECDByAccountsOn]'
                        WHEN 'RECDByAccountsOn DESC' THEN '[ERP_TransporterBill].[RECDByAccountsOn] DESC'
                        WHEN 'RECDinAccountsBy' THEN '[ERP_TransporterBill].[RECDinAccountsBy]'
                        WHEN 'RECDinAccountsBy DESC' THEN '[ERP_TransporterBill].[RECDinAccountsBy] DESC'
                        WHEN 'DiscReturnedByACOn' THEN '[ERP_TransporterBill].[DiscReturnedByACOn]'
                        WHEN 'DiscReturnedByACOn DESC' THEN '[ERP_TransporterBill].[DiscReturnedByACOn] DESC'
                        WHEN 'DiscReturnedinAcBy' THEN '[ERP_TransporterBill].[DiscReturnedinAcBy]'
                        WHEN 'DiscReturnedinAcBy DESC' THEN '[ERP_TransporterBill].[DiscReturnedinAcBy] DESC'
                        WHEN 'DiscReturnedToByAC' THEN '[ERP_TransporterBill].[DiscReturnedToByAC]'
                        WHEN 'DiscReturnedToByAC DESC' THEN '[ERP_TransporterBill].[DiscReturnedToByAC] DESC'
                        WHEN 'DiscRecdInLgstBy' THEN '[ERP_TransporterBill].[DiscRecdInLgstBy]'
                        WHEN 'DiscRecdInLgstBy DESC' THEN '[ERP_TransporterBill].[DiscRecdInLgstBy] DESC'
                        WHEN 'DiscRecdInLgstOn' THEN '[ERP_TransporterBill].[DiscRecdInLgstOn]'
                        WHEN 'DiscRecdInLgstOn DESC' THEN '[ERP_TransporterBill].[DiscRecdInLgstOn] DESC'
                        WHEN 'ReFwdToAcBy' THEN '[ERP_TransporterBill].[ReFwdToAcBy]'
                        WHEN 'ReFwdToAcBy DESC' THEN '[ERP_TransporterBill].[ReFwdToAcBy] DESC'
                        WHEN 'ReFwdToACOn' THEN '[ERP_TransporterBill].[ReFwdToACOn]'
                        WHEN 'ReFwdToACOn DESC' THEN '[ERP_TransporterBill].[ReFwdToACOn] DESC'
                        WHEN 'PTRNo' THEN '[ERP_TransporterBill].[PTRNo]'
                        WHEN 'PTRNo DESC' THEN '[ERP_TransporterBill].[PTRNo] DESC'
                        WHEN 'PTRAmount' THEN '[ERP_TransporterBill].[PTRAmount]'
                        WHEN 'PTRAmount DESC' THEN '[ERP_TransporterBill].[PTRAmount] DESC'
                        WHEN 'PTRDate' THEN '[ERP_TransporterBill].[PTRDate]'
                        WHEN 'PTRDate DESC' THEN '[ERP_TransporterBill].[PTRDate] DESC'
                        WHEN 'BankVCHNo' THEN '[ERP_TransporterBill].[BankVCHNo]'
                        WHEN 'BankVCHNo DESC' THEN '[ERP_TransporterBill].[BankVCHNo] DESC'
                        WHEN 'BankVCHAmount' THEN '[ERP_TransporterBill].[BankVCHAmount]'
                        WHEN 'BankVCHAmount DESC' THEN '[ERP_TransporterBill].[BankVCHAmount] DESC'
                        WHEN 'BankVCHDate' THEN '[ERP_TransporterBill].[BankVCHDate]'
                        WHEN 'BankVCHDate DESC' THEN '[ERP_TransporterBill].[BankVCHDate] DESC'
                        WHEN 'AccountsRemarks' THEN '[ERP_TransporterBill].[AccountsRemarks]'
                        WHEN 'AccountsRemarks DESC' THEN '[ERP_TransporterBill].[AccountsRemarks] DESC'
                        WHEN 'LgstRemarks' THEN '[ERP_TransporterBill].[LgstRemarks]'
                        WHEN 'LgstRemarks DESC' THEN '[ERP_TransporterBill].[LgstRemarks] DESC'
                        WHEN 'BillStatus' THEN '[ERP_TransporterBill].[BillStatus]'
                        WHEN 'BillStatus DESC' THEN '[ERP_TransporterBill].[BillStatus] DESC'
                        WHEN 'ChequeNo' THEN '[ERP_TransporterBill].[ChequeNo]'
                        WHEN 'ChequeNo DESC' THEN '[ERP_TransporterBill].[ChequeNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'aspnet_Users4_UserFullName' THEN '[aspnet_Users4].[UserFullName]'
                        WHEN 'aspnet_Users4_UserFullName DESC' THEN '[aspnet_Users4].[UserFullName] DESC'
                        WHEN 'aspnet_Users5_UserFullName' THEN '[aspnet_Users5].[UserFullName]'
                        WHEN 'aspnet_Users5_UserFullName DESC' THEN '[aspnet_Users5].[UserFullName] DESC'
                        WHEN 'aspnet_Users6_UserFullName' THEN '[aspnet_Users6].[UserFullName]'
                        WHEN 'aspnet_Users6_UserFullName DESC' THEN '[aspnet_Users6].[UserFullName] DESC'
                        WHEN 'aspnet_Users7_UserFullName' THEN '[aspnet_Users7].[UserFullName]'
                        WHEN 'aspnet_Users7_UserFullName DESC' THEN '[aspnet_Users7].[UserFullName] DESC'
                        WHEN 'ERP_TPTBillStatus8_Description' THEN '[ERP_TPTBillStatus8].[Description]'
                        WHEN 'ERP_TPTBillStatus8_Description DESC' THEN '[ERP_TPTBillStatus8].[Description] DESC'
                        WHEN 'IDM_Projects9_Description' THEN '[IDM_Projects9].[Description]'
                        WHEN 'IDM_Projects9_Description DESC' THEN '[IDM_Projects9].[Description] DESC'
                        WHEN 'VR_Transporters10_TransporterName' THEN '[VR_Transporters10].[TransporterName]'
                        WHEN 'VR_Transporters10_TransporterName DESC' THEN '[VR_Transporters10].[TransporterName] DESC'
                        ELSE '[ERP_TransporterBill].[SerialNo]'
                    END
  EXEC (@LGSQL)

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

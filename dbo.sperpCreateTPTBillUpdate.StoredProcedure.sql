USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpCreateTPTBillUpdate]
  @Original_SerialNo Int, 
  @IRNumber NVarChar(10),
  @TPTBillNo NVarChar(30),
  @TPTBillDate DateTime,
  @TPTBillReceivedOn DateTime,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @GRNos NVarChar(500),
  @TPTCode NVarChar(9),
  @PONumber NVarChar(9),
  @ProjectID NVarChar(6),
  @TPTBillAmount Decimal(18,2),
  @BasicFreightValue Decimal(18,2),
  @BasicFvODC Decimal(18,2),
  @DetentionatLP Decimal(18,2),
  @DetentionatULP Decimal(18,2),
	@DetentionatDaysLP	decimal(8, 2),
	@LPisISGECWorks	bit,
	@DetentionatDaysULP	decimal(8, 2),
	@ULPisICDCFSPort	bit,
	@BackToTownCharges	decimal(18, 2),
	@TarpaulinCharges	decimal(18, 2),
	@WoodenSleeperCharges	decimal(18, 2),
  @ODCChargesInContract Decimal(18,2),
  @ODCChargesOutOfContract Decimal(18,2),
  @EmptyReturnCharges Decimal(18,2),
  @RTOChallanAmount Decimal(18,2),
  @OtherAmount Decimal(18,2),
  @ServiceTax Decimal(18,2),
  @TotalBillPassedAmount Decimal(18,2),
  @FWDToAccountsOn DateTime,
  @FWDToAccountsBy NVarChar(8),
  @RECDByAccountsOn DateTime,
  @RECDinAccountsBy NVarChar(8),
  @DiscReturnedByACOn DateTime,
  @DiscReturnedinAcBy NVarChar(8),
  @DiscReturnedToByAC NVarChar(8),
  @DiscRecdInLgstBy NVarChar(8),
  @DiscRecdInLgstOn DateTime,
  @ReFwdToAcBy NVarChar(8),
  @ReFwdToACOn DateTime,
  @PTRNo NVarChar(10),
  @PTRAmount Decimal(18,2),
  @PTRDate DateTime,
  @BankVCHNo NVarChar(15),
  @BankVCHAmount Decimal(18,2),
  @BankVCHDate DateTime,
  @AccountsRemarks NVarChar(500),
  @LgstRemarks NVarChar(500),
  @BillStatus Int,
  @ChequeNo NVarChar(20),
  @ReasonID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_TransporterBill] SET 
   [TPTBillNo] = @TPTBillNo
  ,[IRNumber] = @IRNumber 
  ,[TPTBillDate] = @TPTBillDate
  ,[TPTBillReceivedOn] = @TPTBillReceivedOn
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[GRNos] = @GRNos
  ,[TPTCode] = @TPTCode
  ,[PONumber] = @PONumber
  ,[ProjectID] = @ProjectID
  ,[TPTBillAmount] = @TPTBillAmount
  ,[BasicFreightValue] = @BasicFreightValue
  ,[BasicFvODC] = @BasicFvODC
  ,[DetentionatLP] = @DetentionatLP
  ,[DetentionatULP] = @DetentionatULP
  ,[ODCChargesInContract] = @ODCChargesInContract
  ,[ODCChargesOutOfContract] = @ODCChargesOutOfContract
  ,[EmptyReturnCharges] = @EmptyReturnCharges
  ,[RTOChallanAmount] = @RTOChallanAmount
  ,[OtherAmount] = @OtherAmount
  ,[ServiceTax] = @ServiceTax
  ,[TotalBillPassedAmount] = @TotalBillPassedAmount
  ,[FWDToAccountsOn] = @FWDToAccountsOn
  ,[FWDToAccountsBy] = @FWDToAccountsBy
  ,[RECDByAccountsOn] = @RECDByAccountsOn
  ,[RECDinAccountsBy] = @RECDinAccountsBy
  ,[DiscReturnedByACOn] = @DiscReturnedByACOn
  ,[DiscReturnedinAcBy] = @DiscReturnedinAcBy
  ,[DiscReturnedToByAC] = @DiscReturnedToByAC
  ,[DiscRecdInLgstBy] = @DiscRecdInLgstBy
  ,[DiscRecdInLgstOn] = @DiscRecdInLgstOn
  ,[ReFwdToAcBy] = @ReFwdToAcBy
  ,[ReFwdToACOn] = @ReFwdToACOn
  ,[PTRNo] = @PTRNo
  ,[PTRAmount] = @PTRAmount
  ,[PTRDate] = @PTRDate
  ,[BankVCHNo] = @BankVCHNo
  ,[BankVCHAmount] = @BankVCHAmount
  ,[BankVCHDate] = @BankVCHDate
  ,[AccountsRemarks] = @AccountsRemarks
  ,[LgstRemarks] = @LgstRemarks
  ,[BillStatus] = @BillStatus
  ,[ChequeNo] = @ChequeNo
	,[ReasonID] = @ReasonID 
	,DetentionatDaysLP	=	@DetentionatDaysLP
	,LPisISGECWorks	=	@LPisISGECWorks
	,DetentionatDaysULP	=	@DetentionatDaysULP
	,ULPisICDCFSPort	=	@ULPisICDCFSPort
	,BackToTownCharges	=	@BackToTownCharges
	,TarpaulinCharges	=	@TarpaulinCharges
	,WoodenSleeperCharges	=	@WoodenSleeperCharges
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

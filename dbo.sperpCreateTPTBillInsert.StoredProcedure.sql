USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpCreateTPTBillInsert]
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
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [ERP_TransporterBill]
  (
   [TPTBillNo]
	,[IRNumber]
  ,[TPTBillDate]
  ,[TPTBillReceivedOn]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[GRNos]
  ,[TPTCode]
  ,[PONumber]
  ,[ProjectID]
  ,[TPTBillAmount]
  ,[BasicFreightValue]
  ,[BasicFvODC]
  ,[DetentionatLP]
  ,[DetentionatULP]
  ,[ODCChargesInContract]
  ,[ODCChargesOutOfContract]
  ,[EmptyReturnCharges]
  ,[RTOChallanAmount]
  ,[OtherAmount]
  ,[ServiceTax]
  ,[TotalBillPassedAmount]
  ,[FWDToAccountsOn]
  ,[FWDToAccountsBy]
  ,[RECDByAccountsOn]
  ,[RECDinAccountsBy]
  ,[DiscReturnedByACOn]
  ,[DiscReturnedinAcBy]
  ,[DiscReturnedToByAC]
  ,[DiscRecdInLgstBy]
  ,[DiscRecdInLgstOn]
  ,[ReFwdToAcBy]
  ,[ReFwdToACOn]
  ,[PTRNo]
  ,[PTRAmount]
  ,[PTRDate]
  ,[BankVCHNo]
  ,[BankVCHAmount]
  ,[BankVCHDate]
  ,[AccountsRemarks]
  ,[LgstRemarks]
  ,[BillStatus]
  ,[ChequeNo]
	,[ReasonID]
,DetentionatDaysLP
,LPisISGECWorks
,DetentionatDaysULP
,ULPisICDCFSPort
,BackToTownCharges
,TarpaulinCharges
,WoodenSleeperCharges
  )
  VALUES
  (
   @TPTBillNo
	,@IRNumber
  ,@TPTBillDate
  ,@TPTBillReceivedOn
  ,@CreatedBy
  ,@CreatedOn
  ,@GRNos
  ,@TPTCode
  ,@PONumber
  ,@ProjectID
  ,@TPTBillAmount
  ,@BasicFreightValue
  ,@BasicFvODC
  ,@DetentionatLP
  ,@DetentionatULP
  ,@ODCChargesInContract
  ,@ODCChargesOutOfContract
  ,@EmptyReturnCharges
  ,@RTOChallanAmount
  ,@OtherAmount
  ,@ServiceTax
  ,@TotalBillPassedAmount
  ,@FWDToAccountsOn
  ,@FWDToAccountsBy
  ,@RECDByAccountsOn
  ,@RECDinAccountsBy
  ,@DiscReturnedByACOn
  ,@DiscReturnedinAcBy
  ,@DiscReturnedToByAC
  ,@DiscRecdInLgstBy
  ,@DiscRecdInLgstOn
  ,@ReFwdToAcBy
  ,@ReFwdToACOn
  ,@PTRNo
  ,@PTRAmount
  ,@PTRDate
  ,@BankVCHNo
  ,@BankVCHAmount
  ,@BankVCHDate
  ,@AccountsRemarks
  ,@LgstRemarks
  ,@BillStatus
  ,@ChequeNo
	,@ReasonID 
,@DetentionatDaysLP
,@LPisISGECWorks
,@DetentionatDaysULP
,@ULPisICDCFSPort
,@BackToTownCharges
,@TarpaulinCharges
,@WoodenSleeperCharges
  )
  SET @Return_SerialNo = Scope_Identity()
GO

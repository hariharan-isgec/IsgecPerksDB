USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillDetailsInsert]
  @TABillNo Int,
  @ComponentID Int,
  @AutoCalculated Bit,
  @TourExtended Bit,
  @ProjectID NVarChar(6),
  @CostCenterID NVarChar(6),
  @CurrencyID NVarChar(6),
  @ConversionFactorINR Decimal(8,2),
  @City1ID NVarChar(30),
  @City1Text NVarChar(100),
  @City2ID NVarChar(30),
  @City2Text NVarChar(100),
  @Country1ID NVarChar(30),
  @Date1Time DateTime,
  @Country2ID NVarChar(30),
  @Date2Time DateTime,
  @ModeTravelID Int,
  @ModeLCID Int,
  @ModeExpenseID Int,
  @ModeFinanceID Int,
  @CityTypeID NVarChar(6),
  @ModeText NVarChar(100),
  @BoardingProvided Bit,
  @LodgingProvided Bit,
  @StayedWithRelative Bit,
  @StayedInGuestHouse Bit,
  @StayedAtSite Bit,
  @StayedInHotel Bit,
  @NotStayedAnyWhere Bit,
  @AirportToHotel Bit,
  @HotelToAirport Bit,
  @AirportToClientLocation Bit,
  @AmountFactor Decimal(8,2),
  @AmountRate Decimal(8,2),
  @AmountBasic Decimal(18,2),
  @AmountTax Decimal(18,2),
  @AmountTotal Decimal(18,2),
  @AmountInINR Decimal(18,2),
  @Remarks NVarChar(500),
  @PassedAmountFactor Decimal(8,2),
  @PassedAmountRate Decimal(8,2),
  @PassedAmountBasic Decimal(18,2),
  @PassedAmountTax Decimal(18,2),
  @PassedAmountTotal Decimal(18,2),
  @PassedAmountInINR Decimal(18,2),
  @AccountsRemarks NVarChar(500),
  @OOEBySystem Bit,
  @OOEByAccounts Bit,
  @OOEReasonID Int,
  @OOERemarks NVarChar(500),
  @ApprovalWFTypeID Int,
  @ApprovedBy NVarChar(8),
  @ApprovedOn DateTime,
  @ApprovalRemarks NVarChar(500),
  @Setteled Bit,
  @BillAttached Bit,
  @BillFileName NVarChar(100),
  @BillDiskFile NVarChar(250),
  @SanctionAttached Bit,
  @SanctionFileName NVarChar(100),
  @SanctionDiskFile NVarChar(250),
  @SystemText NVarChar(250),
  @AmountRateOU Decimal(18,2),
  @AmountTaxOU Decimal(18,2),
  @ConversionFactorOU Decimal(18,6),
  @CurrencyMain NVarChar(6),
  @Return_TABillNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_BillDetails]
  (
   [TABillNo]
  ,[ComponentID]
  ,[AutoCalculated]
  ,[TourExtended]
  ,[ProjectID]
  ,[CostCenterID]
  ,[CurrencyID]
  ,[ConversionFactorINR]
  ,[City1ID]
  ,[City1Text]
  ,[City2ID]
  ,[City2Text]
  ,[Country1ID]
  ,[Date1Time]
  ,[Country2ID]
  ,[Date2Time]
  ,[ModeTravelID]
  ,[ModeLCID]
  ,[ModeExpenseID]
  ,[ModeFinanceID]
  ,[CityTypeID]
  ,[ModeText]
  ,[BoardingProvided]
  ,[LodgingProvided]
  ,[StayedWithRelative]
  ,[StayedInGuestHouse]
  ,[StayedAtSite]
  ,[StayedInHotel]
  ,[NotStayedAnyWhere]
  ,[AirportToHotel]
  ,[HotelToAirport]
  ,[AirportToClientLocation]
  ,[AmountFactor]
  ,[AmountRate]
  ,[AmountBasic]
  ,[AmountTax]
  ,[AmountTotal]
  ,[AmountInINR]
  ,[Remarks]
  ,[PassedAmountFactor]
  ,[PassedAmountRate]
  ,[PassedAmountBasic]
  ,[PassedAmountTax]
  ,[PassedAmountTotal]
  ,[PassedAmountInINR]
  ,[AccountsRemarks]
  ,[OOEBySystem]
  ,[OOEByAccounts]
  ,[OOEReasonID]
  ,[OOERemarks]
  ,[ApprovalWFTypeID]
  ,[ApprovedBy]
  ,[ApprovedOn]
  ,[ApprovalRemarks]
  ,[Setteled]
  ,[BillAttached]
  ,[BillFileName]
  ,[BillDiskFile]
  ,[SanctionAttached]
  ,[SanctionFileName]
  ,[SanctionDiskFile]
  ,[SystemText]
  ,[AmountRateOU]
  ,[AmountTaxOU]
  ,[ConversionFactorOU]
  ,[CurrencyMain]
  )
  VALUES
  (
   @TABillNo
  ,@ComponentID
  ,@AutoCalculated
  ,@TourExtended
  ,@ProjectID
  ,@CostCenterID
  ,@CurrencyID
  ,@ConversionFactorINR
  ,@City1ID
  ,@City1Text
  ,@City2ID
  ,@City2Text
  ,@Country1ID
  ,@Date1Time
  ,@Country2ID
  ,@Date2Time
  ,@ModeTravelID
  ,@ModeLCID
  ,@ModeExpenseID
  ,@ModeFinanceID
  ,@CityTypeID
  ,@ModeText
  ,@BoardingProvided
  ,@LodgingProvided
  ,@StayedWithRelative
  ,@StayedInGuestHouse
  ,@StayedAtSite
  ,@StayedInHotel
  ,@NotStayedAnyWhere
  ,@AirportToHotel
  ,@HotelToAirport
  ,@AirportToClientLocation
  ,@AmountFactor
  ,@AmountRate
  ,@AmountBasic
  ,@AmountTax
  ,@AmountTotal
  ,@AmountInINR
  ,@Remarks
  ,@PassedAmountFactor
  ,@PassedAmountRate
  ,@PassedAmountBasic
  ,@PassedAmountTax
  ,@PassedAmountTotal
  ,@PassedAmountInINR
  ,@AccountsRemarks
  ,@OOEBySystem
  ,@OOEByAccounts
  ,@OOEReasonID
  ,@OOERemarks
  ,@ApprovalWFTypeID
  ,@ApprovedBy
  ,@ApprovedOn
  ,@ApprovalRemarks
  ,@Setteled
  ,@BillAttached
  ,@BillFileName
  ,@BillDiskFile
  ,@SanctionAttached
  ,@SanctionFileName
  ,@SanctionDiskFile
  ,@SystemText
  ,@AmountRateOU
  ,@AmountTaxOU
  ,@ConversionFactorOU
  ,@CurrencyMain
  )
  SET @Return_TABillNo = @TABillNo
  SET @Return_SerialNo = Scope_Identity()
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillDetailsUpdate]
  @Original_TABillNo Int, 
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_BillDetails] SET 
   [TABillNo] = @TABillNo
  ,[ComponentID] = @ComponentID
  ,[AutoCalculated] = @AutoCalculated
  ,[TourExtended] = @TourExtended
  ,[ProjectID] = @ProjectID
  ,[CostCenterID] = @CostCenterID
  ,[CurrencyID] = @CurrencyID
  ,[ConversionFactorINR] = @ConversionFactorINR
  ,[City1ID] = @City1ID
  ,[City1Text] = @City1Text
  ,[City2ID] = @City2ID
  ,[City2Text] = @City2Text
  ,[Country1ID] = @Country1ID
  ,[Date1Time] = @Date1Time
  ,[Country2ID] = @Country2ID
  ,[Date2Time] = @Date2Time
  ,[ModeTravelID] = @ModeTravelID
  ,[ModeLCID] = @ModeLCID
  ,[ModeExpenseID] = @ModeExpenseID
  ,[ModeFinanceID] = @ModeFinanceID
  ,[CityTypeID] = @CityTypeID
  ,[ModeText] = @ModeText
  ,[BoardingProvided] = @BoardingProvided
  ,[LodgingProvided] = @LodgingProvided
  ,[StayedWithRelative] = @StayedWithRelative
  ,[StayedInGuestHouse] = @StayedInGuestHouse
  ,[StayedAtSite] = @StayedAtSite
  ,[StayedInHotel] = @StayedInHotel
  ,[NotStayedAnyWhere] = @NotStayedAnyWhere
  ,[AirportToHotel] = @AirportToHotel
  ,[HotelToAirport] = @HotelToAirport
  ,[AirportToClientLocation] = @AirportToClientLocation
  ,[AmountFactor] = @AmountFactor
  ,[AmountRate] = @AmountRate
  ,[AmountBasic] = @AmountBasic
  ,[AmountTax] = @AmountTax
  ,[AmountTotal] = @AmountTotal
  ,[AmountInINR] = @AmountInINR
  ,[Remarks] = @Remarks
  ,[PassedAmountFactor] = @PassedAmountFactor
  ,[PassedAmountRate] = @PassedAmountRate
  ,[PassedAmountBasic] = @PassedAmountBasic
  ,[PassedAmountTax] = @PassedAmountTax
  ,[PassedAmountTotal] = @PassedAmountTotal
  ,[PassedAmountInINR] = @PassedAmountInINR
  ,[AccountsRemarks] = @AccountsRemarks
  ,[OOEBySystem] = @OOEBySystem
  ,[OOEByAccounts] = @OOEByAccounts
  ,[OOEReasonID] = @OOEReasonID
  ,[OOERemarks] = @OOERemarks
  ,[ApprovalWFTypeID] = @ApprovalWFTypeID
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  ,[ApprovalRemarks] = @ApprovalRemarks
  ,[Setteled] = @Setteled
  ,[BillAttached] = @BillAttached
  ,[BillFileName] = @BillFileName
  ,[BillDiskFile] = @BillDiskFile
  ,[SanctionAttached] = @SanctionAttached
  ,[SanctionFileName] = @SanctionFileName
  ,[SanctionDiskFile] = @SanctionDiskFile
  ,[SystemText] = @SystemText
  ,[AmountRateOU] = @AmountRateOU
  ,[AmountTaxOU] = @AmountTaxOU
  ,[ConversionFactorOU] = @ConversionFactorOU
  ,[CurrencyMain] = @CurrencyMain
  WHERE
  [TABillNo] = @Original_TABillNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

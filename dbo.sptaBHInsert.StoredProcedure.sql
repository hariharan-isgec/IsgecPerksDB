USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBHInsert]
  @OfficeID Int,
  @SiteName NVarChar(50),
  @SiteTransfer Bit,
  @CalculateDriverCharges Bit,
  @DepartureFromIndia DateTime,
  @ArrivalToIndia DateTime,
  @DestinationName NVarChar(50),
  @TrainingProgramResidential Bit,
  @PartialTABill Bit,
  @TravelTypeID Int,
  @CityOfOrigin NVarChar(30),
  @DestinationCity NVarChar(30),
  @ProjectID NVarChar(6),
  @TrainingProgram Bit,
  @SameDayVisit Bit,
  @Within25KM Bit,
  @SiteToAnotherSite Bit,
  @TaxiHired Bit,
  @OwnVehicleUsed Bit,
  @PurposeOfJourney NVarChar(500),
  @BriefTourReport NVarChar(500),
  @ComponentID Int,
  @ApprovalAttached Bit,
  @VerificationRemarks NVarChar(250),
  @EmployeeID NVarChar(8),
  @TACategoryID Int,
  @Contractual Bit,
  @SanctionedLodging Decimal(8,2),
  @ApprovedOn DateTime,
  @ApprovalRemarks NVarChar(500),
  @TotalFinancedAmount Decimal(18,2),
  @PostedOn DateTime,
  @SanctionFileName NVarChar(100),
  @CalculationTypeID NVarChar(10),
  @ReportDiskFile NVarChar(250),
  @DesignationID Int,
  @ApprovedByCC NVarChar(8),
  @CCRemarks NVarChar(250),
  @EndDateTime DateTime,
  @PostedBy NVarChar(8),
  @DivisionID NVarChar(6),
  @ReceivedOn DateTime,
  @ERPDocumentNo NVarChar(10),
  @OOEReasonID Int,
  @SanctionedDA Decimal(8,2),
  @PrjCalcType Int,
  @ReportAttached Bit,
  @StartDateTime DateTime,
  @ApprovalWFTypeID Int,
  @TotalClaimedAmount Decimal(18,2),
  @ApprovalFileName NVarChar(100),
  @SanctionDiskFile NVarChar(250),
  @TotalPayableAmount Decimal(18,2),
  @VerifiedOn DateTime,
  @ConversionFactorINR Decimal(8,2),
  @BillStatusID Int,
  @CostCenterID NVarChar(6),
  @ForwardedOn DateTime,
  @OOEByAccounts Bit,
  @CompanyID NVarChar(6),
  @SanctionAttached Bit,
  @OOERemarks NVarChar(500),
  @Setteled Bit,
  @ApprovedBySAOn DateTime,
  @ApprovedByCCOn DateTime,
  @BillCurrencyID NVarChar(6),
  @ApprovedBySA NVarChar(8),
  @SARemarks NVarChar(250),
  @TotalPassedAmount Decimal(18,2),
  @DepartmentID NVarChar(6),
  @ReportFileName NVarChar(100),
  @NonTechnical Bit,
  @ERPBatchNo NVarChar(10),
  @ApprovalDiskFile NVarChar(250),
  @ApprovedBy NVarChar(8),
  @OOEBySystem Bit,
  @VerifiedBy NVarChar(8),
  @VCHBy Nvarchar(8),
  @VCHOn DateTime,
  @VCHBatch NVarChar(50),
  @VCHDocument NVarChar(50),
  @VCHLine NVarChar(50),
  @Return_TABillNo Int = null OUTPUT 
  AS
  INSERT [TA_Bills]
  (
   [OfficeID]
  ,[SiteName]
  ,[SiteTransfer]
  ,[CalculateDriverCharges]
  ,[DepartureFromIndia]
  ,[ArrivalToIndia]
  ,[DestinationName]
  ,[TrainingProgramResidential]
  ,[PartialTABill]
  ,[TravelTypeID]
  ,[CityOfOrigin]
  ,[DestinationCity]
  ,[ProjectID]
  ,[TrainingProgram]
  ,[SameDayVisit]
  ,[Within25KM]
  ,[SiteToAnotherSite]
  ,[TaxiHired]
  ,[OwnVehicleUsed]
  ,[PurposeOfJourney]
  ,[BriefTourReport]
  ,[ComponentID]
  ,[ApprovalAttached]
  ,[VerificationRemarks]
  ,[EmployeeID]
  ,[TACategoryID]
  ,[Contractual]
  ,[SanctionedLodging]
  ,[ApprovedOn]
  ,[ApprovalRemarks]
  ,[TotalFinancedAmount]
  ,[PostedOn]
  ,[SanctionFileName]
  ,[CalculationTypeID]
  ,[ReportDiskFile]
  ,[DesignationID]
  ,[ApprovedByCC]
  ,[CCRemarks]
  ,[EndDateTime]
  ,[PostedBy]
  ,[DivisionID]
  ,[ReceivedOn]
  ,[ERPDocumentNo]
  ,[OOEReasonID]
  ,[SanctionedDA]
  ,[PrjCalcType]
  ,[ReportAttached]
  ,[StartDateTime]
  ,[ApprovalWFTypeID]
  ,[TotalClaimedAmount]
  ,[ApprovalFileName]
  ,[SanctionDiskFile]
  ,[TotalPayableAmount]
  ,[VerifiedOn]
  ,[ConversionFactorINR]
  ,[BillStatusID]
  ,[CostCenterID]
  ,[ForwardedOn]
  ,[OOEByAccounts]
  ,[CompanyID]
  ,[SanctionAttached]
  ,[OOERemarks]
  ,[Setteled]
  ,[ApprovedBySAOn]
  ,[ApprovedByCCOn]
  ,[BillCurrencyID]
  ,[ApprovedBySA]
  ,[SARemarks]
  ,[TotalPassedAmount]
  ,[DepartmentID]
  ,[ReportFileName]
  ,[NonTechnical]
  ,[ERPBatchNo]
  ,[ApprovalDiskFile]
  ,[ApprovedBy]
  ,[OOEBySystem]
  ,[VerifiedBy]
  ,[VCHBy]
  ,[VCHOn]
  ,[VCHBatch]
  ,[VCHDocument]
  ,[VCHLine]
  )
  VALUES
  (
   @OfficeID
  ,@SiteName
  ,@SiteTransfer
  ,@CalculateDriverCharges
  ,@DepartureFromIndia
  ,@ArrivalToIndia
  ,@DestinationName
  ,@TrainingProgramResidential
  ,@PartialTABill
  ,@TravelTypeID
  ,@CityOfOrigin
  ,@DestinationCity
  ,@ProjectID
  ,@TrainingProgram
  ,@SameDayVisit
  ,@Within25KM
  ,@SiteToAnotherSite
  ,@TaxiHired
  ,@OwnVehicleUsed
  ,@PurposeOfJourney
  ,@BriefTourReport
  ,@ComponentID
  ,@ApprovalAttached
  ,@VerificationRemarks
  ,@EmployeeID
  ,@TACategoryID
  ,@Contractual
  ,@SanctionedLodging
  ,@ApprovedOn
  ,@ApprovalRemarks
  ,@TotalFinancedAmount
  ,@PostedOn
  ,@SanctionFileName
  ,@CalculationTypeID
  ,@ReportDiskFile
  ,@DesignationID
  ,@ApprovedByCC
  ,@CCRemarks
  ,@EndDateTime
  ,@PostedBy
  ,@DivisionID
  ,@ReceivedOn
  ,@ERPDocumentNo
  ,@OOEReasonID
  ,@SanctionedDA
  ,@PrjCalcType
  ,@ReportAttached
  ,@StartDateTime
  ,@ApprovalWFTypeID
  ,@TotalClaimedAmount
  ,@ApprovalFileName
  ,@SanctionDiskFile
  ,@TotalPayableAmount
  ,@VerifiedOn
  ,@ConversionFactorINR
  ,@BillStatusID
  ,@CostCenterID
  ,@ForwardedOn
  ,@OOEByAccounts
  ,@CompanyID
  ,@SanctionAttached
  ,@OOERemarks
  ,@Setteled
  ,@ApprovedBySAOn
  ,@ApprovedByCCOn
  ,@BillCurrencyID
  ,@ApprovedBySA
  ,@SARemarks
  ,@TotalPassedAmount
  ,@DepartmentID
  ,@ReportFileName
  ,@NonTechnical
  ,@ERPBatchNo
  ,@ApprovalDiskFile
  ,@ApprovedBy
  ,@OOEBySystem
  ,@VerifiedBy
  ,@VCHBy
  ,@VCHOn
  ,@VCHBatch
  ,@VCHDocument
  ,@VCHLine
  )
  SET @Return_TABillNo = Scope_Identity()
GO

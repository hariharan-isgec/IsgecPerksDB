USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBHUpdate]
  @Original_TABillNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_Bills] SET 
   [OfficeID] = @OfficeID
  ,[SiteName] = @SiteName
  ,[SiteTransfer] = @SiteTransfer
  ,[CalculateDriverCharges] = @CalculateDriverCharges
  ,[DepartureFromIndia] = @DepartureFromIndia
  ,[ArrivalToIndia] = @ArrivalToIndia
  ,[DestinationName] = @DestinationName
  ,[TrainingProgramResidential] = @TrainingProgramResidential
  ,[PartialTABill] = @PartialTABill
  ,[TravelTypeID] = @TravelTypeID
  ,[CityOfOrigin] = @CityOfOrigin
  ,[DestinationCity] = @DestinationCity
  ,[ProjectID] = @ProjectID
  ,[TrainingProgram] = @TrainingProgram
  ,[SameDayVisit] = @SameDayVisit
  ,[Within25KM] = @Within25KM
  ,[SiteToAnotherSite] = @SiteToAnotherSite
  ,[TaxiHired] = @TaxiHired
  ,[OwnVehicleUsed] = @OwnVehicleUsed
  ,[PurposeOfJourney] = @PurposeOfJourney
  ,[BriefTourReport] = @BriefTourReport
  ,[ComponentID] = @ComponentID
  ,[ApprovalAttached] = @ApprovalAttached
  ,[VerificationRemarks] = @VerificationRemarks
  ,[EmployeeID] = @EmployeeID
  ,[TACategoryID] = @TACategoryID
  ,[Contractual] = @Contractual
  ,[SanctionedLodging] = @SanctionedLodging
  ,[ApprovedOn] = @ApprovedOn
  ,[ApprovalRemarks] = @ApprovalRemarks
  ,[TotalFinancedAmount] = @TotalFinancedAmount
  ,[PostedOn] = @PostedOn
  ,[SanctionFileName] = @SanctionFileName
  ,[CalculationTypeID] = @CalculationTypeID
  ,[ReportDiskFile] = @ReportDiskFile
  ,[DesignationID] = @DesignationID
  ,[ApprovedByCC] = @ApprovedByCC
  ,[CCRemarks] = @CCRemarks
  ,[EndDateTime] = @EndDateTime
  ,[PostedBy] = @PostedBy
  ,[DivisionID] = @DivisionID
  ,[ReceivedOn] = @ReceivedOn
  ,[ERPDocumentNo] = @ERPDocumentNo
  ,[OOEReasonID] = @OOEReasonID
  ,[SanctionedDA] = @SanctionedDA
  ,[PrjCalcType] = @PrjCalcType
  ,[ReportAttached] = @ReportAttached
  ,[StartDateTime] = @StartDateTime
  ,[ApprovalWFTypeID] = @ApprovalWFTypeID
  ,[TotalClaimedAmount] = @TotalClaimedAmount
  ,[ApprovalFileName] = @ApprovalFileName
  ,[SanctionDiskFile] = @SanctionDiskFile
  ,[TotalPayableAmount] = @TotalPayableAmount
  ,[VerifiedOn] = @VerifiedOn
  ,[ConversionFactorINR] = @ConversionFactorINR
  ,[BillStatusID] = @BillStatusID
  ,[CostCenterID] = @CostCenterID
  ,[ForwardedOn] = @ForwardedOn
  ,[OOEByAccounts] = @OOEByAccounts
  ,[CompanyID] = @CompanyID
  ,[SanctionAttached] = @SanctionAttached
  ,[OOERemarks] = @OOERemarks
  ,[Setteled] = @Setteled
  ,[ApprovedBySAOn] = @ApprovedBySAOn
  ,[ApprovedByCCOn] = @ApprovedByCCOn
  ,[BillCurrencyID] = @BillCurrencyID
  ,[ApprovedBySA] = @ApprovedBySA
  ,[SARemarks] = @SARemarks
  ,[TotalPassedAmount] = @TotalPassedAmount
  ,[DepartmentID] = @DepartmentID
  ,[ReportFileName] = @ReportFileName
  ,[NonTechnical] = @NonTechnical
  ,[ERPBatchNo] = @ERPBatchNo
  ,[ApprovalDiskFile] = @ApprovalDiskFile
  ,[ApprovedBy] = @ApprovedBy
  ,[OOEBySystem] = @OOEBySystem
  ,[VerifiedBy] = @VerifiedBy
  ,[VCHBy] = @VCHBy
  ,[VCHOn] = @VCHOn
  ,[VCHBatch] = @VCHBatch
  ,[VCHDocument] = @VCHDocument
  ,[VCHLine] = @VCHLine 
  WHERE
  [TABillNo] = @Original_TABillNo
  SET @RowCount = @@RowCount
GO

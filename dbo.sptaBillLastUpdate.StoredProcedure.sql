USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillLastUpdate]
  @Original_TABillNo Int, 
  @TABillNo Int,
  @EmployeeID NVarChar(8),
  @CompanyID NVarChar(6),
  @DivisionID NVarChar(6),
  @DepartmentID NVarChar(6),
  @DesignationID Int,
  @TACategoryID Int,
  @Contractual Bit,
  @NonTechnical Bit,
  @TravelTypeID Int,
  @PurposeOfJourney NVarChar(500),
  @CityOfOrigin NVarChar(30),
  @DestinationCity NVarChar(30),
  @CostCenterID NVarChar(6),
  @BillCurrencyID NVarChar(6),
  @ProjectID NVarChar(6),
  @TrainingProgram Bit,
  @SameDayVisit Bit,
  @Within25KM Bit,
  @SiteToAnotherSite Bit,
  @TaxiHired Bit,
  @OwnVehicleUsed Bit,
  @BillStatusID Int,
  @StartDateTime DateTime,
  @EndDateTime DateTime,
  @SanctionedDA Decimal(8,2),
  @SanctionedLodging Decimal(8,2),
  @TotalClaimedAmount Decimal(18,2),
  @TotalPassedAmount Decimal(18,2),
  @TotalFinancedAmount Decimal(18,2),
  @TotalPayableAmount Decimal(18,2),
  @ConversionFactorINR Decimal(18,6),
  @OOEBySystem Bit,
  @OOEByAccounts Bit,
  @OOEReasonID Int,
  @OOERemarks NVarChar(500),
  @ApprovalWFTypeID Int,
  @ApprovedBy NVarChar(8),
  @ApprovedOn DateTime,
  @ApprovalRemarks NVarChar(500),
  @Setteled Bit,
  @BriefTourReport NVarChar(500),
  @ApprovedByCC NVarChar(8),
  @ApprovedByCCOn DateTime,
  @CCRemarks NVarChar(250),
  @ApprovedBySA NVarChar(8),
  @ApprovedBySAOn DateTime,
  @SARemarks NVarChar(250),
  @VerifiedBy NVarChar(8),
  @VerifiedOn DateTime,
  @VerificationRemarks NVarChar(250),
  @PostedBy NVarChar(8),
  @PostedOn DateTime,
  @ERPBatchNo NVarChar(10),
  @ERPDocumentNo NVarChar(10),
  @ReportAttached Bit,
  @SanctionAttached Bit,
  @ApprovalAttached Bit,
  @ReportFileName NVarChar(100),
  @SanctionFileName NVarChar(100),
  @ApprovalFileName NVarChar(100),
  @ReportDiskFile NVarChar(250),
  @SanctionDiskFile NVarChar(250),
  @ApprovalDiskFile NVarChar(250),
  @ForwardedOn DateTime,
  @ReceivedOn DateTime,
  @ComponentID Int,
  @CalculationTypeID NVarChar(10),
  @PrjCalcType Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_BillLast] SET 
   [TABillNo] = @TABillNo
  ,[EmployeeID] = @EmployeeID
  ,[CompanyID] = @CompanyID
  ,[DivisionID] = @DivisionID
  ,[DepartmentID] = @DepartmentID
  ,[DesignationID] = @DesignationID
  ,[TACategoryID] = @TACategoryID
  ,[Contractual] = @Contractual
  ,[NonTechnical] = @NonTechnical
  ,[TravelTypeID] = @TravelTypeID
  ,[PurposeOfJourney] = @PurposeOfJourney
  ,[CityOfOrigin] = @CityOfOrigin
  ,[DestinationCity] = @DestinationCity
  ,[CostCenterID] = @CostCenterID
  ,[BillCurrencyID] = @BillCurrencyID
  ,[ProjectID] = @ProjectID
  ,[TrainingProgram] = @TrainingProgram
  ,[SameDayVisit] = @SameDayVisit
  ,[Within25KM] = @Within25KM
  ,[SiteToAnotherSite] = @SiteToAnotherSite
  ,[TaxiHired] = @TaxiHired
  ,[OwnVehicleUsed] = @OwnVehicleUsed
  ,[BillStatusID] = @BillStatusID
  ,[StartDateTime] = @StartDateTime
  ,[EndDateTime] = @EndDateTime
  ,[SanctionedDA] = @SanctionedDA
  ,[SanctionedLodging] = @SanctionedLodging
  ,[TotalClaimedAmount] = @TotalClaimedAmount
  ,[TotalPassedAmount] = @TotalPassedAmount
  ,[TotalFinancedAmount] = @TotalFinancedAmount
  ,[TotalPayableAmount] = @TotalPayableAmount
  ,[ConversionFactorINR] = @ConversionFactorINR
  ,[OOEBySystem] = @OOEBySystem
  ,[OOEByAccounts] = @OOEByAccounts
  ,[OOEReasonID] = @OOEReasonID
  ,[OOERemarks] = @OOERemarks
  ,[ApprovalWFTypeID] = @ApprovalWFTypeID
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  ,[ApprovalRemarks] = @ApprovalRemarks
  ,[Setteled] = @Setteled
  ,[BriefTourReport] = @BriefTourReport
  ,[ApprovedByCC] = @ApprovedByCC
  ,[ApprovedByCCOn] = @ApprovedByCCOn
  ,[CCRemarks] = @CCRemarks
  ,[ApprovedBySA] = @ApprovedBySA
  ,[ApprovedBySAOn] = @ApprovedBySAOn
  ,[SARemarks] = @SARemarks
  ,[VerifiedBy] = @VerifiedBy
  ,[VerifiedOn] = @VerifiedOn
  ,[VerificationRemarks] = @VerificationRemarks
  ,[PostedBy] = @PostedBy
  ,[PostedOn] = @PostedOn
  ,[ERPBatchNo] = @ERPBatchNo
  ,[ERPDocumentNo] = @ERPDocumentNo
  ,[ReportAttached] = @ReportAttached
  ,[SanctionAttached] = @SanctionAttached
  ,[ApprovalAttached] = @ApprovalAttached
  ,[ReportFileName] = @ReportFileName
  ,[SanctionFileName] = @SanctionFileName
  ,[ApprovalFileName] = @ApprovalFileName
  ,[ReportDiskFile] = @ReportDiskFile
  ,[SanctionDiskFile] = @SanctionDiskFile
  ,[ApprovalDiskFile] = @ApprovalDiskFile
  ,[ForwardedOn] = @ForwardedOn
  ,[ReceivedOn] = @ReceivedOn
  ,[ComponentID] = @ComponentID
  ,[CalculationTypeID] = @CalculationTypeID
  ,[PrjCalcType] = @PrjCalcType
  WHERE
  [TABillNo] = @Original_TABillNo
  SET @RowCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillLastInsert]
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
  @Return_TABillNo Int = null OUTPUT 
  AS
  INSERT [TA_BillLast]
  (
   [TABillNo]
  ,[EmployeeID]
  ,[CompanyID]
  ,[DivisionID]
  ,[DepartmentID]
  ,[DesignationID]
  ,[TACategoryID]
  ,[Contractual]
  ,[NonTechnical]
  ,[TravelTypeID]
  ,[PurposeOfJourney]
  ,[CityOfOrigin]
  ,[DestinationCity]
  ,[CostCenterID]
  ,[BillCurrencyID]
  ,[ProjectID]
  ,[TrainingProgram]
  ,[SameDayVisit]
  ,[Within25KM]
  ,[SiteToAnotherSite]
  ,[TaxiHired]
  ,[OwnVehicleUsed]
  ,[BillStatusID]
  ,[StartDateTime]
  ,[EndDateTime]
  ,[SanctionedDA]
  ,[SanctionedLodging]
  ,[TotalClaimedAmount]
  ,[TotalPassedAmount]
  ,[TotalFinancedAmount]
  ,[TotalPayableAmount]
  ,[ConversionFactorINR]
  ,[OOEBySystem]
  ,[OOEByAccounts]
  ,[OOEReasonID]
  ,[OOERemarks]
  ,[ApprovalWFTypeID]
  ,[ApprovedBy]
  ,[ApprovedOn]
  ,[ApprovalRemarks]
  ,[Setteled]
  ,[BriefTourReport]
  ,[ApprovedByCC]
  ,[ApprovedByCCOn]
  ,[CCRemarks]
  ,[ApprovedBySA]
  ,[ApprovedBySAOn]
  ,[SARemarks]
  ,[VerifiedBy]
  ,[VerifiedOn]
  ,[VerificationRemarks]
  ,[PostedBy]
  ,[PostedOn]
  ,[ERPBatchNo]
  ,[ERPDocumentNo]
  ,[ReportAttached]
  ,[SanctionAttached]
  ,[ApprovalAttached]
  ,[ReportFileName]
  ,[SanctionFileName]
  ,[ApprovalFileName]
  ,[ReportDiskFile]
  ,[SanctionDiskFile]
  ,[ApprovalDiskFile]
  ,[ForwardedOn]
  ,[ReceivedOn]
  ,[ComponentID]
  ,[CalculationTypeID]
  ,[PrjCalcType]
  )
  VALUES
  (
   @TABillNo
  ,@EmployeeID
  ,@CompanyID
  ,@DivisionID
  ,@DepartmentID
  ,@DesignationID
  ,@TACategoryID
  ,@Contractual
  ,@NonTechnical
  ,@TravelTypeID
  ,@PurposeOfJourney
  ,@CityOfOrigin
  ,@DestinationCity
  ,@CostCenterID
  ,@BillCurrencyID
  ,@ProjectID
  ,@TrainingProgram
  ,@SameDayVisit
  ,@Within25KM
  ,@SiteToAnotherSite
  ,@TaxiHired
  ,@OwnVehicleUsed
  ,@BillStatusID
  ,@StartDateTime
  ,@EndDateTime
  ,@SanctionedDA
  ,@SanctionedLodging
  ,@TotalClaimedAmount
  ,@TotalPassedAmount
  ,@TotalFinancedAmount
  ,@TotalPayableAmount
  ,@ConversionFactorINR
  ,@OOEBySystem
  ,@OOEByAccounts
  ,@OOEReasonID
  ,@OOERemarks
  ,@ApprovalWFTypeID
  ,@ApprovedBy
  ,@ApprovedOn
  ,@ApprovalRemarks
  ,@Setteled
  ,@BriefTourReport
  ,@ApprovedByCC
  ,@ApprovedByCCOn
  ,@CCRemarks
  ,@ApprovedBySA
  ,@ApprovedBySAOn
  ,@SARemarks
  ,@VerifiedBy
  ,@VerifiedOn
  ,@VerificationRemarks
  ,@PostedBy
  ,@PostedOn
  ,@ERPBatchNo
  ,@ERPDocumentNo
  ,@ReportAttached
  ,@SanctionAttached
  ,@ApprovalAttached
  ,@ReportFileName
  ,@SanctionFileName
  ,@ApprovalFileName
  ,@ReportDiskFile
  ,@SanctionDiskFile
  ,@ApprovalDiskFile
  ,@ForwardedOn
  ,@ReceivedOn
  ,@ComponentID
  ,@CalculationTypeID
  ,@PrjCalcType
  )
  SET @Return_TABillNo = @TABillNo
GO

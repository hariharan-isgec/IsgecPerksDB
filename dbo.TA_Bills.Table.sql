USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_Bills](
	[TABillNo] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](8) NOT NULL,
	[CompanyID] [nvarchar](6) NULL,
	[DivisionID] [nvarchar](6) NULL,
	[DepartmentID] [nvarchar](6) NULL,
	[DesignationID] [int] NULL,
	[TACategoryID] [int] NULL,
	[Contractual] [bit] NOT NULL,
	[NonTechnical] [bit] NOT NULL,
	[TravelTypeID] [int] NOT NULL,
	[PurposeOfJourney] [nvarchar](500) NOT NULL,
	[CityOfOrigin] [nvarchar](30) NULL,
	[DestinationCity] [nvarchar](30) NULL,
	[CostCenterID] [nvarchar](6) NULL,
	[BillCurrencyID] [nvarchar](6) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[TrainingProgram] [bit] NOT NULL,
	[SameDayVisit] [bit] NOT NULL,
	[Within25KM] [bit] NOT NULL,
	[SiteToAnotherSite] [bit] NOT NULL,
	[TaxiHired] [bit] NOT NULL,
	[OwnVehicleUsed] [bit] NOT NULL,
	[BillStatusID] [int] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[SanctionedDA] [decimal](8, 2) NOT NULL,
	[SanctionedLodging] [decimal](8, 2) NOT NULL,
	[TotalClaimedAmount] [decimal](18, 2) NOT NULL,
	[TotalPassedAmount] [decimal](18, 2) NOT NULL,
	[TotalFinancedAmount] [decimal](18, 2) NOT NULL,
	[TotalPayableAmount] [decimal](18, 2) NOT NULL,
	[ConversionFactorINR] [decimal](18, 6) NOT NULL,
	[OOEBySystem] [bit] NOT NULL,
	[OOEByAccounts] [bit] NOT NULL,
	[OOEReasonID] [int] NULL,
	[OOERemarks] [nvarchar](500) NULL,
	[ApprovalWFTypeID] [int] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovalRemarks] [nvarchar](500) NULL,
	[Setteled] [bit] NOT NULL,
	[BriefTourReport] [nvarchar](500) NULL,
	[ApprovedByCC] [nvarchar](8) NULL,
	[ApprovedByCCOn] [datetime] NULL,
	[CCRemarks] [nvarchar](250) NULL,
	[ApprovedBySA] [nvarchar](8) NULL,
	[ApprovedBySAOn] [datetime] NULL,
	[SARemarks] [nvarchar](250) NULL,
	[VerifiedBy] [nvarchar](8) NULL,
	[VerifiedOn] [datetime] NULL,
	[VerificationRemarks] [nvarchar](250) NULL,
	[PostedBy] [nvarchar](8) NULL,
	[PostedOn] [datetime] NULL,
	[ERPBatchNo] [nvarchar](10) NULL,
	[ERPDocumentNo] [nvarchar](10) NULL,
	[ReportAttached] [bit] NOT NULL,
	[SanctionAttached] [bit] NOT NULL,
	[ApprovalAttached] [bit] NOT NULL,
	[ReportFileName] [nvarchar](100) NULL,
	[SanctionFileName] [nvarchar](100) NULL,
	[ApprovalFileName] [nvarchar](100) NULL,
	[ReportDiskFile] [nvarchar](250) NULL,
	[SanctionDiskFile] [nvarchar](250) NULL,
	[ApprovalDiskFile] [nvarchar](250) NULL,
	[ForwardedOn] [datetime] NULL,
	[ReceivedOn] [datetime] NULL,
	[ComponentID] [int] NOT NULL,
	[CalculationTypeID] [nvarchar](10) NULL,
	[PrjCalcType] [int] NULL,
	[OfficeID] [int] NULL,
	[SiteName] [nvarchar](50) NULL,
	[SiteTransfer] [bit] NOT NULL,
	[CalculateDriverCharges] [bit] NOT NULL,
	[DepartureFromIndia] [datetime] NULL,
	[ArrivalToIndia] [datetime] NULL,
	[DestinationName] [nvarchar](50) NULL,
	[TrainingProgramResidential] [bit] NOT NULL,
	[PartialTABill] [bit] NOT NULL,
	[VCHBy] [nvarchar](8) NULL,
	[VCHOn] [datetime] NULL,
	[VCHBatch] [nvarchar](50) NULL,
	[VCHDocument] [nvarchar](50) NULL,
	[VCHLine] [nvarchar](50) NULL,
 CONSTRAINT [PK_TA_Bills] PRIMARY KEY CLUSTERED 
(
	[TABillNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_ApprovalWFTypeID] FOREIGN KEY([ApprovalWFTypeID])
REFERENCES [dbo].[TA_ApprovalWFTypes] ([WFTypeID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_ApprovalWFTypeID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_ApprovedBy]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_ApprovedByCC] FOREIGN KEY([ApprovedByCC])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_ApprovedByCC]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_ApprovedBySA] FOREIGN KEY([ApprovedBySA])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_ApprovedBySA]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_BillStatusID] FOREIGN KEY([BillStatusID])
REFERENCES [dbo].[TA_BillStates] ([BillStatusID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_BillStatusID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_CalculationTypeID] FOREIGN KEY([CalculationTypeID])
REFERENCES [dbo].[TA_CalcMethod] ([CalculationTypeID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_CalculationTypeID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_CityOfOrigin] FOREIGN KEY([CityOfOrigin])
REFERENCES [dbo].[TA_Cities] ([CityID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_CityOfOrigin]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[HRM_Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_CompanyID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_ComponentID] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[TA_Components] ([ComponentID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_ComponentID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_CostCenterID] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_CostCenterID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_CurrencyID] FOREIGN KEY([BillCurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_CurrencyID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_DepartmentID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_DesignationID] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[HRM_Designations] ([DesignationID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_DesignationID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_DestinationCity] FOREIGN KEY([DestinationCity])
REFERENCES [dbo].[TA_Cities] ([CityID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_DestinationCity]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_DivisionID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_EmployeeID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_OOEReasonID] FOREIGN KEY([OOEReasonID])
REFERENCES [dbo].[TA_OOEReasons] ([ReasonID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_OOEReasonID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_PostedBy] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_PostedBy]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_PrjCalculationType] FOREIGN KEY([PrjCalcType])
REFERENCES [dbo].[TA_PrjCalcMethod] ([ProjectCalcID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_PrjCalculationType]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_ProjectID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_TACategoryID] FOREIGN KEY([TACategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_TACategoryID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_TravelTypeID] FOREIGN KEY([TravelTypeID])
REFERENCES [dbo].[TA_TravelTypes] ([TravelTypeID])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_TravelTypeID]
GO
ALTER TABLE [dbo].[TA_Bills]  WITH CHECK ADD  CONSTRAINT [FK_TA_Bills_VerifiedBy] FOREIGN KEY([VerifiedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_Bills] CHECK CONSTRAINT [FK_TA_Bills_VerifiedBy]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_Contractual]  DEFAULT ((0)) FOR [Contractual]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_NonTechnical]  DEFAULT ((1)) FOR [NonTechnical]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TrainingProgram]  DEFAULT ((0)) FOR [TrainingProgram]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TrainingProgram6]  DEFAULT ((0)) FOR [SameDayVisit]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TrainingProgram5]  DEFAULT ((0)) FOR [Within25KM]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TrainingProgram4]  DEFAULT ((0)) FOR [SiteToAnotherSite]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TrainingProgram3]  DEFAULT ((0)) FOR [TaxiHired]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TrainingProgram2]  DEFAULT ((0)) FOR [OwnVehicleUsed]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_SanctionedLodging1]  DEFAULT ((0)) FOR [SanctionedDA]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TotalPayableAmount1]  DEFAULT ((0)) FOR [SanctionedLodging]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TotalClaimedAmount]  DEFAULT ((0)) FOR [TotalClaimedAmount]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TotalClaimedAmount1]  DEFAULT ((0)) FOR [TotalPassedAmount]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TotalPassedAmount1]  DEFAULT ((0)) FOR [TotalFinancedAmount]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TotalPassedAmount1_1]  DEFAULT ((0)) FOR [TotalPayableAmount]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_ConversionFactorINR]  DEFAULT ((0)) FOR [ConversionFactorINR]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_OOEBySystem]  DEFAULT ((0)) FOR [OOEBySystem]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_OOEBySystem1]  DEFAULT ((0)) FOR [OOEByAccounts]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_Setteled]  DEFAULT ((0)) FOR [Setteled]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_OOEBySystem1_1]  DEFAULT ((0)) FOR [ReportAttached]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_OOEBySystem1_2]  DEFAULT ((0)) FOR [SanctionAttached]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_SpecialApprovalAttached]  DEFAULT ((0)) FOR [ApprovalAttached]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_ComponentID]  DEFAULT ((1)) FOR [ComponentID]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_SiteTransfer]  DEFAULT ((0)) FOR [SiteTransfer]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_CalculateDriverCharges]  DEFAULT ((0)) FOR [CalculateDriverCharges]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_TrainingProgramResidential]  DEFAULT ((0)) FOR [TrainingProgramResidential]
GO
ALTER TABLE [dbo].[TA_Bills] ADD  CONSTRAINT [DF_TA_Bills_PartialTABill]  DEFAULT ((0)) FOR [PartialTABill]
GO

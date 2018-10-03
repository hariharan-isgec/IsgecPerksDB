USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_BillLast](
	[TABillNo] [int] NOT NULL,
	[EmployeeID] [nvarchar](8) NOT NULL,
	[CompanyID] [nvarchar](6) NULL,
	[DivisionID] [nvarchar](6) NULL,
	[DepartmentID] [nvarchar](6) NULL,
	[DesignationID] [int] NULL,
	[TACategoryID] [int] NULL,
	[Contractual] [bit] NOT NULL,
	[NonTechnical] [bit] NOT NULL,
	[TravelTypeID] [int] NOT NULL,
	[PurposeOfJourney] [nvarchar](500) NULL,
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
 CONSTRAINT [PK_TA_BillLast] PRIMARY KEY CLUSTERED 
(
	[TABillNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_ApprovalWFTypeID] FOREIGN KEY([ApprovalWFTypeID])
REFERENCES [dbo].[TA_ApprovalWFTypes] ([WFTypeID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_ApprovalWFTypeID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_ApprovedBy]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_ApprovedByCC] FOREIGN KEY([ApprovedByCC])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_ApprovedByCC]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_ApprovedBySA] FOREIGN KEY([ApprovedBySA])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_ApprovedBySA]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_BillStatusID] FOREIGN KEY([BillStatusID])
REFERENCES [dbo].[TA_BillStates] ([BillStatusID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_BillStatusID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_CalculationTypeID] FOREIGN KEY([CalculationTypeID])
REFERENCES [dbo].[TA_CalcMethod] ([CalculationTypeID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_CalculationTypeID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_CityOfOrigin] FOREIGN KEY([CityOfOrigin])
REFERENCES [dbo].[TA_Cities] ([CityID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_CityOfOrigin]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[HRM_Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_CompanyID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_ComponentID] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[TA_Components] ([ComponentID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_ComponentID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_CostCenterID] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_CostCenterID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_CurrencyID] FOREIGN KEY([BillCurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_CurrencyID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_DepartmentID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_DesignationID] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[HRM_Designations] ([DesignationID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_DesignationID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_DestinationCity] FOREIGN KEY([DestinationCity])
REFERENCES [dbo].[TA_Cities] ([CityID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_DestinationCity]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_DivisionID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_EmployeeID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_OOEReasonID] FOREIGN KEY([OOEReasonID])
REFERENCES [dbo].[TA_OOEReasons] ([ReasonID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_OOEReasonID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_PostedBy] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_PostedBy]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_PrjCalculationType] FOREIGN KEY([PrjCalcType])
REFERENCES [dbo].[TA_PrjCalcMethod] ([ProjectCalcID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_PrjCalculationType]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_ProjectID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_TACategoryID] FOREIGN KEY([TACategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_TACategoryID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_TravelTypeID] FOREIGN KEY([TravelTypeID])
REFERENCES [dbo].[TA_TravelTypes] ([TravelTypeID])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_TravelTypeID]
GO
ALTER TABLE [dbo].[TA_BillLast]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillLast_VerifiedBy] FOREIGN KEY([VerifiedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_BillLast] CHECK CONSTRAINT [FK_TA_BillLast_VerifiedBy]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_Contractual]  DEFAULT ((0)) FOR [Contractual]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_NonTechnical]  DEFAULT ((1)) FOR [NonTechnical]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TrainingProgram]  DEFAULT ((0)) FOR [TrainingProgram]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TrainingProgram6]  DEFAULT ((0)) FOR [SameDayVisit]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TrainingProgram5]  DEFAULT ((0)) FOR [Within25KM]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TrainingProgram4]  DEFAULT ((0)) FOR [SiteToAnotherSite]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TrainingProgram3]  DEFAULT ((0)) FOR [TaxiHired]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TrainingProgram2]  DEFAULT ((0)) FOR [OwnVehicleUsed]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_SanctionedLodging1]  DEFAULT ((0)) FOR [SanctionedDA]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TotalPayableAmount1]  DEFAULT ((0)) FOR [SanctionedLodging]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TotalClaimedAmount]  DEFAULT ((0)) FOR [TotalClaimedAmount]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TotalClaimedAmount1]  DEFAULT ((0)) FOR [TotalPassedAmount]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TotalPassedAmount1]  DEFAULT ((0)) FOR [TotalFinancedAmount]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_TotalPassedAmount1_1]  DEFAULT ((0)) FOR [TotalPayableAmount]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_ConversionFactorINR]  DEFAULT ((0)) FOR [ConversionFactorINR]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_OOEBySystem]  DEFAULT ((0)) FOR [OOEBySystem]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_OOEBySystem1]  DEFAULT ((0)) FOR [OOEByAccounts]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_Setteled]  DEFAULT ((0)) FOR [Setteled]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_OOEBySystem1_1]  DEFAULT ((0)) FOR [ReportAttached]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_OOEBySystem1_2]  DEFAULT ((0)) FOR [SanctionAttached]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_SpecialApprovalAttached]  DEFAULT ((0)) FOR [ApprovalAttached]
GO
ALTER TABLE [dbo].[TA_BillLast] ADD  CONSTRAINT [DF_TA_BillLast_ComponentID]  DEFAULT ((1)) FOR [ComponentID]
GO

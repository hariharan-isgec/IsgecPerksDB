USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_BillDetails](
	[TABillNo] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[AutoCalculated] [bit] NOT NULL,
	[TourExtended] [bit] NOT NULL,
	[ProjectID] [nvarchar](6) NULL,
	[CostCenterID] [nvarchar](6) NULL,
	[CurrencyID] [nvarchar](6) NULL,
	[ConversionFactorINR] [decimal](18, 6) NOT NULL,
	[City1ID] [nvarchar](30) NULL,
	[City1Text] [nvarchar](100) NULL,
	[City2ID] [nvarchar](30) NULL,
	[City2Text] [nvarchar](100) NULL,
	[Country1ID] [nvarchar](30) NULL,
	[Country2ID] [nvarchar](30) NULL,
	[Date1Time] [datetime] NULL,
	[Date2Time] [datetime] NULL,
	[ModeTravelID] [int] NULL,
	[ModeLCID] [int] NULL,
	[ModeExpenseID] [int] NULL,
	[ModeFinanceID] [int] NULL,
	[CityTypeID] [nvarchar](6) NULL,
	[ModeText] [nvarchar](100) NULL,
	[BoardingProvided] [bit] NOT NULL,
	[LodgingProvided] [bit] NOT NULL,
	[StayedWithRelative] [bit] NOT NULL,
	[StayedInGuestHouse] [bit] NOT NULL,
	[StayedAtSite] [bit] NOT NULL,
	[StayedInHotel] [bit] NOT NULL,
	[NotStayedAnyWhere] [bit] NOT NULL,
	[AirportToHotel] [bit] NOT NULL,
	[HotelToAirport] [bit] NOT NULL,
	[AirportToClientLocation] [bit] NOT NULL,
	[AmountFactor] [decimal](18, 2) NOT NULL,
	[AmountRate] [decimal](18, 2) NOT NULL,
	[AmountBasic] [decimal](18, 2) NOT NULL,
	[AmountTax] [decimal](18, 2) NOT NULL,
	[AmountTotal] [decimal](18, 2) NOT NULL,
	[AmountInINR] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[PassedAmountFactor] [decimal](18, 2) NOT NULL,
	[PassedAmountRate] [decimal](18, 2) NOT NULL,
	[PassedAmountBasic] [decimal](18, 2) NOT NULL,
	[PassedAmountTax] [decimal](18, 2) NOT NULL,
	[PassedAmountTotal] [decimal](18, 2) NOT NULL,
	[PassedAmountInINR] [decimal](18, 2) NOT NULL,
	[AccountsRemarks] [nvarchar](500) NULL,
	[OOEBySystem] [bit] NOT NULL,
	[OOEByAccounts] [bit] NOT NULL,
	[OOEReasonID] [int] NULL,
	[OOERemarks] [nvarchar](500) NULL,
	[ApprovalWFTypeID] [int] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovalRemarks] [nvarchar](500) NULL,
	[Setteled] [bit] NOT NULL,
	[BillAttached] [bit] NOT NULL,
	[BillFileName] [nvarchar](100) NULL,
	[BillDiskFile] [nvarchar](250) NULL,
	[SanctionAttached] [bit] NOT NULL,
	[SanctionFileName] [nvarchar](100) NULL,
	[SanctionDiskFile] [nvarchar](250) NULL,
	[SystemText] [nvarchar](250) NULL,
	[AmountRateOU] [decimal](18, 2) NOT NULL,
	[AmountTaxOU] [decimal](18, 2) NOT NULL,
	[ConversionFactorOU] [decimal](18, 6) NOT NULL,
	[CurrencyMain] [nvarchar](6) NULL,
 CONSTRAINT [PK_TA_BillDetails] PRIMARY KEY CLUSTERED 
(
	[TABillNo] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TA_BillDetails] ON [dbo].[TA_BillDetails] 
(
	[TABillNo] ASC,
	[ComponentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_ApprovalWFTypeID] FOREIGN KEY([ApprovalWFTypeID])
REFERENCES [dbo].[TA_ApprovalWFTypes] ([WFTypeID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_ApprovalWFTypeID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_ApprovedBy]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_City1ID] FOREIGN KEY([City1ID])
REFERENCES [dbo].[TA_Cities] ([CityID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_City1ID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_City2ID] FOREIGN KEY([City2ID])
REFERENCES [dbo].[TA_Cities] ([CityID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_City2ID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_CityTypeID] FOREIGN KEY([CityTypeID])
REFERENCES [dbo].[TA_CityTypes] ([CityTypeID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_CityTypeID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_ComponentID] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[TA_Components] ([ComponentID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_ComponentID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_CostCenterID] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_CostCenterID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_Country1ID] FOREIGN KEY([Country1ID])
REFERENCES [dbo].[TA_Countries] ([CountryID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_Country1ID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_Country2ID] FOREIGN KEY([Country2ID])
REFERENCES [dbo].[TA_Countries] ([CountryID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_Country2ID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_CurrencyID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_ModeExpenseID] FOREIGN KEY([ModeExpenseID])
REFERENCES [dbo].[TA_ExpenseHeads] ([ExpenseHeadID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_ModeExpenseID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_ModeFinanceID] FOREIGN KEY([ModeFinanceID])
REFERENCES [dbo].[TA_FinanceHeads] ([FinanceHeadID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_ModeFinanceID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_ModeLCID] FOREIGN KEY([ModeLCID])
REFERENCES [dbo].[TA_LCModes] ([ModeID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_ModeLCID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_ModeTravelID] FOREIGN KEY([ModeTravelID])
REFERENCES [dbo].[TA_TravelModes] ([ModeID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_ModeTravelID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_OOEReasonID] FOREIGN KEY([OOEReasonID])
REFERENCES [dbo].[TA_OOEReasons] ([ReasonID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_OOEReasonID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_ProjectID]
GO
ALTER TABLE [dbo].[TA_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillDetails_TABillNo] FOREIGN KEY([TABillNo])
REFERENCES [dbo].[TA_Bills] ([TABillNo])
GO
ALTER TABLE [dbo].[TA_BillDetails] CHECK CONSTRAINT [FK_TA_BillDetails_TABillNo]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_ComponentID]  DEFAULT ((2)) FOR [ComponentID]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AutoCalculated]  DEFAULT ((0)) FOR [AutoCalculated]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_TourExtended]  DEFAULT ((0)) FOR [TourExtended]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_ConversionFactorINR]  DEFAULT ((0)) FOR [ConversionFactorINR]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_Justification1]  DEFAULT ((0)) FOR [City1Text]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_City1Text1]  DEFAULT ((0)) FOR [City2Text]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_City1Text1_1]  DEFAULT ((0)) FOR [ModeText]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_BoardingProvided]  DEFAULT ((0)) FOR [BoardingProvided]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_LodgingProvided]  DEFAULT ((0)) FOR [LodgingProvided]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_StayedWithRelative]  DEFAULT ((0)) FOR [StayedWithRelative]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_StayedInGuestHouse]  DEFAULT ((0)) FOR [StayedInGuestHouse]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_StayedAtSite]  DEFAULT ((0)) FOR [StayedAtSite]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_StayedInHotel]  DEFAULT ((0)) FOR [StayedInHotel]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_NotStayedAnyWhere]  DEFAULT ((0)) FOR [NotStayedAnyWhere]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AirportToHotel]  DEFAULT ((0)) FOR [AirportToHotel]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_HotelToAirport]  DEFAULT ((0)) FOR [HotelToAirport]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AirportToClientLocation]  DEFAULT ((0)) FOR [AirportToClientLocation]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_TotalKM]  DEFAULT ((0)) FOR [AmountFactor]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AmountPerKM]  DEFAULT ((0)) FOR [AmountRate]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_BillAmountWitoutTax]  DEFAULT ((0)) FOR [AmountBasic]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_TaxAmount]  DEFAULT ((0)) FOR [AmountTax]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_ClaimedAmount]  DEFAULT ((0)) FOR [AmountTotal]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_TotalInINR]  DEFAULT ((0)) FOR [AmountInINR]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_Duratance1]  DEFAULT ((0)) FOR [PassedAmountFactor]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_DuratanceRate1]  DEFAULT ((0)) FOR [PassedAmountRate]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AmountWitoutTax1]  DEFAULT ((0)) FOR [PassedAmountBasic]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AmountTax1]  DEFAULT ((0)) FOR [PassedAmountTax]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AmountTotal1]  DEFAULT ((0)) FOR [PassedAmountTotal]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AmountInINR1]  DEFAULT ((0)) FOR [PassedAmountInINR]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_OOEBySystem]  DEFAULT ((0)) FOR [OOEBySystem]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_OOEByAccounts]  DEFAULT ((0)) FOR [OOEByAccounts]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_Setteled]  DEFAULT ((0)) FOR [Setteled]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_BillAttached]  DEFAULT ((0)) FOR [BillAttached]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_SanctionAttached]  DEFAULT ((0)) FOR [SanctionAttached]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AmountRate1]  DEFAULT ((0)) FOR [AmountRateOU]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_AmountTax1_1]  DEFAULT ((0)) FOR [AmountTaxOU]
GO
ALTER TABLE [dbo].[TA_BillDetails] ADD  CONSTRAINT [DF_TA_BillDetails_ConversionFactorINR1]  DEFAULT ((0)) FOR [ConversionFactorOU]
GO

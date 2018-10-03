USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_TravelRequest](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestedFor] [nvarchar](8) NULL,
	[RequestedForEmployees] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[TravelTypeID] [int] NULL,
	[ProjectID] [nvarchar](6) NULL,
	[CostCenterID] [nvarchar](6) NULL,
	[Purpose] [nvarchar](500) NULL,
	[FileAttached] [bit] NULL,
	[TravelItinerary] [nvarchar](500) NULL,
	[TotalRequestedAmount] [decimal](18, 2) NULL,
	[RequestedCurrencyID] [nvarchar](6) NULL,
	[RequestedConversionFactor] [decimal](18, 6) NULL,
	[TotalRequestedAmountINR] [decimal](18, 2) NULL,
	[RequestKey] [nvarchar](8) NULL,
	[ProjectManagerID] [nvarchar](8) NULL,
	[BalanceBudgetWhenSubmitted] [decimal](18, 2) NULL,
	[StatusID] [int] NULL,
	[BudgetCheckedOn] [datetime] NULL,
	[BudgetCheckedBy] [nvarchar](8) NULL,
	[ProjectManagerRemarks] [nvarchar](250) NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApproverRemarks] [nvarchar](250) NULL,
	[BHApprovalBy] [nvarchar](8) NULL,
	[BHApprovalOn] [datetime] NULL,
	[BHRemarks] [nvarchar](250) NULL,
	[MDApprovalOn] [datetime] NULL,
	[MDApprovalBy] [nvarchar](8) NULL,
	[MDLodgingAmount] [decimal](18, 2) NULL,
	[MDDAAmount] [decimal](18, 2) NULL,
	[MDCurrencyID] [nvarchar](6) NULL,
	[MDConversionFactor] [decimal](18, 6) NULL,
	[MDLodgingAmountINR] [decimal](18, 2) NULL,
	[MDDAAmountINR] [decimal](18, 2) NULL,
	[MDRemarks] [nvarchar](250) NULL,
	[AdditionalCurrency] [decimal](18, 2) NULL,
	[Add1AmountDescription] [nvarchar](150) NULL,
	[Add1Amount] [decimal](18, 2) NULL,
	[Add2AmountDescription] [nvarchar](150) NULL,
	[Add2Amount] [decimal](18, 2) NULL,
	[Add3AmountDescription] [nvarchar](150) NULL,
	[Add3Amount] [decimal](18, 2) NULL,
	[Add4AmountDescription] [nvarchar](150) NULL,
	[Add4Amount] [decimal](18, 2) NULL,
	[Add5AmountDescription] [nvarchar](150) NULL,
	[Add5Amount] [decimal](18, 2) NULL,
	[TravelStartDate] [datetime] NULL,
	[TravelFinishDate] [datetime] NULL,
 CONSTRAINT [PK_TA_TravelRequest] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_ApprovedBy]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_BHApprovedBy] FOREIGN KEY([BHApprovalBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_BHApprovedBy]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_BudgetCheckedBy] FOREIGN KEY([BudgetCheckedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_BudgetCheckedBy]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_CostCenterID] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_CostCenterID]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_CreatedBy]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_MDApprovedBy] FOREIGN KEY([MDApprovalBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_MDApprovedBy]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_MDCurrencyID] FOREIGN KEY([MDCurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_MDCurrencyID]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_ProjectID]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_ProjectManagerID] FOREIGN KEY([ProjectManagerID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_ProjectManagerID]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_RequestedCurrencyID] FOREIGN KEY([RequestedCurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_RequestedCurrencyID]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_RequestedFor] FOREIGN KEY([RequestedFor])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_RequestedFor]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[TA_TravelRequestStatus] ([StatusID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_StatusID]
GO
ALTER TABLE [dbo].[TA_TravelRequest]  WITH CHECK ADD  CONSTRAINT [FK_TA_TravelRequest_TravelTypeID] FOREIGN KEY([TravelTypeID])
REFERENCES [dbo].[TA_TravelTypes] ([TravelTypeID])
GO
ALTER TABLE [dbo].[TA_TravelRequest] CHECK CONSTRAINT [FK_TA_TravelRequest_TravelTypeID]
GO

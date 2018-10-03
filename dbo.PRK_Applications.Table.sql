USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_Applications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PerkID] [int] NOT NULL,
	[Applied] [bit] NOT NULL,
	[AppliedOn] [datetime] NULL,
	[Value] [decimal](10, 2) NOT NULL,
	[UserRemark] [nvarchar](200) NULL,
	[Approved] [bit] NOT NULL,
	[ApprovedValue] [decimal](10, 2) NOT NULL,
	[ApprovedAmt] [decimal](10, 2) NOT NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedOn] [datetime] NULL,
	[ApproverRemark] [nvarchar](100) NOT NULL,
	[Verified] [bit] NOT NULL,
	[VerifiedValue] [decimal](10, 2) NOT NULL,
	[VerifiedAmt] [decimal](10, 2) NOT NULL,
	[VerifiedBy] [int] NULL,
	[VerifiedOn] [datetime] NULL,
	[VerifierRemark] [nvarchar](100) NOT NULL,
	[PaymentMethod] [nvarchar](20) NOT NULL,
	[UpdatedInLedger] [bit] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[PostedInBaaN] [bit] NOT NULL,
	[PostedOn] [datetime] NULL,
	[PostedBy] [int] NULL,
	[Documents] [bit] NOT NULL,
	[StatusID] [int] NOT NULL,
	[FinYear] [int] NULL,
	[ClaimID] [int] NULL,
	[Selected] [bit] NOT NULL,
	[ExcessClaimed] [bit] NOT NULL,
	[ReportAttached] [bit] NOT NULL,
	[ReportFileName] [nvarchar](100) NULL,
	[ReportDiskFile] [nvarchar](250) NULL,
 CONSTRAINT [PK_PRK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PRK_Applications] ON [dbo].[PRK_Applications] 
(
	[FinYear] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PRK_Applications_1] ON [dbo].[PRK_Applications] 
(
	[FinYear] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PRK_Applications_2] ON [dbo].[PRK_Applications] 
(
	[FinYear] ASC,
	[EmployeeID] ASC,
	[PerkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_Applications]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Applications_ClaimID] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[PRK_UserClaims] ([ClaimID])
GO
ALTER TABLE [dbo].[PRK_Applications] CHECK CONSTRAINT [FK_PRK_Applications_ClaimID]
GO
ALTER TABLE [dbo].[PRK_Applications]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Applications_PRK_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[PRK_Applications] CHECK CONSTRAINT [FK_PRK_Applications_PRK_Employees]
GO
ALTER TABLE [dbo].[PRK_Applications]  WITH NOCHECK ADD  CONSTRAINT [FK_PRK_Applications_PRK_Employees1] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[PRK_Applications] NOCHECK CONSTRAINT [FK_PRK_Applications_PRK_Employees1]
GO
ALTER TABLE [dbo].[PRK_Applications]  WITH NOCHECK ADD  CONSTRAINT [FK_PRK_Applications_PRK_Employees2] FOREIGN KEY([VerifiedBy])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[PRK_Applications] NOCHECK CONSTRAINT [FK_PRK_Applications_PRK_Employees2]
GO
ALTER TABLE [dbo].[PRK_Applications]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Applications_PRK_Employees3] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[PRK_Applications] CHECK CONSTRAINT [FK_PRK_Applications_PRK_Employees3]
GO
ALTER TABLE [dbo].[PRK_Applications]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Applications_PRK_Employees4] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[PRK_Applications] CHECK CONSTRAINT [FK_PRK_Applications_PRK_Employees4]
GO
ALTER TABLE [dbo].[PRK_Applications]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Applications_PRK_FinYears] FOREIGN KEY([FinYear])
REFERENCES [dbo].[PRK_FinYears] ([FinYear])
GO
ALTER TABLE [dbo].[PRK_Applications] CHECK CONSTRAINT [FK_PRK_Applications_PRK_FinYears]
GO
ALTER TABLE [dbo].[PRK_Applications]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Applications_PRK_Perks] FOREIGN KEY([PerkID])
REFERENCES [dbo].[PRK_Perks] ([PerkID])
GO
ALTER TABLE [dbo].[PRK_Applications] CHECK CONSTRAINT [FK_PRK_Applications_PRK_Perks]
GO
ALTER TABLE [dbo].[PRK_Applications]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Applications_PRK_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PRK_Status] ([StatusID])
GO
ALTER TABLE [dbo].[PRK_Applications] CHECK CONSTRAINT [FK_PRK_Applications_PRK_Status]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_Applied]  DEFAULT ((0)) FOR [Applied]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_AppliedOn]  DEFAULT (getdate()) FOR [AppliedOn]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_Value]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_UserRemark]  DEFAULT ('') FOR [UserRemark]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_Approved]  DEFAULT ((0)) FOR [Approved]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_ApprovedValue]  DEFAULT ((0)) FOR [ApprovedValue]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_ApprovedAmt]  DEFAULT ((0)) FOR [ApprovedAmt]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_ApprovedRemark]  DEFAULT ('') FOR [ApproverRemark]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_Verified]  DEFAULT ((0)) FOR [Verified]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_VerifiedValue]  DEFAULT ((0)) FOR [VerifiedValue]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_VerifiedAmt]  DEFAULT ((0)) FOR [VerifiedAmt]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_VerifierRemark]  DEFAULT ('') FOR [VerifierRemark]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_PaymentMethod]  DEFAULT ('Cash') FOR [PaymentMethod]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_UpdatedInLedger]  DEFAULT ((0)) FOR [UpdatedInLedger]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_PostedInBaaN]  DEFAULT ((0)) FOR [PostedInBaaN]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_Documents]  DEFAULT ((0)) FOR [Documents]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_Selected]  DEFAULT ((0)) FOR [Selected]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_ExcessClaimed]  DEFAULT ((0)) FOR [ExcessClaimed]
GO
ALTER TABLE [dbo].[PRK_Applications] ADD  CONSTRAINT [DF_PRK_Applications_ReportAttached]  DEFAULT ((0)) FOR [ReportAttached]
GO

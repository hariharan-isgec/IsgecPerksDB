USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_SiteAllowanceClaims](
	[FinancialYear] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[EmployeeCode] [nvarchar](8) NOT NULL,
	[Entitled1Days] [int] NULL,
	[Entitled2Days] [int] NULL,
	[Entitled3Days] [int] NULL,
	[Applied1Days] [int] NULL,
	[Applied2Days] [int] NULL,
	[Applied3Days] [int] NULL,
	[Approved1Days] [int] NULL,
	[Approved2Days] [int] NULL,
	[Approved3Days] [int] NULL,
	[UserRemarks] [nvarchar](100) NULL,
	[ApproverRemarks] [nvarchar](100) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[Linked] [bit] NULL,
	[StatusID] [int] NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedOn] [datetime] NULL,
	[Entitled1Amount] [decimal](18, 2) NULL,
	[Entitled2Amount] [decimal](18, 2) NULL,
	[Entitled3Amount] [decimal](18, 2) NULL,
	[Applied1Amount] [decimal](18, 2) NULL,
	[Applied2Amount] [decimal](18, 2) NULL,
	[Applied3Amount] [decimal](18, 2) NULL,
	[Approved1Amount] [decimal](18, 2) NULL,
	[Approved2Amount] [decimal](18, 2) NULL,
	[Approved3Amount] [decimal](18, 2) NULL,
	[TotalEntitledAmount] [decimal](18, 2) NULL,
	[TotalAppliedAmount] [decimal](18, 2) NULL,
	[TotalApprovedAmount] [decimal](18, 2) NULL,
	[AdviceNumber] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PRK_SiteAllowanceClaims] PRIMARY KEY CLUSTERED 
(
	[FinancialYear] ASC,
	[Quarter] ASC,
	[EmployeeCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceClaims]  WITH CHECK ADD  CONSTRAINT [FK_PRK_SiteAllowanceClaims_Quarter] FOREIGN KEY([Quarter])
REFERENCES [dbo].[COST_Quarters] ([Quarter])
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceClaims] CHECK CONSTRAINT [FK_PRK_SiteAllowanceClaims_Quarter]
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceClaims]  WITH CHECK ADD  CONSTRAINT [FK_PRK_SiteAllowanceClaims_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PRK_SAClaimStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceClaims] CHECK CONSTRAINT [FK_PRK_SiteAllowanceClaims_StatusID]
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceClaims] ADD  CONSTRAINT [DF_PRK_SiteAllowanceClaims_Linked]  DEFAULT ((0)) FOR [Linked]
GO

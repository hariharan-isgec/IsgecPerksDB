USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_UserClaims](
	[ClaimID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[PassedAmount] [decimal](12, 2) NOT NULL,
	[TotalAmount] [decimal](12, 2) NOT NULL,
	[DeclarationAccepted] [bit] NOT NULL,
	[SubmittedOn] [datetime] NULL,
	[ReceivedOn] [datetime] NULL,
	[ReceivedBy] [nvarchar](8) NULL,
	[ReturnedOn] [datetime] NULL,
	[ReturnedBy] [nvarchar](8) NULL,
	[CompletedOn] [datetime] NULL,
	[AccountsRemarks] [nvarchar](250) NULL,
	[ClaimStatusID] [int] NULL,
	[ClaimRefNo] [nvarchar](50) NULL,
	[FinYear] [int] NULL,
	[forRef] [int] NULL,
	[VerifiedBy] [nvarchar](8) NULL,
	[VerifiedOn] [datetime] NULL,
 CONSTRAINT [PK_PRK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_PRK_UserClaims_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PRK_UserClaims] CHECK CONSTRAINT [FK_PRK_UserClaims_CardNo]
GO
ALTER TABLE [dbo].[PRK_UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_PRK_UserClaims_ClaimStatusID] FOREIGN KEY([ClaimStatusID])
REFERENCES [dbo].[PRK_ClaimStatus] ([ClaimStatusID])
GO
ALTER TABLE [dbo].[PRK_UserClaims] CHECK CONSTRAINT [FK_PRK_UserClaims_ClaimStatusID]
GO
ALTER TABLE [dbo].[PRK_UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_PRK_UserClaims_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[PRK_FinYears] ([FinYear])
GO
ALTER TABLE [dbo].[PRK_UserClaims] CHECK CONSTRAINT [FK_PRK_UserClaims_FinYear]
GO
ALTER TABLE [dbo].[PRK_UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_PRK_UserClaims_ReceivedBy] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PRK_UserClaims] CHECK CONSTRAINT [FK_PRK_UserClaims_ReceivedBy]
GO
ALTER TABLE [dbo].[PRK_UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_PRK_UserClaims_ReturnedBy] FOREIGN KEY([ReturnedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PRK_UserClaims] CHECK CONSTRAINT [FK_PRK_UserClaims_ReturnedBy]
GO
ALTER TABLE [dbo].[PRK_UserClaims] ADD  CONSTRAINT [DF_PRK_UserClaims_TotalValue]  DEFAULT ((0)) FOR [PassedAmount]
GO
ALTER TABLE [dbo].[PRK_UserClaims] ADD  CONSTRAINT [DF_PRK_UserClaims_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[PRK_UserClaims] ADD  CONSTRAINT [DF_PRK_UserClaims_DeclarationAccepted]  DEFAULT ((0)) FOR [DeclarationAccepted]
GO

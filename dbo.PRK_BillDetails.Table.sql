USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_BillDetails](
	[AttachmentID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[SerialNo] [int] NOT NULL,
	[BillNo] [nvarchar](20) NOT NULL,
	[BillDate] [datetime] NULL,
	[Particulars] [nvarchar](250) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[ClaimID] [int] NULL,
	[Description] [nvarchar](250) NULL,
	[WithDriver] [bit] NOT NULL,
	[VerifiedByAdmin] [bit] NOT NULL,
	[EntitlementID] [int] NULL,
	[PerkID] [int] NULL,
 CONSTRAINT [PK_PRK_BillDetails] PRIMARY KEY CLUSTERED 
(
	[AttachmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_PRK_BillDetails_ClaimID] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[PRK_UserClaims] ([ClaimID])
GO
ALTER TABLE [dbo].[PRK_BillDetails] CHECK CONSTRAINT [FK_PRK_BillDetails_ClaimID]
GO
ALTER TABLE [dbo].[PRK_BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_PRK_BillDetails_PRK_Applications] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[PRK_Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[PRK_BillDetails] CHECK CONSTRAINT [FK_PRK_BillDetails_PRK_Applications]
GO
ALTER TABLE [dbo].[PRK_BillDetails] ADD  CONSTRAINT [DF_PRK_BillDetails_SerialNo]  DEFAULT ((0)) FOR [SerialNo]
GO
ALTER TABLE [dbo].[PRK_BillDetails] ADD  CONSTRAINT [DF_PRK_BillDetails_BillNo]  DEFAULT ('') FOR [BillNo]
GO
ALTER TABLE [dbo].[PRK_BillDetails] ADD  CONSTRAINT [DF_PRK_BillDetails_Particulars]  DEFAULT ('') FOR [Particulars]
GO
ALTER TABLE [dbo].[PRK_BillDetails] ADD  CONSTRAINT [DF_PRK_BillDetails_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PRK_BillDetails] ADD  CONSTRAINT [DF_PRK_BillDetails_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[PRK_BillDetails] ADD  CONSTRAINT [DF_PRK_BillDetails_WithDriver]  DEFAULT ((0)) FOR [WithDriver]
GO
ALTER TABLE [dbo].[PRK_BillDetails] ADD  CONSTRAINT [DF_PRK_BillDetails_VerifiedByAdmin]  DEFAULT ((0)) FOR [VerifiedByAdmin]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_ACVouchers](
	[VoucherNo] [int] IDENTITY(1,1) NOT NULL,
	[VoucherDate] [datetime] NULL,
	[VendorID] [nvarchar](6) NOT NULL,
	[CreatedBy] [nvarchar](8) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[PostedInBaaN] [bit] NOT NULL,
	[BatchNo] [nvarchar](20) NULL,
	[BatchDate] [datetime] NULL,
	[DocumentNo] [nvarchar](50) NULL,
	[ChequeNo] [nvarchar](20) NULL,
	[ChequeDate] [datetime] NULL,
	[PostedBy] [nvarchar](8) NULL,
	[PostedOn] [datetime] NULL,
	[PostingRemarks] [nvarchar](500) NULL,
	[PaidToSupplier] [bit] NULL,
	[PaidOn] [datetime] NULL,
	[PaidBy] [nvarchar](8) NULL,
	[PaidRemarks] [nvarchar](500) NULL,
 CONSTRAINT [PK_SPMT_ACVouchers] PRIMARY KEY CLUSTERED 
(
	[VoucherNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_ACVouchers]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_ACVouchers_aspnet_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_ACVouchers] CHECK CONSTRAINT [FK_SPMT_ACVouchers_aspnet_Users]
GO
ALTER TABLE [dbo].[SPMT_ACVouchers]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_ACVouchers_aspnet_Users1] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_ACVouchers] CHECK CONSTRAINT [FK_SPMT_ACVouchers_aspnet_Users1]
GO
ALTER TABLE [dbo].[SPMT_ACVouchers]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_ACVouchers_aspnet_Users2] FOREIGN KEY([PaidBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_ACVouchers] CHECK CONSTRAINT [FK_SPMT_ACVouchers_aspnet_Users2]
GO
ALTER TABLE [dbo].[SPMT_ACVouchers]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_ACVouchers_SPMT_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[SPMT_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[SPMT_ACVouchers] CHECK CONSTRAINT [FK_SPMT_ACVouchers_SPMT_Vendors]
GO
ALTER TABLE [dbo].[SPMT_ACVouchers] ADD  CONSTRAINT [DF_SPMT_ACVouchers_PostedInBaaN]  DEFAULT ((0)) FOR [PostedInBaaN]
GO

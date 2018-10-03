USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_PaymentProcess](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[PTRNo] [nvarchar](10) NOT NULL,
	[PTRDate] [datetime] NOT NULL,
	[PTRAmount] [decimal](18, 2) NOT NULL,
	[PaymentReference] [nvarchar](50) NULL,
	[ChequeNo] [nvarchar](10) NULL,
	[ChequeDate] [datetime] NULL,
	[ChequeAmount] [decimal](18, 2) NOT NULL,
	[PaymentDescription] [nvarchar](50) NULL,
	[ProcessedBy] [nvarchar](8) NOT NULL,
	[ProcessedOn] [datetime] NOT NULL,
	[Freezed] [bit] NOT NULL,
	[IRNo] [int] NULL,
 CONSTRAINT [PK_VR_PaymentProcess] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_PaymentProcess]  WITH CHECK ADD  CONSTRAINT [FK_VR_PaymentProcess_ProcessedBy] FOREIGN KEY([ProcessedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_PaymentProcess] CHECK CONSTRAINT [FK_VR_PaymentProcess_ProcessedBy]
GO
ALTER TABLE [dbo].[VR_PaymentProcess] ADD  CONSTRAINT [DF_VR_PaymentProcess_PTRAmount]  DEFAULT ((0)) FOR [PTRAmount]
GO
ALTER TABLE [dbo].[VR_PaymentProcess] ADD  CONSTRAINT [DF_VR_PaymentProcess_ChequeAmount]  DEFAULT ((0)) FOR [ChequeAmount]
GO
ALTER TABLE [dbo].[VR_PaymentProcess] ADD  CONSTRAINT [DF_VR_PaymentProcess_Freezed]  DEFAULT ((0)) FOR [Freezed]
GO

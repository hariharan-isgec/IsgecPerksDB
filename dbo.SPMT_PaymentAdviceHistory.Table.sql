USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_PaymentAdviceHistory](
	[AdviceNo] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[TranTypeID] [nvarchar](3) NOT NULL,
	[VendorID] [nvarchar](6) NOT NULL,
	[CostCenter] [nvarchar](50) NULL,
	[ConcernedHOD] [nvarchar](8) NULL,
	[AdviceStatusID] [int] NOT NULL,
	[AdviceStatusOn] [datetime] NOT NULL,
	[AdviceStatusUser] [nvarchar](8) NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[RemarksHOD] [nvarchar](500) NULL,
	[RemarksHR] [nvarchar](500) NULL,
	[RemarksAC] [nvarchar](500) NULL,
	[Returned] [bit] NULL,
	[Forward] [bit] NULL,
 CONSTRAINT [PK_SPMT_PaymentAdviceHistory] PRIMARY KEY CLUSTERED 
(
	[AdviceNo] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdviceHistory_aspnet_Users] FOREIGN KEY([ConcernedHOD])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory] CHECK CONSTRAINT [FK_SPMT_PaymentAdviceHistory_aspnet_Users]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdviceHistory_aspnet_Users1] FOREIGN KEY([AdviceStatusUser])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory] CHECK CONSTRAINT [FK_SPMT_PaymentAdviceHistory_aspnet_Users1]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdviceHistory_SPMT_PAStatus] FOREIGN KEY([AdviceStatusID])
REFERENCES [dbo].[SPMT_PAStatus] ([AdviceStatusID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory] CHECK CONSTRAINT [FK_SPMT_PaymentAdviceHistory_SPMT_PAStatus]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdviceHistory_SPMT_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[SPMT_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory] CHECK CONSTRAINT [FK_SPMT_PaymentAdviceHistory_SPMT_Vendors]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory] ADD  CONSTRAINT [DF_SPMT_PaymentAdviceHistory_Returned]  DEFAULT ((0)) FOR [Returned]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdviceHistory] ADD  CONSTRAINT [DF_SPMT_PaymentAdviceHistory_Forward]  DEFAULT ((0)) FOR [Forward]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_BillHistory](
	[IRNo] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[TranTypeID] [nvarchar](3) NOT NULL,
	[IRReceivedOn] [datetime] NULL,
	[VendorID] [nvarchar](6) NOT NULL,
	[BillNumber] [nvarchar](50) NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[BillAmount] [decimal](10, 2) NOT NULL,
	[BillStatusID] [int] NOT NULL,
	[BillStatusDate] [datetime] NOT NULL,
	[BillStatusUser] [nvarchar](8) NOT NULL,
	[LogisticLinked] [bit] NOT NULL,
	[ApprovedAmount] [decimal](10, 2) NULL,
	[Remarks] [nvarchar](500) NULL,
	[PassedAmount] [decimal](10, 2) NULL,
	[RemarksAC] [nvarchar](500) NULL,
	[ReturnedByAC] [bit] NOT NULL,
	[ReasonID] [int] NULL,
	[AdviceNo] [int] NULL,
 CONSTRAINT [PK_SPMT_BillHistory] PRIMARY KEY CLUSTERED 
(
	[IRNo] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_BillHistory]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_BillHistory_aspnet_Users] FOREIGN KEY([BillStatusUser])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_BillHistory] CHECK CONSTRAINT [FK_SPMT_BillHistory_aspnet_Users]
GO
ALTER TABLE [dbo].[SPMT_BillHistory]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_BillHistory_SPMT_BillStatus] FOREIGN KEY([BillStatusID])
REFERENCES [dbo].[SPMT_BillStatus] ([BillStatusID])
GO
ALTER TABLE [dbo].[SPMT_BillHistory] CHECK CONSTRAINT [FK_SPMT_BillHistory_SPMT_BillStatus]
GO
ALTER TABLE [dbo].[SPMT_BillHistory]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_BillHistory_SPMT_ReturnReason] FOREIGN KEY([ReasonID])
REFERENCES [dbo].[SPMT_ReturnReason] ([ReasonID])
GO
ALTER TABLE [dbo].[SPMT_BillHistory] CHECK CONSTRAINT [FK_SPMT_BillHistory_SPMT_ReturnReason]
GO
ALTER TABLE [dbo].[SPMT_BillHistory]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_BillHistory_SPMT_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[SPMT_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[SPMT_BillHistory] CHECK CONSTRAINT [FK_SPMT_BillHistory_SPMT_Vendors]
GO
ALTER TABLE [dbo].[SPMT_BillHistory] ADD  CONSTRAINT [DF_SPMT_BillHistory_LogisticLinked]  DEFAULT ((0)) FOR [LogisticLinked]
GO
ALTER TABLE [dbo].[SPMT_BillHistory] ADD  CONSTRAINT [DF_SPMT_BillHistory_ReturnedByAC]  DEFAULT ((0)) FOR [ReturnedByAC]
GO

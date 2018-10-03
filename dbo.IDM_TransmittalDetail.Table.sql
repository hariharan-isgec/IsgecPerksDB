USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IDM_TransmittalDetail](
	[TmtlID] [int] NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[DocumentID] [nvarchar](30) NOT NULL,
	[RevisionNo] [nvarchar](2) NOT NULL,
	[TmtlTypeID] [nvarchar](2) NOT NULL,
	[CustomerID] [nvarchar](6) NULL,
	[VendorID] [nvarchar](9) NULL,
	[CardNo] [nvarchar](8) NULL,
	[TmtlStatusID] [int] NULL,
	[SendStatusID] [nvarchar](3) NULL,
	[SendRemarks] [nvarchar](1000) NULL,
	[NoOfCopies] [int] NULL,
	[ReceiveStatusID] [nvarchar](3) NULL,
	[ReceivedRefNo] [nvarchar](250) NULL,
	[ReceivedRemarks] [nvarchar](1000) NULL,
	[ReceiveLocked] [bit] NOT NULL,
	[ReceivedOn] [datetime] NULL,
	[ReceivedBy] [nvarchar](8) NULL,
	[DocumentStatusID] [int] NULL,
	[ResponsibleAgencyID] [int] NULL,
	[cmba]  AS (((([projectid]+',')+[documentid])+',')+[revisionno]) PERSISTED NOT NULL,
 CONSTRAINT [PK_IDM_TransmittalDetail] PRIMARY KEY CLUSTERED 
(
	[TmtlID] ASC,
	[ProjectID] ASC,
	[DocumentID] ASC,
	[RevisionNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_CardNo]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[IDM_Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_Customer]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_Document] FOREIGN KEY([ProjectID], [DocumentID], [RevisionNo])
REFERENCES [dbo].[IDM_Documents] ([ProjectID], [DocumentID], [RevisionNo])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_Document]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_DocumentStatus] FOREIGN KEY([DocumentStatusID])
REFERENCES [dbo].[IDM_DocumentStatus] ([DocumentStatusID])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_DocumentStatus]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_Project]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_ReceivedBy] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_ReceivedBy]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_ReceiveStatus] FOREIGN KEY([ReceiveStatusID])
REFERENCES [dbo].[IDM_ReceiveStatus] ([ReceiveStatusID])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_ReceiveStatus]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_ResponsibleAgency] FOREIGN KEY([ResponsibleAgencyID])
REFERENCES [dbo].[IDM_ResponsibleAgency] ([ResponsibleAgencyID])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_ResponsibleAgency]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_SendStatus] FOREIGN KEY([SendStatusID])
REFERENCES [dbo].[IDM_SendStatus] ([SendStatusID])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_SendStatus]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_TmtlID] FOREIGN KEY([TmtlID])
REFERENCES [dbo].[IDM_Transmittal] ([TmtlID])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_TmtlID]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_TransmittalStatus] FOREIGN KEY([TmtlStatusID])
REFERENCES [dbo].[IDM_TransmittalStatus] ([TmtlStatusID])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_TransmittalStatus]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_TTD_TransmittalType] FOREIGN KEY([TmtlTypeID])
REFERENCES [dbo].[IDM_TransmittalTypes] ([TmtlTypeID])
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] CHECK CONSTRAINT [FK_TTD_TransmittalType]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] ADD  CONSTRAINT [DF_IDM_aTransmittalDetail_NoOfCopies]  DEFAULT ((1)) FOR [NoOfCopies]
GO
ALTER TABLE [dbo].[IDM_TransmittalDetail] ADD  CONSTRAINT [DF_IDM_aTransmittalDetail_ReceiveLocked]  DEFAULT ((0)) FOR [ReceiveLocked]
GO

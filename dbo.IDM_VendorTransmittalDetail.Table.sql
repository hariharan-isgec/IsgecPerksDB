USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IDM_VendorTransmittalDetail](
	[TmtlID] [int] NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[DocumentID] [nvarchar](30) NOT NULL,
	[RevisionNo] [nvarchar](2) NOT NULL,
	[VendorID] [nvarchar](6) NOT NULL,
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
 CONSTRAINT [PK_IDM_VendorTransmittalDetail] PRIMARY KEY CLUSTERED 
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
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_VTD_CT] FOREIGN KEY([TmtlID])
REFERENCES [dbo].[IDM_VendorTransmittal] ([TmtlID])
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] CHECK CONSTRAINT [FK_VTD_CT]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_VTD_Document] FOREIGN KEY([ProjectID], [DocumentID], [RevisionNo])
REFERENCES [dbo].[IDM_Documents] ([ProjectID], [DocumentID], [RevisionNo])
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] CHECK CONSTRAINT [FK_VTD_Document]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_VTD_DocumentStatus] FOREIGN KEY([DocumentStatusID])
REFERENCES [dbo].[IDM_DocumentStatus] ([DocumentStatusID])
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] CHECK CONSTRAINT [FK_VTD_DocumentStatus]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_VTD_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] CHECK CONSTRAINT [FK_VTD_Project]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_VTD_ReceivedBy] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] CHECK CONSTRAINT [FK_VTD_ReceivedBy]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_VTD_ReceiveStatus] FOREIGN KEY([ReceiveStatusID])
REFERENCES [dbo].[IDM_ReceiveStatus] ([ReceiveStatusID])
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] CHECK CONSTRAINT [FK_VTD_ReceiveStatus]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_VTD_ResponsibleAgency] FOREIGN KEY([ResponsibleAgencyID])
REFERENCES [dbo].[IDM_ResponsibleAgency] ([ResponsibleAgencyID])
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] CHECK CONSTRAINT [FK_VTD_ResponsibleAgency]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_VTD_SendStatus] FOREIGN KEY([SendStatusID])
REFERENCES [dbo].[IDM_SendStatus] ([SendStatusID])
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] CHECK CONSTRAINT [FK_VTD_SendStatus]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail]  WITH CHECK ADD  CONSTRAINT [FK_VTD_TransmittalStatus] FOREIGN KEY([TmtlStatusID])
REFERENCES [dbo].[IDM_TransmittalStatus] ([TmtlStatusID])
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] CHECK CONSTRAINT [FK_VTD_TransmittalStatus]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] ADD  CONSTRAINT [DF_IDM_VendorTransmittalDetail_NoOfCopies]  DEFAULT ((1)) FOR [NoOfCopies]
GO
ALTER TABLE [dbo].[IDM_VendorTransmittalDetail] ADD  CONSTRAINT [DF_IDM_VendorTransmittalDetail_ReceiveLocked]  DEFAULT ((0)) FOR [ReceiveLocked]
GO

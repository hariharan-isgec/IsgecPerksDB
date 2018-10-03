USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IDM_Documents](
	[ProjectID] [nvarchar](6) NOT NULL,
	[DocumentID] [nvarchar](30) NOT NULL,
	[RevisionNo] [nvarchar](2) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[AlternateDocumentID] [nvarchar](30) NULL,
	[WBSID] [nvarchar](8) NULL,
	[DocumentTypeID] [int] NULL,
	[ResponsibleAgencyID] [int] NULL,
	[DocumentSizeID] [nvarchar](2) NULL,
	[OriginatorID] [nvarchar](3) NULL,
	[ForCustomerSubmission] [bit] NOT NULL,
	[ForInternalUse] [bit] NOT NULL,
	[ForProduction] [bit] NOT NULL,
	[ForErection] [bit] NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[PlannedReleaseDate] [datetime] NULL,
	[ActualReleaseDate] [datetime] NULL,
	[VendorDocument] [bit] NOT NULL,
	[VendorID] [nvarchar](9) NULL,
	[VDReceived] [bit] NOT NULL,
	[VDReceivedOn] [datetime] NULL,
	[VDReceivedBy] [nvarchar](8) NULL,
	[VDReceiveRemarks] [nvarchar](250) NULL,
	[ReceiveDate] [datetime] NULL,
	[ReceiveStatusID] [nvarchar](3) NULL,
	[ReceiveRemarks] [nvarchar](250) NULL,
	[ReceivedBy] [nvarchar](8) NULL,
	[ReleasedInPLM] [bit] NOT NULL,
	[ValidateInPLM] [bit] NOT NULL,
	[BlockIfNotExists] [bit] NOT NULL,
	[OnceForApproval] [bit] NOT NULL,
	[WarnForApproval] [bit] NOT NULL,
	[ImplementReceiptLock] [bit] NOT NULL,
	[ReceivedLocked] [bit] NOT NULL,
	[Locked] [bit] NOT NULL,
	[TmtlTypeID] [nvarchar](2) NULL,
	[TmtlID] [int] NULL,
	[cmba]  AS (((([projectid]+',')+[documentid])+',')+[revisionno]) PERSISTED NOT NULL,
 CONSTRAINT [PK_IDM_Documents] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[DocumentID] ASC,
	[RevisionNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_DocumentSize] FOREIGN KEY([DocumentSizeID])
REFERENCES [dbo].[IDM_DocumentSizes] ([DocumentSizeID])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_DocumentSize]
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_DocumentType] FOREIGN KEY([DocumentTypeID])
REFERENCES [dbo].[IDM_DocumentTypes] ([DocumentTypeID])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_DocumentType]
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_OriginatorID] FOREIGN KEY([OriginatorID])
REFERENCES [dbo].[IDM_Originator] ([OriginatorID])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_OriginatorID]
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_ProjectID]
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_ReceivedBy] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_ReceivedBy]
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_ReceiveStatus] FOREIGN KEY([ReceiveStatusID])
REFERENCES [dbo].[IDM_ReceiveStatus] ([ReceiveStatusID])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_ReceiveStatus]
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_ResponsibleAgency] FOREIGN KEY([ResponsibleAgencyID])
REFERENCES [dbo].[IDM_ResponsibleAgency] ([ResponsibleAgencyID])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_ResponsibleAgency]
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_TransmittalTypes] FOREIGN KEY([TmtlTypeID])
REFERENCES [dbo].[IDM_TransmittalTypes] ([TmtlTypeID])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_TransmittalTypes]
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_VDReceivedBy] FOREIGN KEY([VDReceivedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_VDReceivedBy]
GO
ALTER TABLE [dbo].[IDM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DOC_WBS] FOREIGN KEY([WBSID])
REFERENCES [dbo].[IDM_WBS] ([WBSID])
GO
ALTER TABLE [dbo].[IDM_Documents] CHECK CONSTRAINT [FK_DOC_WBS]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_DocumentID]  DEFAULT ('') FOR [DocumentID]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_RevisionNo]  DEFAULT ('00') FOR [RevisionNo]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_ForCustomerSubmission]  DEFAULT ((0)) FOR [ForCustomerSubmission]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_ForInternalUse]  DEFAULT ((0)) FOR [ForInternalUse]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_ForProduction]  DEFAULT ((0)) FOR [ForProduction]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_ForErection]  DEFAULT ((0)) FOR [ForErection]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_VendorDocument]  DEFAULT ((0)) FOR [VendorDocument]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_VendorDocumentReceived]  DEFAULT ((0)) FOR [VDReceived]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_ReleasedInOLM]  DEFAULT ((0)) FOR [ReleasedInPLM]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_ValidateInPLM]  DEFAULT ((0)) FOR [ValidateInPLM]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_BlockIfNotExists]  DEFAULT ((0)) FOR [BlockIfNotExists]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_OnceForApproval]  DEFAULT ((0)) FOR [OnceForApproval]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_WarnForApproval]  DEFAULT ((0)) FOR [WarnForApproval]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_ImplementReceiptLock]  DEFAULT ((0)) FOR [ImplementReceiptLock]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_Locked1]  DEFAULT ((0)) FOR [ReceivedLocked]
GO
ALTER TABLE [dbo].[IDM_Documents] ADD  CONSTRAINT [DF_IDM_Documents_Locked]  DEFAULT ((0)) FOR [Locked]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCM_CustomerTmtlDetails](
	[TmtlID] [int] NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[CustomerID] [nvarchar](6) NOT NULL,
	[DocumentID] [nvarchar](30) NOT NULL,
	[RevisionNo] [nvarchar](2) NOT NULL,
	[SendStatusID] [nvarchar](2) NULL,
	[SendRemarks] [nvarchar](250) NULL,
	[ReceiveStatusID] [nvarchar](2) NULL,
	[ReceivedRefNo] [nvarchar](250) NULL,
	[ReceivedRemarks] [nvarchar](250) NULL,
	[ReceivedOn] [datetime] NULL,
	[ReceivedBy] [nvarchar](8) NULL,
	[TempDetailStatus] [int] NOT NULL,
 CONSTRAINT [PK_DCM_CustomerTmtlDetails_1] PRIMARY KEY CLUSTERED 
(
	[TmtlID] ASC,
	[ProjectID] ASC,
	[CustomerID] ASC,
	[DocumentID] ASC,
	[RevisionNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlDetails]  WITH CHECK ADD  CONSTRAINT [FK_DCM_CustomerTmtlDetails_DCM_CustomerTmtlHeader] FOREIGN KEY([TmtlID], [ProjectID], [CustomerID])
REFERENCES [dbo].[DCM_CustomerTmtlHeader] ([TmtlID], [ProjectID], [CustomerID])
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlDetails] CHECK CONSTRAINT [FK_DCM_CustomerTmtlDetails_DCM_CustomerTmtlHeader]
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlDetails]  WITH CHECK ADD  CONSTRAINT [FK_DCM_CustomerTmtlDetails_DCM_Documents] FOREIGN KEY([ProjectID], [DocumentID], [RevisionNo])
REFERENCES [dbo].[DCM_Documents] ([ProjectID], [DocumentID], [RevisionNo])
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlDetails] CHECK CONSTRAINT [FK_DCM_CustomerTmtlDetails_DCM_Documents]
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlDetails]  WITH CHECK ADD  CONSTRAINT [FK_DCM_CustomerTmtlDetails_DCM_ReceiveStatus] FOREIGN KEY([ReceiveStatusID])
REFERENCES [dbo].[DCM_ReceiveStatus] ([ReceiveStatusID])
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlDetails] CHECK CONSTRAINT [FK_DCM_CustomerTmtlDetails_DCM_ReceiveStatus]
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlDetails]  WITH CHECK ADD  CONSTRAINT [FK_DCM_CustomerTmtlDetails_DCM_SendStatus] FOREIGN KEY([SendStatusID])
REFERENCES [dbo].[DCM_SendStatus] ([SendStatusID])
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlDetails] CHECK CONSTRAINT [FK_DCM_CustomerTmtlDetails_DCM_SendStatus]
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlDetails] ADD  CONSTRAINT [DF_DCM_CustomerTmtlDetails_TempDetailStatus]  DEFAULT ((0)) FOR [TempDetailStatus]
GO

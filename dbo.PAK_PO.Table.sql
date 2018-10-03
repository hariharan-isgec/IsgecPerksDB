USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_PO](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[IssueReasonID] [int] NULL,
	[PODescription] [nvarchar](100) NULL,
	[PONumber] [nvarchar](10) NULL,
	[PORevision] [nvarchar](10) NULL,
	[PODate] [datetime] NULL,
	[POConsignee] [nvarchar](100) NULL,
	[POOtherDetails] [nvarchar](500) NULL,
	[POTypeID] [int] NULL,
	[SupplierID] [nvarchar](9) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[DivisionID] [int] NULL,
	[BuyerID] [nvarchar](8) NULL,
	[POStatusID] [int] NULL,
	[IssuedBy] [nvarchar](8) NULL,
	[IssuedOn] [datetime] NULL,
	[ISGECRemarks] [nvarchar](500) NULL,
	[SupplierRemarks] [nvarchar](500) NULL,
	[ClosedBy] [nvarchar](8) NULL,
	[ClosedOn] [datetime] NULL,
	[POFOR] [nvarchar](2) NOT NULL,
	[QCRequired] [bit] NOT NULL,
	[AcceptedBySupplier] [bit] NOT NULL,
	[AcceptedBySupplierOn] [datetime] NULL,
 CONSTRAINT [PK_PAK_PO] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_PO]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PO_BuyerID] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_PO] CHECK CONSTRAINT [FK_PAK_PO_BuyerID]
GO
ALTER TABLE [dbo].[PAK_PO]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PO_ClosedBy] FOREIGN KEY([ClosedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_PO] CHECK CONSTRAINT [FK_PAK_PO_ClosedBy]
GO
ALTER TABLE [dbo].[PAK_PO]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PO_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[PAK_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[PAK_PO] CHECK CONSTRAINT [FK_PAK_PO_DivisionID]
GO
ALTER TABLE [dbo].[PAK_PO]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PO_IssuedBy] FOREIGN KEY([IssuedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_PO] CHECK CONSTRAINT [FK_PAK_PO_IssuedBy]
GO
ALTER TABLE [dbo].[PAK_PO]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PO_IssueReasonID] FOREIGN KEY([IssueReasonID])
REFERENCES [dbo].[PAK_Reasons] ([ReasonID])
GO
ALTER TABLE [dbo].[PAK_PO] CHECK CONSTRAINT [FK_PAK_PO_IssueReasonID]
GO
ALTER TABLE [dbo].[PAK_PO]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PO_POStatusID] FOREIGN KEY([POStatusID])
REFERENCES [dbo].[PAK_POStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PAK_PO] CHECK CONSTRAINT [FK_PAK_PO_POStatusID]
GO
ALTER TABLE [dbo].[PAK_PO]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PO_POTypeID] FOREIGN KEY([POTypeID])
REFERENCES [dbo].[PAK_POTypes] ([POTypeID])
GO
ALTER TABLE [dbo].[PAK_PO] CHECK CONSTRAINT [FK_PAK_PO_POTypeID]
GO
ALTER TABLE [dbo].[PAK_PO]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PO_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_PO] CHECK CONSTRAINT [FK_PAK_PO_ProjectID]
GO
ALTER TABLE [dbo].[PAK_PO]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[PAK_PO] CHECK CONSTRAINT [FK_PAK_SupplierID]
GO
ALTER TABLE [dbo].[PAK_PO] ADD  CONSTRAINT [DF_PAK_PO_POFOR]  DEFAULT (N'PK') FOR [POFOR]
GO
ALTER TABLE [dbo].[PAK_PO] ADD  CONSTRAINT [DF_PAK_PO_QCRequired]  DEFAULT ((0)) FOR [QCRequired]
GO
ALTER TABLE [dbo].[PAK_PO] ADD  CONSTRAINT [DF_PAK_PO_AcceptedBySupplier]  DEFAULT ((0)) FOR [AcceptedBySupplier]
GO
USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDM_Transmittal](
	[TmtlID] [int] IDENTITY(1,1) NOT NULL,
	[TmtlTypeID] [nvarchar](2) NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[CustomerID] [nvarchar](6) NULL,
	[VendorID] [nvarchar](9) NULL,
	[CardNo] [nvarchar](8) NULL,
	[UseSpecificContact] [bit] NOT NULL,
	[SerialNo] [int] NULL,
	[ProjectSerialNo] [int] NULL,
	[CustomerSerialNo] [int] NULL,
	[VendorSerialNo] [int] NULL,
	[TmtlReference] [nvarchar](30) NULL,
	[Subject] [nvarchar](500) NULL,
	[Remarks] [nvarchar](1000) NULL,
	[ToEMailID] [nvarchar](1000) NULL,
	[CCEmailID] [nvarchar](1000) NULL,
	[TmtlStatusID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](8) NULL,
	[ResponsibleAgencyID] [int] NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[IssuedViaID] [int] NULL,
	[IssueRemarks] [nvarchar](1000) NULL,
	[IssuedOn] [datetime] NULL,
	[IssuedBy] [nvarchar](8) NULL,
 CONSTRAINT [PK_IDM_Transmittal] PRIMARY KEY CLUSTERED 
(
	[TmtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_ApprovedBy]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_CardNo]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_CreatedBy]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[IDM_Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_Customer]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_CustomerContact] FOREIGN KEY([CustomerID], [CustomerSerialNo])
REFERENCES [dbo].[IDM_CustomerContacts] ([CustomerID], [SerialNo])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_CustomerContact]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_IssuedBy] FOREIGN KEY([IssuedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_IssuedBy]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_IssuedVia] FOREIGN KEY([IssuedViaID])
REFERENCES [dbo].[IDM_IssuedVia] ([IssuedViaID])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_IssuedVia]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_ModifiedBy]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_Project]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_ProjectContact] FOREIGN KEY([ProjectID], [ProjectSerialNo])
REFERENCES [dbo].[IDM_ProjectContacts] ([ProjectID], [SerialNo])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_ProjectContact]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_ResponsibleAgency] FOREIGN KEY([ResponsibleAgencyID])
REFERENCES [dbo].[IDM_ResponsibleAgency] ([ResponsibleAgencyID])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_ResponsibleAgency]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_TmtlType] FOREIGN KEY([TmtlTypeID])
REFERENCES [dbo].[IDM_TransmittalTypes] ([TmtlTypeID])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_TmtlType]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_TransmittalStatus] FOREIGN KEY([TmtlStatusID])
REFERENCES [dbo].[IDM_TransmittalStatus] ([TmtlStatusID])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_TransmittalStatus]
GO
ALTER TABLE [dbo].[IDM_Transmittal]  WITH CHECK ADD  CONSTRAINT [FK_TT_VendorContact] FOREIGN KEY([VendorID], [VendorSerialNo])
REFERENCES [dbo].[IDM_VendorContacts] ([VendorID], [SerialNo])
GO
ALTER TABLE [dbo].[IDM_Transmittal] CHECK CONSTRAINT [FK_TT_VendorContact]
GO
ALTER TABLE [dbo].[IDM_Transmittal] ADD  CONSTRAINT [DF_IDM_aTransmittal_UseSpecificAddress]  DEFAULT ((0)) FOR [UseSpecificContact]
GO

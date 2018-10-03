USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDM_CustomerTransmittal](
	[TmtlID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[CustomerID] [nvarchar](6) NOT NULL,
	[TmtlReference] [nvarchar](30) NULL,
	[UseSpecificContact] [bit] NOT NULL,
	[SerialNo] [int] NULL,
	[Subject] [nvarchar](500) NULL,
	[Remarks] [nvarchar](1000) NULL,
	[ToEMailID] [nvarchar](1000) NULL,
	[CCEmailID] [nvarchar](1000) NULL,
	[TmtlStatusID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[ResponsibleAgencyID] [int] NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[IssuedViaID] [int] NULL,
	[IssueRemarks] [nvarchar](1000) NULL,
	[IssuedOn] [datetime] NULL,
	[IssuedBy] [nvarchar](8) NULL,
 CONSTRAINT [PK_IDM_CustomerTransmittal] PRIMARY KEY CLUSTERED 
(
	[TmtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal]  WITH CHECK ADD  CONSTRAINT [FK_CT_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] CHECK CONSTRAINT [FK_CT_ApprovedBy]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal]  WITH CHECK ADD  CONSTRAINT [FK_CT_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] CHECK CONSTRAINT [FK_CT_CreatedBy]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal]  WITH CHECK ADD  CONSTRAINT [FK_CT_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[IDM_Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] CHECK CONSTRAINT [FK_CT_Customer]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal]  WITH CHECK ADD  CONSTRAINT [FK_CT_CustomerContact] FOREIGN KEY([CustomerID], [SerialNo])
REFERENCES [dbo].[IDM_CustomerContacts] ([CustomerID], [SerialNo])
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] CHECK CONSTRAINT [FK_CT_CustomerContact]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal]  WITH CHECK ADD  CONSTRAINT [FK_CT_IssuedBy] FOREIGN KEY([IssuedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] CHECK CONSTRAINT [FK_CT_IssuedBy]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal]  WITH CHECK ADD  CONSTRAINT [FK_CT_IssuedVia] FOREIGN KEY([IssuedViaID])
REFERENCES [dbo].[IDM_IssuedVia] ([IssuedViaID])
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] CHECK CONSTRAINT [FK_CT_IssuedVia]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal]  WITH CHECK ADD  CONSTRAINT [FK_CT_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] CHECK CONSTRAINT [FK_CT_Project]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal]  WITH CHECK ADD  CONSTRAINT [FK_CT_ResponsibleAgency] FOREIGN KEY([ResponsibleAgencyID])
REFERENCES [dbo].[IDM_ResponsibleAgency] ([ResponsibleAgencyID])
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] CHECK CONSTRAINT [FK_CT_ResponsibleAgency]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal]  WITH CHECK ADD  CONSTRAINT [FK_CT_TransmittalStatus] FOREIGN KEY([TmtlStatusID])
REFERENCES [dbo].[IDM_TransmittalStatus] ([TmtlStatusID])
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] CHECK CONSTRAINT [FK_CT_TransmittalStatus]
GO
ALTER TABLE [dbo].[IDM_CustomerTransmittal] ADD  CONSTRAINT [DF_IDM_Transmittal_UseSpecificAddress]  DEFAULT ((0)) FOR [UseSpecificContact]
GO

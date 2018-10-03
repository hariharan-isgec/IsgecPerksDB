USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QAP_Requests](
	[RequestNo] [int] IDENTITY(1,1) NOT NULL,
	[QAPNo] [nvarchar](50) NULL,
	[QAPRevisionNo] [nvarchar](50) NULL,
	[DocumentTypeID] [int] NULL,
	[ProjectID] [nvarchar](6) NULL,
	[SupplierID] [nvarchar](9) NULL,
	[SubSupplier] [nvarchar](250) NULL,
	[MainItem] [nvarchar](250) NULL,
	[SubItem] [nvarchar](250) NULL,
	[ClientApprovalRequired] [bit] NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatersDivision] [nvarchar](6) NULL,
	[ReviewBy] [nvarchar](8) NULL,
	[ReviewOn] [datetime] NULL,
	[ReviewerRemarks] [nvarchar](250) NULL,
	[ReviewerDivision] [nvarchar](6) NULL,
	[ApproveBy] [nvarchar](8) NULL,
	[ApproveOn] [datetime] NULL,
	[ApproverRemarks] [nvarchar](250) NULL,
	[ApproverDivision] [nvarchar](6) NULL,
	[StatusID] [int] NULL,
	[PurposeID] [int] NOT NULL,
	[Division] [nvarchar](30) NULL,
 CONSTRAINT [PK_QAP_Requests] PRIMARY KEY CLUSTERED 
(
	[RequestNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_ApprovedBy] FOREIGN KEY([ApproveBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_ApprovedBy]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_ApproverDivision] FOREIGN KEY([ApproverDivision])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_ApproverDivision]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_CreatedBy]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_CreaterDivision] FOREIGN KEY([CreatersDivision])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_CreaterDivision]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_DocumentTypeID] FOREIGN KEY([DocumentTypeID])
REFERENCES [dbo].[QAP_DocumentTypes] ([DocumentTypeID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_DocumentTypeID]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_ProjectID]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_PurposeID] FOREIGN KEY([PurposeID])
REFERENCES [dbo].[QAP_Purpose] ([PurposeID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_PurposeID]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_ReviewBy] FOREIGN KEY([ReviewBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_ReviewBy]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_ReviewerDivision] FOREIGN KEY([ReviewerDivision])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_ReviewerDivision]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[QAP_States] ([StatusID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_StatusID]
GO
ALTER TABLE [dbo].[QAP_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Requests_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[IDM_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[QAP_Requests] CHECK CONSTRAINT [FK_QAP_Requests_SupplierID]
GO
ALTER TABLE [dbo].[QAP_Requests] ADD  CONSTRAINT [DF_QAP_Requests_ClientApprovalRequired]  DEFAULT ((0)) FOR [ClientApprovalRequired]
GO
ALTER TABLE [dbo].[QAP_Requests] ADD  CONSTRAINT [DF_QAP_Requests_PurposeID_1]  DEFAULT ((1)) FOR [PurposeID]
GO

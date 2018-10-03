USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EITL_POOpenRequest](
	[RequestNo] [int] IDENTITY(1,1) NOT NULL,
	[SerialNo] [int] NULL,
	[PORevision] [nvarchar](10) NULL,
	[SupplierID] [nvarchar](9) NULL,
	[Remarks] [nvarchar](500) NULL,
	[RequestedOn] [datetime] NULL,
	[ExecutedBy] [nvarchar](8) NULL,
	[ExecutedOn] [datetime] NULL,
	[ExecuterRemarks] [nvarchar](500) NULL,
	[ExecutedToOpen] [bit] NOT NULL,
 CONSTRAINT [PK_EITL_POOpenRequest] PRIMARY KEY CLUSTERED 
(
	[RequestNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EITL_POOpenRequest]  WITH CHECK ADD  CONSTRAINT [FK_EITL_POOpenRequest_ExecutedBy] FOREIGN KEY([ExecutedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[EITL_POOpenRequest] CHECK CONSTRAINT [FK_EITL_POOpenRequest_ExecutedBy]
GO
ALTER TABLE [dbo].[EITL_POOpenRequest]  WITH CHECK ADD  CONSTRAINT [FK_EITL_POOpenRequest_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[EITL_POList] ([SerialNo])
GO
ALTER TABLE [dbo].[EITL_POOpenRequest] CHECK CONSTRAINT [FK_EITL_POOpenRequest_SerialNo]
GO
ALTER TABLE [dbo].[EITL_POOpenRequest]  WITH CHECK ADD  CONSTRAINT [FK_EITL_POOpenRequest_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[EITL_Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[EITL_POOpenRequest] CHECK CONSTRAINT [FK_EITL_POOpenRequest_SupplierID]
GO
ALTER TABLE [dbo].[EITL_POOpenRequest] ADD  CONSTRAINT [DF_EITL_POOpenRequest_ExecutedToOpen]  DEFAULT ((0)) FOR [ExecutedToOpen]
GO

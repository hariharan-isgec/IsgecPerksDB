USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCM_CustomerTmtlHeader](
	[TmtlID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[CustomerID] [nvarchar](6) NOT NULL,
	[TmtlReference] [nvarchar](30) NULL,
	[Subject] [nvarchar](500) NULL,
	[Remarks] [nvarchar](1000) NULL,
	[TmtlStatusID] [nvarchar](1) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
 CONSTRAINT [PK_DCM_CustomerTmtlHeader_1] PRIMARY KEY CLUSTERED 
(
	[TmtlID] ASC,
	[ProjectID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlHeader]  WITH CHECK ADD  CONSTRAINT [FK_DCM_CustomerTmtlHeader_DCM_Customers] FOREIGN KEY([ProjectID], [CustomerID])
REFERENCES [dbo].[DCM_Customers] ([ProjectID], [CustomerID])
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlHeader] CHECK CONSTRAINT [FK_DCM_CustomerTmtlHeader_DCM_Customers]
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlHeader]  WITH CHECK ADD  CONSTRAINT [FK_DCM_CustomerTmtlHeader_DCM_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[DCM_Projectss] ([ProjectID])
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlHeader] CHECK CONSTRAINT [FK_DCM_CustomerTmtlHeader_DCM_Projects]
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlHeader]  WITH CHECK ADD  CONSTRAINT [FK_DCM_CustomerTmtlHeader_DCM_TmtlStatus] FOREIGN KEY([TmtlStatusID])
REFERENCES [dbo].[DCM_TmtlStatus] ([StatusID])
GO
ALTER TABLE [dbo].[DCM_CustomerTmtlHeader] CHECK CONSTRAINT [FK_DCM_CustomerTmtlHeader_DCM_TmtlStatus]
GO

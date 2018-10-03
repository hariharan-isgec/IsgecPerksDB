USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AST_AssetHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[HistoryType] [nvarchar](20) NOT NULL,
	[AssetID] [int] NOT NULL,
	[MrnID] [int] NULL,
	[AssetTypeID] [int] NULL,
	[BrandID] [int] NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Features] [nvarchar](100) NOT NULL,
	[AssetNo] [nvarchar](20) NOT NULL,
	[SerialNo] [nvarchar](50) NOT NULL,
	[LocationID] [int] NULL,
	[UserID] [int] NULL,
	[Remarks] [nvarchar](100) NOT NULL,
	[Discarded] [bit] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_AST_AssetHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AST_AssetHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_AssetHistory_AST_AssetDetails] FOREIGN KEY([AssetID])
REFERENCES [dbo].[AST_AssetDetails] ([AssetID])
GO
ALTER TABLE [dbo].[AST_AssetHistory] CHECK CONSTRAINT [FK_AST_AssetHistory_AST_AssetDetails]
GO
ALTER TABLE [dbo].[AST_AssetHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_AssetHistory_AST_AssetTypes] FOREIGN KEY([AssetTypeID])
REFERENCES [dbo].[AST_AssetTypes] ([AssetTypeID])
GO
ALTER TABLE [dbo].[AST_AssetHistory] CHECK CONSTRAINT [FK_AST_AssetHistory_AST_AssetTypes]
GO
ALTER TABLE [dbo].[AST_AssetHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_AssetHistory_AST_Brands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[AST_Brands] ([BrandID])
GO
ALTER TABLE [dbo].[AST_AssetHistory] CHECK CONSTRAINT [FK_AST_AssetHistory_AST_Brands]
GO
ALTER TABLE [dbo].[AST_AssetHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_AssetHistory_AST_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[AST_Locations] ([LocationID])
GO
ALTER TABLE [dbo].[AST_AssetHistory] CHECK CONSTRAINT [FK_AST_AssetHistory_AST_Locations]
GO
ALTER TABLE [dbo].[AST_AssetHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_AssetHistory_AST_MRNAsset] FOREIGN KEY([MrnID])
REFERENCES [dbo].[AST_MRNAsset] ([MrnID])
GO
ALTER TABLE [dbo].[AST_AssetHistory] CHECK CONSTRAINT [FK_AST_AssetHistory_AST_MRNAsset]
GO
ALTER TABLE [dbo].[AST_AssetHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_AssetHistory_PRK_Employees] FOREIGN KEY([UserID])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[AST_AssetHistory] CHECK CONSTRAINT [FK_AST_AssetHistory_PRK_Employees]
GO
ALTER TABLE [dbo].[AST_AssetHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_AssetHistory_PRK_Employees1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[AST_AssetHistory] CHECK CONSTRAINT [FK_AST_AssetHistory_PRK_Employees1]
GO
ALTER TABLE [dbo].[AST_AssetHistory] ADD  CONSTRAINT [DF_AST_AssetHistory_HistoryType]  DEFAULT ('') FOR [HistoryType]
GO
ALTER TABLE [dbo].[AST_AssetHistory] ADD  CONSTRAINT [DF_AST_AssetHistory_Model]  DEFAULT ('') FOR [Model]
GO
ALTER TABLE [dbo].[AST_AssetHistory] ADD  CONSTRAINT [DF_AST_AssetHistory_Description]  DEFAULT ('') FOR [Features]
GO
ALTER TABLE [dbo].[AST_AssetHistory] ADD  CONSTRAINT [DF_AST_AssetHistory_AssetNo]  DEFAULT ('') FOR [AssetNo]
GO
ALTER TABLE [dbo].[AST_AssetHistory] ADD  CONSTRAINT [DF_AST_AssetHistory_SerialNo]  DEFAULT ('') FOR [SerialNo]
GO
ALTER TABLE [dbo].[AST_AssetHistory] ADD  CONSTRAINT [DF_AST_AssetHistory_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[AST_AssetHistory] ADD  CONSTRAINT [DF_AST_AssetHistory_Discarded]  DEFAULT ((0)) FOR [Discarded]
GO
ALTER TABLE [dbo].[AST_AssetHistory] ADD  CONSTRAINT [DF_AST_AssetHistory_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO

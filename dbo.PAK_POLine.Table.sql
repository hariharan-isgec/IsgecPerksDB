USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_POLine](
	[SerialNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[ItemCode] [nvarchar](47) NULL,
	[ItemDescription] [nvarchar](100) NULL,
	[ItemQuantity] [decimal](14, 6) NULL,
	[ItemUnit] [nvarchar](3) NULL,
	[ItemPrice] [decimal](15, 6) NULL,
	[ItemAmount] [decimal](15, 6) NULL,
	[ItemElement] [nvarchar](8) NULL,
	[ItemStatusID] [int] NULL,
 CONSTRAINT [PK_PAK_POLine] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_POLine]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLine_ItemElement] FOREIGN KEY([ItemElement])
REFERENCES [dbo].[IDM_WBS] ([WBSID])
GO
ALTER TABLE [dbo].[PAK_POLine] CHECK CONSTRAINT [FK_PAK_POLine_ItemElement]
GO
ALTER TABLE [dbo].[PAK_POLine]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLine_ItemStatusID] FOREIGN KEY([ItemStatusID])
REFERENCES [dbo].[PAK_POLineStatus] ([ItemStatusID])
GO
ALTER TABLE [dbo].[PAK_POLine] CHECK CONSTRAINT [FK_PAK_POLine_ItemStatusID]
GO
ALTER TABLE [dbo].[PAK_POLine]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLine_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_POLine] CHECK CONSTRAINT [FK_PAK_POLine_SerialNo]
GO

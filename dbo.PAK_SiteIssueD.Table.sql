USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SiteIssueD](
	[ProjectID] [nvarchar](6) NOT NULL,
	[IssueNo] [int] NOT NULL,
	[IssueSrNo] [int] IDENTITY(1,1) NOT NULL,
	[SiteMarkNo] [nvarchar](30) NOT NULL,
	[UOMQuantity] [int] NULL,
	[QuantityRequired] [decimal](18, 4) NOT NULL,
	[QuantityIssued] [decimal](18, 4) NOT NULL,
	[Remarks] [nvarchar](100) NULL,
	[IssuerRemarks] [nvarchar](100) NULL,
 CONSTRAINT [PK_PAK_SiteIssueD] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[IssueNo] ASC,
	[IssueSrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SiteIssueD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueD_IssueNo] FOREIGN KEY([ProjectID], [IssueNo])
REFERENCES [dbo].[PAK_SiteIssueH] ([ProjectID], [IssueNo])
GO
ALTER TABLE [dbo].[PAK_SiteIssueD] CHECK CONSTRAINT [FK_PAK_SiteIssueD_IssueNo]
GO
ALTER TABLE [dbo].[PAK_SiteIssueD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueD_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueD] CHECK CONSTRAINT [FK_PAK_SiteIssueD_ProjectID]
GO
ALTER TABLE [dbo].[PAK_SiteIssueD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueD_SiteMarkNo] FOREIGN KEY([ProjectID], [SiteMarkNo])
REFERENCES [dbo].[PAK_SiteItemMaster] ([ProjectID], [SiteMarkNo])
GO
ALTER TABLE [dbo].[PAK_SiteIssueD] CHECK CONSTRAINT [FK_PAK_SiteIssueD_SiteMarkNo]
GO
ALTER TABLE [dbo].[PAK_SiteIssueD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueD_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueD] CHECK CONSTRAINT [FK_PAK_SiteIssueD_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_SiteIssueD] ADD  CONSTRAINT [DF_Table_1_Quantity]  DEFAULT ((0)) FOR [QuantityRequired]
GO
ALTER TABLE [dbo].[PAK_SiteIssueD] ADD  CONSTRAINT [DF_Table_1_QuantityRequired1]  DEFAULT ((0)) FOR [QuantityIssued]
GO

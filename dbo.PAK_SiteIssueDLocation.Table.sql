USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SiteIssueDLocation](
	[ProjectID] [nvarchar](6) NOT NULL,
	[IssueNo] [int] NOT NULL,
	[IssueSrNo] [int] NOT NULL,
	[IssueSrLNo] [int] IDENTITY(1,1) NOT NULL,
	[SiteMarkNo] [nvarchar](30) NOT NULL,
	[LocationID] [int] NOT NULL,
	[UOMQuantity] [int] NULL,
	[QuantityAvailable] [decimal](18, 4) NOT NULL,
	[QuantityIssued] [decimal](18, 4) NOT NULL,
	[Remarks] [nvarchar](100) NULL,
	[Support] [bit] NOT NULL,
 CONSTRAINT [PK_PAK_SiteIssueDLocation] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[IssueNo] ASC,
	[IssueSrNo] ASC,
	[IssueSrLNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueDLocation_IssueNo] FOREIGN KEY([ProjectID], [IssueNo])
REFERENCES [dbo].[PAK_SiteIssueH] ([ProjectID], [IssueNo])
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation] CHECK CONSTRAINT [FK_PAK_SiteIssueDLocation_IssueNo]
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueDLocation_IssueSrNo] FOREIGN KEY([ProjectID], [IssueNo], [IssueSrNo])
REFERENCES [dbo].[PAK_SiteIssueD] ([ProjectID], [IssueNo], [IssueSrNo])
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation] CHECK CONSTRAINT [FK_PAK_SiteIssueDLocation_IssueSrNo]
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueDLocation_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[PAK_SiteLocations] ([LocationID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation] CHECK CONSTRAINT [FK_PAK_SiteIssueDLocation_LocationID]
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueDLocation_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation] CHECK CONSTRAINT [FK_PAK_SiteIssueDLocation_ProjectID]
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueDLocation_SiteMarkNo] FOREIGN KEY([ProjectID], [SiteMarkNo])
REFERENCES [dbo].[PAK_SiteItemMaster] ([ProjectID], [SiteMarkNo])
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation] CHECK CONSTRAINT [FK_PAK_SiteIssueDLocation_SiteMarkNo]
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueDLocation_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation] CHECK CONSTRAINT [FK_PAK_SiteIssueDLocation_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation] ADD  CONSTRAINT [DF_PAK_SiteIssueDLocation_QuantityIssued1]  DEFAULT ((0)) FOR [QuantityAvailable]
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation] ADD  CONSTRAINT [DF_PAK_SiteIssueDLocation_QuantityIssued]  DEFAULT ((0)) FOR [QuantityIssued]
GO
ALTER TABLE [dbo].[PAK_SiteIssueDLocation] ADD  CONSTRAINT [DF_PAK_SiteIssueDLocation_Support]  DEFAULT ((0)) FOR [Support]
GO

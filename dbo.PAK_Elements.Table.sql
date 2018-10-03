USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_Elements](
	[ElementID] [nvarchar](8) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[ResponsibleAgencyID] [int] NULL,
	[ParentElementID] [nvarchar](8) NULL,
	[ElementLevel] [int] NULL,
	[Prefix] [nvarchar](1000) NULL,
 CONSTRAINT [PK_PAK_Elements] PRIMARY KEY CLUSTERED 
(
	[ElementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_Elements]  WITH CHECK ADD  CONSTRAINT [FK_PAK_Elements_ParentElementID] FOREIGN KEY([ParentElementID])
REFERENCES [dbo].[PAK_Elements] ([ElementID])
GO
ALTER TABLE [dbo].[PAK_Elements] CHECK CONSTRAINT [FK_PAK_Elements_ParentElementID]
GO
ALTER TABLE [dbo].[PAK_Elements]  WITH CHECK ADD  CONSTRAINT [FK_PAK_Elements_ResponsibleAgemcyID] FOREIGN KEY([ResponsibleAgencyID])
REFERENCES [dbo].[PAK_ResponsibleAgencies] ([ResponsibleAgencyID])
GO
ALTER TABLE [dbo].[PAK_Elements] CHECK CONSTRAINT [FK_PAK_Elements_ResponsibleAgemcyID]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_F_LodgDA](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[RegionID] [nvarchar](10) NULL,
	[Lodging] [decimal](10, 2) NULL,
	[DA] [decimal](10, 2) NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TA_F_LodgDA] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_F_LodgDA]  WITH CHECK ADD  CONSTRAINT [FK_TA_F_LodgDA_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[TA_F_LodgDA] CHECK CONSTRAINT [FK_TA_F_LodgDA_CategoryID]
GO
ALTER TABLE [dbo].[TA_F_LodgDA]  WITH CHECK ADD  CONSTRAINT [FK_TA_F_LodgDA_RegionID] FOREIGN KEY([RegionID])
REFERENCES [dbo].[TA_Regions] ([RegionID])
GO
ALTER TABLE [dbo].[TA_F_LodgDA] CHECK CONSTRAINT [FK_TA_F_LodgDA_RegionID]
GO
ALTER TABLE [dbo].[TA_F_LodgDA] ADD  CONSTRAINT [DF_TA_F_LodgDA_Active]  DEFAULT ((0)) FOR [Active]
GO
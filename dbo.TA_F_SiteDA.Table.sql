USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_F_SiteDA](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Cont_Tech_Bord_DA] [decimal](10, 2) NULL,
	[Cont_Tech_DA] [decimal](10, 2) NULL,
	[Cont_NonT_Bord_DA] [decimal](10, 2) NULL,
	[Cont_NonT_DA] [decimal](10, 2) NULL,
	[Perm_Bord_DA] [decimal](10, 2) NULL,
	[Perm_DA] [decimal](10, 2) NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TA_F_SiteDA] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_F_SiteDA]  WITH CHECK ADD  CONSTRAINT [FK_TA_F_SiteDA_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[TA_F_SiteDA] CHECK CONSTRAINT [FK_TA_F_SiteDA_CategoryID]
GO
ALTER TABLE [dbo].[TA_F_SiteDA] ADD  CONSTRAINT [DF_TA_F_SiteDA_Active]  DEFAULT ((0)) FOR [Active]
GO

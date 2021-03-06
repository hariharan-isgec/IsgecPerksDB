USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_GLGroupGLs](
	[GLGroupID] [int] NOT NULL,
	[GLCode] [nvarchar](7) NOT NULL,
	[EffectiveStartDate] [datetime] NULL,
	[EffectiveEndDate] [datetime] NULL,
 CONSTRAINT [PK_COST_GLGroupGLs] PRIMARY KEY CLUSTERED 
(
	[GLGroupID] ASC,
	[GLCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_GLGroupGLs]  WITH CHECK ADD  CONSTRAINT [FK_COST_GLGroupGLs_GLCode] FOREIGN KEY([GLCode])
REFERENCES [dbo].[COST_ERPGLCodes] ([GLCode])
GO
ALTER TABLE [dbo].[COST_GLGroupGLs] CHECK CONSTRAINT [FK_COST_GLGroupGLs_GLCode]
GO
ALTER TABLE [dbo].[COST_GLGroupGLs]  WITH CHECK ADD  CONSTRAINT [FK_COST_GLGroupGLs_GLGroupID] FOREIGN KEY([GLGroupID])
REFERENCES [dbo].[COST_GLGroups] ([GLGroupID])
GO
ALTER TABLE [dbo].[COST_GLGroupGLs] CHECK CONSTRAINT [FK_COST_GLGroupGLs_GLGroupID]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_SanctionAlert](
	[ProjectID] [nvarchar](6) NOT NULL,
	[At60] [bit] NOT NULL,
	[At70] [bit] NOT NULL,
	[At80] [bit] NOT NULL,
	[At90] [bit] NOT NULL,
	[At95] [bit] NOT NULL,
	[At96] [bit] NOT NULL,
	[At97] [bit] NOT NULL,
	[At98] [bit] NOT NULL,
	[At99] [bit] NOT NULL,
	[EMailIDs] [nvarchar](250) NULL,
 CONSTRAINT [PK_VR_SanctionAlert] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_SanctionAlert]  WITH CHECK ADD  CONSTRAINT [FK_VR_SanctionAlert_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[VR_SanctionAlert] CHECK CONSTRAINT [FK_VR_SanctionAlert_ProjectID]
GO
ALTER TABLE [dbo].[VR_SanctionAlert] ADD  CONSTRAINT [DF_VR_SanctionAlert_At60]  DEFAULT ((0)) FOR [At60]
GO
ALTER TABLE [dbo].[VR_SanctionAlert] ADD  CONSTRAINT [DF_VR_SanctionAlert_At70]  DEFAULT ((0)) FOR [At70]
GO
ALTER TABLE [dbo].[VR_SanctionAlert] ADD  CONSTRAINT [DF_VR_SanctionAlert_At80]  DEFAULT ((0)) FOR [At80]
GO
ALTER TABLE [dbo].[VR_SanctionAlert] ADD  CONSTRAINT [DF_VR_SanctionAlert_At90]  DEFAULT ((0)) FOR [At90]
GO
ALTER TABLE [dbo].[VR_SanctionAlert] ADD  CONSTRAINT [DF_VR_SanctionAlert_At95]  DEFAULT ((0)) FOR [At95]
GO
ALTER TABLE [dbo].[VR_SanctionAlert] ADD  CONSTRAINT [DF_VR_SanctionAlert_At97]  DEFAULT ((0)) FOR [At97]
GO
ALTER TABLE [dbo].[VR_SanctionAlert] ADD  CONSTRAINT [DF_VR_SanctionAlert_At98]  DEFAULT ((0)) FOR [At98]
GO
ALTER TABLE [dbo].[VR_SanctionAlert] ADD  CONSTRAINT [DF_VR_SanctionAlert_At99]  DEFAULT ((0)) FOR [At99]
GO

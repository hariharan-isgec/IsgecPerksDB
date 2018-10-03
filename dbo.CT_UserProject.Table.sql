USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_UserProject](
	[UserID] [nvarchar](8) NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_CT_UserProject] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_UserProject]  WITH CHECK ADD  CONSTRAINT [FK_CT_UserProject_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[CT_UserProject] CHECK CONSTRAINT [FK_CT_UserProject_ProjectID]
GO
ALTER TABLE [dbo].[CT_UserProject]  WITH CHECK ADD  CONSTRAINT [FK_CT_UserProject_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[CT_UserProject] CHECK CONSTRAINT [FK_CT_UserProject_UserID]
GO
ALTER TABLE [dbo].[CT_UserProject] ADD  CONSTRAINT [DF_CT_UserProject_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

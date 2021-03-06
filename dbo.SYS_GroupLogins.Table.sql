USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_GroupLogins](
	[GroupID] [nvarchar](6) NOT NULL,
	[LoginID] [nvarchar](8) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SYS_GroupLogins] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[LoginID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SYS_GroupLogins]  WITH CHECK ADD  CONSTRAINT [FK_SYS_GroupLogins_SYS_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[SYS_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[SYS_GroupLogins] CHECK CONSTRAINT [FK_SYS_GroupLogins_SYS_Groups]
GO
ALTER TABLE [dbo].[SYS_GroupLogins] ADD  CONSTRAINT [DF_PMTN_GroupLogins_Active]  DEFAULT ((1)) FOR [Active]
GO

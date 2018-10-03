USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_LinkExecutions](
	[LinkID] [int] NOT NULL,
	[SRNNo] [int] NOT NULL,
	[LinkedBy] [nvarchar](8) NULL,
	[LinkedOn] [datetime] NULL,
 CONSTRAINT [PK_VR_LinkExecutions] PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC,
	[SRNNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_LinkExecutions]  WITH CHECK ADD  CONSTRAINT [FK_VR_LinkExecutions_LinkedBy] FOREIGN KEY([LinkedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_LinkExecutions] CHECK CONSTRAINT [FK_VR_LinkExecutions_LinkedBy]
GO
ALTER TABLE [dbo].[VR_LinkExecutions]  WITH CHECK ADD  CONSTRAINT [FK_VR_LinkExecutions_SRNNo] FOREIGN KEY([SRNNo])
REFERENCES [dbo].[VR_RequestExecution] ([SRNNo])
GO
ALTER TABLE [dbo].[VR_LinkExecutions] CHECK CONSTRAINT [FK_VR_LinkExecutions_SRNNo]
GO

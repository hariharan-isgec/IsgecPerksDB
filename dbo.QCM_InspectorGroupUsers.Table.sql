USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QCM_InspectorGroupUsers](
	[GroupID] [int] NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_QCM_InspectorGroupUsers] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[CardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QCM_InspectorGroupUsers]  WITH CHECK ADD  CONSTRAINT [FK_QCM_IGU_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[QCM_InspectorGroupUsers] CHECK CONSTRAINT [FK_QCM_IGU_CardNo]
GO
ALTER TABLE [dbo].[QCM_InspectorGroupUsers]  WITH CHECK ADD  CONSTRAINT [FK_QCM_IGU_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[QCM_InspectorGroups] ([GroupID])
GO
ALTER TABLE [dbo].[QCM_InspectorGroupUsers] CHECK CONSTRAINT [FK_QCM_IGU_GroupID]
GO

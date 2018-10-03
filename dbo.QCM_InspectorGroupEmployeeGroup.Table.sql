USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QCM_InspectorGroupEmployeeGroup](
	[InspectorGroupID] [int] NOT NULL,
	[EmployeeGroupID] [int] NOT NULL,
 CONSTRAINT [PK_QCM_InspectorGroupEmployeeGroup] PRIMARY KEY CLUSTERED 
(
	[InspectorGroupID] ASC,
	[EmployeeGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QCM_InspectorGroupEmployeeGroup]  WITH CHECK ADD  CONSTRAINT [FK_QCM_IE_EmployeeGroupID] FOREIGN KEY([EmployeeGroupID])
REFERENCES [dbo].[QCM_EmployeeGroups] ([GroupID])
GO
ALTER TABLE [dbo].[QCM_InspectorGroupEmployeeGroup] CHECK CONSTRAINT [FK_QCM_IE_EmployeeGroupID]
GO
ALTER TABLE [dbo].[QCM_InspectorGroupEmployeeGroup]  WITH CHECK ADD  CONSTRAINT [FK_QCM_IE_InspectorGroupID] FOREIGN KEY([InspectorGroupID])
REFERENCES [dbo].[QCM_InspectorGroups] ([GroupID])
GO
ALTER TABLE [dbo].[QCM_InspectorGroupEmployeeGroup] CHECK CONSTRAINT [FK_QCM_IE_InspectorGroupID]
GO

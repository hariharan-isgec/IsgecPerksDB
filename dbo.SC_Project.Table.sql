USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_Project](
	[RequestID] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [nvarchar](6) NULL,
	[ElementID] [nvarchar](8) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[IsFromProject] [bit] NOT NULL,
 CONSTRAINT [PK_SC_Project] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SC_Project]  WITH CHECK ADD  CONSTRAINT [FK_SC_Project_ElementID] FOREIGN KEY([ElementID])
REFERENCES [dbo].[IDM_WBS] ([WBSID])
GO
ALTER TABLE [dbo].[SC_Project] CHECK CONSTRAINT [FK_SC_Project_ElementID]
GO
ALTER TABLE [dbo].[SC_Project]  WITH CHECK ADD  CONSTRAINT [FK_SC_Project_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[SC_Project] CHECK CONSTRAINT [FK_SC_Project_ProjectID]
GO
ALTER TABLE [dbo].[SC_Project]  WITH CHECK ADD  CONSTRAINT [FK_SC_Project_RequestID] FOREIGN KEY([RequestID])
REFERENCES [dbo].[SC_Request] ([RequestID])
GO
ALTER TABLE [dbo].[SC_Project] CHECK CONSTRAINT [FK_SC_Project_RequestID]
GO
ALTER TABLE [dbo].[SC_Project] ADD  CONSTRAINT [DF_SC_Project_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[SC_Project] ADD  CONSTRAINT [DF_SC_Project_IsFromProject]  DEFAULT ((0)) FOR [IsFromProject]
GO

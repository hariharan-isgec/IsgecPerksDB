USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_Monitors](
	[ServiceID] [nvarchar](10) NOT NULL,
	[MonitorID] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_ADM_Monitors] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[MonitorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_Monitors]  WITH CHECK ADD  CONSTRAINT [FK_ADM_Monitors_ADM_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[ADM_Services] ([ServiceID])
GO
ALTER TABLE [dbo].[ADM_Monitors] CHECK CONSTRAINT [FK_ADM_Monitors_ADM_Services]
GO
ALTER TABLE [dbo].[ADM_Monitors]  WITH CHECK ADD  CONSTRAINT [FK_ADM_Monitors_HRM_Employees] FOREIGN KEY([MonitorID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ADM_Monitors] CHECK CONSTRAINT [FK_ADM_Monitors_HRM_Employees]
GO

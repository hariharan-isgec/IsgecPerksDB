USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_ServiceCheckPoints](
	[ServiceID] [nvarchar](10) NOT NULL,
	[CheckPointID] [int] NOT NULL,
 CONSTRAINT [PK_ADM_ServiceCheckPoints] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[CheckPointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_ServiceCheckPoints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceCheckPoints_ADM_CheckPoints] FOREIGN KEY([CheckPointID])
REFERENCES [dbo].[ADM_CheckPoints] ([CheckPointID])
GO
ALTER TABLE [dbo].[ADM_ServiceCheckPoints] CHECK CONSTRAINT [FK_ADM_ServiceCheckPoints_ADM_CheckPoints]
GO
ALTER TABLE [dbo].[ADM_ServiceCheckPoints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceCheckPoints_ADM_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[ADM_Services] ([ServiceID])
GO
ALTER TABLE [dbo].[ADM_ServiceCheckPoints] CHECK CONSTRAINT [FK_ADM_ServiceCheckPoints_ADM_Services]
GO

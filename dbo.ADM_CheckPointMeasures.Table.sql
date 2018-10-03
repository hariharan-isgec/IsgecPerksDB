USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_CheckPointMeasures](
	[CheckPointID] [int] NOT NULL,
	[MeasureID] [int] NOT NULL,
 CONSTRAINT [PK_ADM_CheckPointMeasures] PRIMARY KEY CLUSTERED 
(
	[CheckPointID] ASC,
	[MeasureID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_CheckPointMeasures]  WITH CHECK ADD  CONSTRAINT [FK_ADM_CheckPointMeasures_ADM_CheckPoints] FOREIGN KEY([CheckPointID])
REFERENCES [dbo].[ADM_CheckPoints] ([CheckPointID])
GO
ALTER TABLE [dbo].[ADM_CheckPointMeasures] CHECK CONSTRAINT [FK_ADM_CheckPointMeasures_ADM_CheckPoints]
GO
ALTER TABLE [dbo].[ADM_CheckPointMeasures]  WITH CHECK ADD  CONSTRAINT [FK_ADM_CheckPointMeasures_ADM_Measures] FOREIGN KEY([MeasureID])
REFERENCES [dbo].[ADM_Measures] ([MeasureID])
GO
ALTER TABLE [dbo].[ADM_CheckPointMeasures] CHECK CONSTRAINT [FK_ADM_CheckPointMeasures_ADM_Measures]
GO

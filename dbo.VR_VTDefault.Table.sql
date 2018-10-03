USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_VTDefault](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[MinimumCapacityPercentage] [decimal](6, 2) NOT NULL,
	[MaximumCapacityPercentage] [decimal](6, 2) NOT NULL,
	[MinimumHeightPercentage] [decimal](6, 2) NOT NULL,
	[MinimumWidthPercentage] [decimal](6, 2) NOT NULL,
	[MinimumLengthPercentage] [decimal](6, 2) NOT NULL,
	[MaximumHeightPercentage] [decimal](6, 2) NOT NULL,
	[MaximumWidthPercentage] [decimal](6, 2) NOT NULL,
	[MaximumLengthPercentage] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_VR_VTDefault] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_VTDefault] ADD  CONSTRAINT [DF_VR_VTDefault_MinimumCapacityPercentage]  DEFAULT ((0)) FOR [MinimumCapacityPercentage]
GO
ALTER TABLE [dbo].[VR_VTDefault] ADD  CONSTRAINT [DF_VR_VTDefault_MaximumCapacityPercentage]  DEFAULT ((0)) FOR [MaximumCapacityPercentage]
GO
ALTER TABLE [dbo].[VR_VTDefault] ADD  CONSTRAINT [DF_VR_VTDefault_MinimumHeightPercentage]  DEFAULT ((0)) FOR [MinimumHeightPercentage]
GO
ALTER TABLE [dbo].[VR_VTDefault] ADD  CONSTRAINT [DF_VR_VTDefault_MinimumWidthPercentage]  DEFAULT ((0)) FOR [MinimumWidthPercentage]
GO
ALTER TABLE [dbo].[VR_VTDefault] ADD  CONSTRAINT [DF_VR_VTDefault_MinimumLengthPercentage]  DEFAULT ((0)) FOR [MinimumLengthPercentage]
GO
ALTER TABLE [dbo].[VR_VTDefault] ADD  CONSTRAINT [DF_VR_VTDefault_MaximumHeightPercentage]  DEFAULT ((0)) FOR [MaximumHeightPercentage]
GO
ALTER TABLE [dbo].[VR_VTDefault] ADD  CONSTRAINT [DF_VR_VTDefault_MaximumWidthPercentage]  DEFAULT ((0)) FOR [MaximumWidthPercentage]
GO
ALTER TABLE [dbo].[VR_VTDefault] ADD  CONSTRAINT [DF_VR_VTDefault_MaximumLengthPercentage]  DEFAULT ((0)) FOR [MaximumLengthPercentage]
GO

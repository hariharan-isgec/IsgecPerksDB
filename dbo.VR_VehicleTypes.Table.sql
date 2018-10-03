USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VR_VehicleTypes](
	[VehicleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[DefineCapacity] [bit] NOT NULL,
	[CapacityInKG] [decimal](18, 2) NOT NULL,
	[DefineDimention] [bit] NOT NULL,
	[HeightInFt] [decimal](6, 2) NOT NULL,
	[WidthInFt] [decimal](6, 2) NOT NULL,
	[LengthInFt] [decimal](6, 2) NOT NULL,
	[EnforceMinimumCapacity] [bit] NOT NULL,
	[MinimumCapacity] [decimal](18, 2) NOT NULL,
	[EnforceMaximumCapacity] [bit] NOT NULL,
	[MaximumCapacity] [decimal](18, 2) NOT NULL,
	[EnforceMinimumDimention] [bit] NOT NULL,
	[MinimumHeight] [decimal](6, 2) NOT NULL,
	[MinimumWidth] [decimal](6, 2) NOT NULL,
	[MinimumLength] [decimal](6, 2) NOT NULL,
	[EnforceMaximumDimention] [bit] NOT NULL,
	[MaximumHeight] [decimal](6, 2) NOT NULL,
	[MaximumWidth] [decimal](6, 2) NOT NULL,
	[MaximumLength] [decimal](6, 2) NOT NULL,
	[cmba]  AS ((((((((left([description],(50))+'|L-')+CONVERT([char](9),[LengthInFt],(0)))+'|W-')+CONVERT([char](9),[WidthInFt],(0)))+'|H-')+CONVERT([char](9),[HeightInFt],(0)))+'|Wt-')+ltrim(CONVERT([char](18),[CapacityInKG],(2)))) PERSISTED,
	[DailyRunning] [decimal](5, 0) NOT NULL,
 CONSTRAINT [PK_VR_VehicleTypes] PRIMARY KEY CLUSTERED 
(
	[VehicleTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_DefineCapacity]  DEFAULT ((0)) FOR [DefineCapacity]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_WeightCapacityinKG]  DEFAULT ((0)) FOR [CapacityInKG]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_DefineDimention]  DEFAULT ((0)) FOR [DefineDimention]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_HeightInFt]  DEFAULT ((0)) FOR [HeightInFt]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_WidthInFt]  DEFAULT ((0)) FOR [WidthInFt]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_LengthInFt]  DEFAULT ((0)) FOR [LengthInFt]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_EnforceMinimumCapacity]  DEFAULT ((1)) FOR [EnforceMinimumCapacity]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_MinimumCapacity]  DEFAULT ((0)) FOR [MinimumCapacity]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_EnforceMaximumCapacity]  DEFAULT ((0)) FOR [EnforceMaximumCapacity]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_MaximumCapacity]  DEFAULT ((0)) FOR [MaximumCapacity]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_EnforceMinimumDimention]  DEFAULT ((0)) FOR [EnforceMinimumDimention]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_MinimumHeight]  DEFAULT ((0)) FOR [MinimumHeight]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_MinimumWidth]  DEFAULT ((0)) FOR [MinimumWidth]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_MinimumLength]  DEFAULT ((0)) FOR [MinimumLength]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_EnforceMaximumDimention]  DEFAULT ((0)) FOR [EnforceMaximumDimention]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_MaximumHeight]  DEFAULT ((0)) FOR [MaximumHeight]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_MaximumWidth]  DEFAULT ((0)) FOR [MaximumWidth]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_MaximumLength]  DEFAULT ((0)) FOR [MaximumLength]
GO
ALTER TABLE [dbo].[VR_VehicleTypes] ADD  CONSTRAINT [DF_VR_VehicleTypes_DailyRunning_1]  DEFAULT ((0)) FOR [DailyRunning]
GO

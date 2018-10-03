USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VR_VehicleRequestPOs](
	[RequestNo] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[PoNumber] [varchar](9) NULL,
	[PoLine] [int] NULL,
	[Item] [varchar](47) NULL,
	[ItemDescription] [varchar](100) NULL,
	[ItemQuantity] [decimal](18, 4) NULL,
	[QuantityUnit] [int] NULL,
	[ItemWeight] [decimal](18, 4) NULL,
	[WeightUnit] [int] NULL,
	[RequestedWeight] [decimal](18, 4) NULL,
	[RequestedWeightUnit] [int] NULL,
	[PoLineMode] [nvarchar](1) NULL,
 CONSTRAINT [PK_VR_VehicleRequestPOs] PRIMARY KEY CLUSTERED 
(
	[RequestNo] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[VR_VehicleRequestPOs]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequestPOs_QuantityUnit] FOREIGN KEY([QuantityUnit])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[VR_VehicleRequestPOs] CHECK CONSTRAINT [FK_VR_VehicleRequestPOs_QuantityUnit]
GO
ALTER TABLE [dbo].[VR_VehicleRequestPOs]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequestPOs_RequestedWeightUnit] FOREIGN KEY([RequestedWeightUnit])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[VR_VehicleRequestPOs] CHECK CONSTRAINT [FK_VR_VehicleRequestPOs_RequestedWeightUnit]
GO
ALTER TABLE [dbo].[VR_VehicleRequestPOs]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequestPOs_RequestNo] FOREIGN KEY([RequestNo])
REFERENCES [dbo].[VR_VehicleRequest] ([RequestNo])
GO
ALTER TABLE [dbo].[VR_VehicleRequestPOs] CHECK CONSTRAINT [FK_VR_VehicleRequestPOs_RequestNo]
GO
ALTER TABLE [dbo].[VR_VehicleRequestPOs]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequestPOs_WeightUnit] FOREIGN KEY([WeightUnit])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[VR_VehicleRequestPOs] CHECK CONSTRAINT [FK_VR_VehicleRequestPOs_WeightUnit]
GO

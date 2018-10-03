USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QCM_Inspections](
	[RequestID] [int] NOT NULL,
	[InspectionID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[OrderNo] [nvarchar](50) NULL,
	[OrderDate] [datetime] NULL,
	[SupplierID] [nvarchar](9) NOT NULL,
	[InspectionStageiD] [int] NULL,
	[RequestStateID] [nvarchar](10) NOT NULL,
	[InspectedBy] [nvarchar](8) NULL,
	[InspectedOn] [datetime] NULL,
	[InspectedQuantity] [nvarchar](50) NULL,
	[InspectionStatusID] [int] NULL,
	[InspectionRemarks] [nvarchar](500) NULL,
	[FileAttached] [bit] NOT NULL,
	[EnteredBy] [nvarchar](8) NULL,
	[EnteredOn] [datetime] NULL,
	[OfferedQuantity] [decimal](18, 2) NULL,
	[ClearedQuantity] [decimal](18, 2) NULL,
	[UOM] [nvarchar](10) NULL,
	[InspectedQuantityFinal] [nvarchar](50) NULL,
	[OfferedQuantityFinal] [decimal](18, 2) NULL,
	[ClearedQuantityFinal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_QCM_Inspections] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC,
	[InspectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QCM_Inspections]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Inspections_EnteredBy] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[QCM_Inspections] CHECK CONSTRAINT [FK_QCM_Inspections_EnteredBy]
GO
ALTER TABLE [dbo].[QCM_Inspections]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Inspections_InspectedBy] FOREIGN KEY([InspectedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[QCM_Inspections] CHECK CONSTRAINT [FK_QCM_Inspections_InspectedBy]
GO
ALTER TABLE [dbo].[QCM_Inspections]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Inspections_InspectionStageID] FOREIGN KEY([InspectionStageiD])
REFERENCES [dbo].[QCM_InspectionStages] ([InspectionStageID])
GO
ALTER TABLE [dbo].[QCM_Inspections] CHECK CONSTRAINT [FK_QCM_Inspections_InspectionStageID]
GO
ALTER TABLE [dbo].[QCM_Inspections]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Inspections_InspectionStateID] FOREIGN KEY([InspectionStatusID])
REFERENCES [dbo].[QCM_InspectionStatus] ([InspectionStatusID])
GO
ALTER TABLE [dbo].[QCM_Inspections] CHECK CONSTRAINT [FK_QCM_Inspections_InspectionStateID]
GO
ALTER TABLE [dbo].[QCM_Inspections]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Inspections_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[QCM_Inspections] CHECK CONSTRAINT [FK_QCM_Inspections_ProjectID]
GO
ALTER TABLE [dbo].[QCM_Inspections]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Inspections_RequestID] FOREIGN KEY([RequestID])
REFERENCES [dbo].[QCM_Requests] ([RequestID])
GO
ALTER TABLE [dbo].[QCM_Inspections] CHECK CONSTRAINT [FK_QCM_Inspections_RequestID]
GO
ALTER TABLE [dbo].[QCM_Inspections]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Inspections_RequestStateID] FOREIGN KEY([RequestStateID])
REFERENCES [dbo].[QCM_RequestStates] ([StateID])
GO
ALTER TABLE [dbo].[QCM_Inspections] CHECK CONSTRAINT [FK_QCM_Inspections_RequestStateID]
GO
ALTER TABLE [dbo].[QCM_Inspections]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Inspections_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[IDM_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[QCM_Inspections] CHECK CONSTRAINT [FK_QCM_Inspections_SupplierID]
GO
ALTER TABLE [dbo].[QCM_Inspections] ADD  CONSTRAINT [DF_QCM_Inspections_FileAttached]  DEFAULT ((0)) FOR [FileAttached]
GO

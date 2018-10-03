USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QCM_Requests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [nvarchar](6) NULL,
	[OrderNo] [nvarchar](50) NULL,
	[OrderDate] [datetime] NULL,
	[SupplierID] [nvarchar](9) NULL,
	[Description] [nvarchar](500) NOT NULL,
	[TotalRequestedQuantity] [nvarchar](50) NULL,
	[LotSize] [nvarchar](50) NULL,
	[UOM] [nvarchar](10) NULL,
	[DocumentID] [nvarchar](50) NULL,
	[RequestedInspectionStartDate] [datetime] NULL,
	[RequestedInspectionFinishDate] [datetime] NULL,
	[ClientInspectionRequired] [bit] NOT NULL,
	[ThirdPartyInspectionRequired] [bit] NOT NULL,
	[InspectionStageiD] [int] NULL,
	[RequestStateID] [nvarchar](10) NOT NULL,
	[FileAttached] [bit] NOT NULL,
	[ReceivedOn] [datetime] NULL,
	[ReceivedBy] [nvarchar](8) NULL,
	[ReceivingMediumID] [int] NULL,
	[CreatedBy] [nvarchar](8) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreationRemarks] [nvarchar](500) NULL,
	[AllotedTo] [nvarchar](8) NULL,
	[AllotedStartDate] [datetime] NULL,
	[AllotedFinishDate] [datetime] NULL,
	[AllotedOn] [datetime] NULL,
	[AllotedBy] [nvarchar](8) NULL,
	[AllotmentRemarks] [nvarchar](500) NULL,
	[InspectionStartDate] [datetime] NULL,
	[InspectionFinishDate] [datetime] NULL,
	[InspectionStatusID] [int] NULL,
	[CancelledOn] [datetime] NULL,
	[CancelledBy] [nvarchar](8) NULL,
	[CancellationRemarks] [nvarchar](500) NULL,
	[RegionID] [int] NULL,
	[ReturnRemarks] [nvarchar](250) NULL,
	[Paused] [bit] NOT NULL,
	[PausedHrs] [decimal](18, 2) NOT NULL,
	[TotalHrs] [decimal](18, 2) NOT NULL,
	[LastPausedOn] [datetime] NULL,
 CONSTRAINT [PK_QCM_Requests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_AllotedBy] FOREIGN KEY([AllotedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_AllotedBy]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_AllotedTo] FOREIGN KEY([AllotedTo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_AllotedTo]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_CancelledBy] FOREIGN KEY([CancelledBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_CancelledBy]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_Createdby] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_Createdby]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_InspectionStageID] FOREIGN KEY([InspectionStageiD])
REFERENCES [dbo].[QCM_InspectionStages] ([InspectionStageID])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_InspectionStageID]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_InspectionStatus] FOREIGN KEY([InspectionStatusID])
REFERENCES [dbo].[QCM_InspectionStatus] ([InspectionStatusID])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_InspectionStatus]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_ProjectID]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_ReceivedBy] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_ReceivedBy]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_ReceivingMediumIDs] FOREIGN KEY([ReceivingMediumID])
REFERENCES [dbo].[QCM_ReceivingMediums] ([ReceivingMediumID])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_ReceivingMediumIDs]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_RegionID] FOREIGN KEY([RegionID])
REFERENCES [dbo].[QCM_Regions] ([RegionID])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_RegionID]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_RequestStateID] FOREIGN KEY([RequestStateID])
REFERENCES [dbo].[QCM_RequestStates] ([StateID])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_RequestStateID]
GO
ALTER TABLE [dbo].[QCM_Requests]  WITH CHECK ADD  CONSTRAINT [FK_QCM_Requests_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[IDM_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[QCM_Requests] CHECK CONSTRAINT [FK_QCM_Requests_SupplierID]
GO
ALTER TABLE [dbo].[QCM_Requests] ADD  CONSTRAINT [DF_QCM_Requests_ClientInspectionRequired]  DEFAULT ((0)) FOR [ClientInspectionRequired]
GO
ALTER TABLE [dbo].[QCM_Requests] ADD  CONSTRAINT [DF_QCM_Requests_ThirdPartyInspectionRequired]  DEFAULT ((0)) FOR [ThirdPartyInspectionRequired]
GO
ALTER TABLE [dbo].[QCM_Requests] ADD  CONSTRAINT [DF_QCM_Requests_FileAttached]  DEFAULT ((0)) FOR [FileAttached]
GO
ALTER TABLE [dbo].[QCM_Requests] ADD  CONSTRAINT [DF_QCM_Requests_Paused]  DEFAULT ((0)) FOR [Paused]
GO
ALTER TABLE [dbo].[QCM_Requests] ADD  CONSTRAINT [DF_QCM_Requests_PausedHrs]  DEFAULT ((0)) FOR [PausedHrs]
GO
ALTER TABLE [dbo].[QCM_Requests] ADD  CONSTRAINT [DF_QCM_Requests_TotalHrs]  DEFAULT ((0)) FOR [TotalHrs]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERP_ChaneRequest](
	[ApplID] [int] NOT NULL,
	[RequestID] [int] IDENTITY(21,1) NOT NULL,
	[RequestedBy] [nvarchar](8) NOT NULL,
	[RequestedOn] [datetime] NOT NULL,
	[RequestTypeID] [int] NOT NULL,
	[ChangeSubject] [nvarchar](1000) NOT NULL,
	[ChangeDetails] [nvarchar](2000) NOT NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
	[EvaluationByIT] [nvarchar](2000) NULL,
	[EvaluationByITOn] [datetime] NULL,
	[EvaluationByESC] [nvarchar](2000) NULL,
	[EvaluationByESCOn] [datetime] NULL,
	[Justification] [nvarchar](1000) NULL,
	[StatusID] [int] NOT NULL,
	[PriorityID] [int] NULL,
	[ReturnRemarks] [nvarchar](100) NULL,
	[MSLPortalNumber] [nvarchar](50) NULL,
	[MSLPortalOn] [datetime] NULL,
	[EffortEstimation] [decimal](10, 2) NULL,
	[PlannedDeliveryDate] [datetime] NULL,
	[ActualDeliveryDate] [datetime] NULL,
	[ClosingRemarks] [nvarchar](100) NULL,
 CONSTRAINT [PK_ERP_ChaneRequest] PRIMARY KEY CLUSTERED 
(
	[ApplID] ASC,
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ERP_ChaneRequest]  WITH CHECK ADD  CONSTRAINT [FK_ERP_ChaneRequest_ApplID] FOREIGN KEY([ApplID])
REFERENCES [dbo].[ERP_Applications] ([ApplID])
GO
ALTER TABLE [dbo].[ERP_ChaneRequest] CHECK CONSTRAINT [FK_ERP_ChaneRequest_ApplID]
GO
ALTER TABLE [dbo].[ERP_ChaneRequest]  WITH CHECK ADD  CONSTRAINT [FK_ERP_ChaneRequest_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_ChaneRequest] CHECK CONSTRAINT [FK_ERP_ChaneRequest_ApprovedBy]
GO
ALTER TABLE [dbo].[ERP_ChaneRequest]  WITH CHECK ADD  CONSTRAINT [FK_ERP_ChaneRequest_PriorityID] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[ERP_RequestPriority] ([PriorityID])
GO
ALTER TABLE [dbo].[ERP_ChaneRequest] CHECK CONSTRAINT [FK_ERP_ChaneRequest_PriorityID]
GO
ALTER TABLE [dbo].[ERP_ChaneRequest]  WITH CHECK ADD  CONSTRAINT [FK_ERP_ChaneRequest_RequestedBy] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_ChaneRequest] CHECK CONSTRAINT [FK_ERP_ChaneRequest_RequestedBy]
GO
ALTER TABLE [dbo].[ERP_ChaneRequest]  WITH CHECK ADD  CONSTRAINT [FK_ERP_ChaneRequest_RequestTypeID] FOREIGN KEY([RequestTypeID])
REFERENCES [dbo].[ERP_RequestTypes] ([RequestTypeID])
GO
ALTER TABLE [dbo].[ERP_ChaneRequest] CHECK CONSTRAINT [FK_ERP_ChaneRequest_RequestTypeID]
GO
ALTER TABLE [dbo].[ERP_ChaneRequest]  WITH CHECK ADD  CONSTRAINT [FK_ERP_ChaneRequest_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ERP_RequestStatus] ([StatusID])
GO
ALTER TABLE [dbo].[ERP_ChaneRequest] CHECK CONSTRAINT [FK_ERP_ChaneRequest_StatusID]
GO

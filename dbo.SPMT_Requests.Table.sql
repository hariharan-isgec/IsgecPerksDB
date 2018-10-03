USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_Requests](
	[RequestID] [int] NOT NULL,
	[TranTypeID] [nvarchar](3) NOT NULL,
	[RequestedBy] [nvarchar](8) NOT NULL,
	[RequestedOn] [datetime] NOT NULL,
	[RequestRemarks] [nvarchar](500) NOT NULL,
	[CostCenterID] [nvarchar](6) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[ElementID] [nvarchar](8) NULL,
	[ItemCode] [nvarchar](16) NULL,
	[DepartmentID] [nvarchar](6) NULL,
	[EmployeeID] [nvarchar](8) NULL,
	[GLCode] [nvarchar](10) NULL,
	[VendorID] [nvarchar](6) NULL,
	[EstimatedAmount] [decimal](10, 2) NULL,
	[BookingRemarks] [nvarchar](500) NULL,
	[BookedOn] [datetime] NULL,
	[BookedBy] [nvarchar](8) NULL,
	[RQStatusID] [int] NULL,
	[VerifierRemarks] [nvarchar](500) NULL,
	[VerifiedBy] [nvarchar](8) NULL,
	[VerifiedOn] [datetime] NULL,
	[ApproverRemarks] [nvarchar](500) NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
 CONSTRAINT [PK_SPMT_Requests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_ApprovedBy]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_BookedBy] FOREIGN KEY([BookedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_BookedBy]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_CostCenter] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[SPMT_CostCenters] ([CostCenterID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_CostCenter]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_Department]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_Element] FOREIGN KEY([ElementID])
REFERENCES [dbo].[IDM_WBS] ([WBSID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_Element]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_Employee]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_GLedgers] FOREIGN KEY([GLCode])
REFERENCES [dbo].[SPMT_GLedgers] ([GLCode])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_GLedgers]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_Item] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[IDM_Items] ([ItemCode])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_Item]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_Project]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_RequestedBy] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_RequestedBy]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_Status] FOREIGN KEY([RQStatusID])
REFERENCES [dbo].[SPMT_RQStatus] ([RQStatusID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_Status]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_TranType] FOREIGN KEY([TranTypeID])
REFERENCES [dbo].[SPMT_TranTypes] ([TranTypeID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_TranType]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[SPMT_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_Vendor]
GO
ALTER TABLE [dbo].[SPMT_Requests]  WITH CHECK ADD  CONSTRAINT [RQ_VerifiedBy] FOREIGN KEY([VerifiedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_Requests] CHECK CONSTRAINT [RQ_VerifiedBy]
GO

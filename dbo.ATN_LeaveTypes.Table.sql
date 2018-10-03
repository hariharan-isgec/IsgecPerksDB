USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_LeaveTypes](
	[LeaveTypeID] [nvarchar](2) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[OBALApplicable] [bit] NOT NULL,
	[OBALMonthly] [bit] NOT NULL,
	[OpeningBalance] [int] NULL,
	[CarryForward] [bit] NOT NULL,
	[ForwardToLeaveTypeID] [nvarchar](2) NULL,
	[AdvanceApplicable] [bit] NOT NULL,
	[SpecialSanctionRequired] [bit] NOT NULL,
	[SpecialSanctionBy] [nvarchar](8) NULL,
	[Applyiable] [bit] NOT NULL,
	[Postable] [bit] NOT NULL,
	[PostedLeaveTypeID] [nvarchar](2) NULL,
	[Sequence] [int] NULL,
	[MainType] [bit] NOT NULL,
	[ForSite] [bit] NOT NULL,
 CONSTRAINT [PK_ATN_LeaveSetLeaves] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes]  WITH CHECK ADD  CONSTRAINT [FK_ATN_LeaveTypes_ATN_LeaveTypes] FOREIGN KEY([PostedLeaveTypeID])
REFERENCES [dbo].[ATN_LeaveTypes] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] CHECK CONSTRAINT [FK_ATN_LeaveTypes_ATN_LeaveTypes]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes]  WITH CHECK ADD  CONSTRAINT [FK_ATN_LeaveTypes_ATN_LeaveTypes1] FOREIGN KEY([ForwardToLeaveTypeID])
REFERENCES [dbo].[ATN_LeaveTypes] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] CHECK CONSTRAINT [FK_ATN_LeaveTypes_ATN_LeaveTypes1]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes]  WITH CHECK ADD  CONSTRAINT [FK_ATN_LeaveTypess_HRM_Employees] FOREIGN KEY([SpecialSanctionBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] CHECK CONSTRAINT [FK_ATN_LeaveTypess_HRM_Employees]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_ATN_LeaveSetLeaves_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_Table_1_ObalApplicable]  DEFAULT ((0)) FOR [OBALApplicable]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_ATN_LeaveSetLeaves_OBALMonthly]  DEFAULT ((0)) FOR [OBALMonthly]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_ATN_LeaveSetLeaves_CarryForward]  DEFAULT ((0)) FOR [CarryForward]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_ATN_LeaveSetLeaves_AdvanceApplicable]  DEFAULT ((0)) FOR [AdvanceApplicable]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_ATN_LeaveSetLeaves_SpecialSanctionRequired]  DEFAULT ((0)) FOR [SpecialSanctionRequired]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_ATN_LeaveSetLeaves_Applyiable]  DEFAULT ((0)) FOR [Applyiable]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_ATN_LeaveSetLeaves_Postable]  DEFAULT ((0)) FOR [Postable]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_ATN_LeaveTypes_MainType]  DEFAULT ((0)) FOR [MainType]
GO
ALTER TABLE [dbo].[ATN_LeaveTypes] ADD  CONSTRAINT [DF_ATN_LeaveTypes_ForSite]  DEFAULT ((0)) FOR [ForSite]
GO

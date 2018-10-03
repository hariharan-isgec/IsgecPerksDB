USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_Attendance](
	[AttenID] [int] IDENTITY(1,1) NOT NULL,
	[AttenDate] [datetime] NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[Punch1Time] [decimal](6, 2) NULL,
	[Punch2Time] [decimal](6, 2) NULL,
	[Punch9Time] [decimal](6, 2) NULL,
	[PunchStatusID] [nvarchar](2) NULL,
	[PunchValue] [decimal](6, 2) NULL,
	[NeedsRegularization] [bit] NOT NULL,
	[FinYear] [nvarchar](4) NULL,
	[Applied] [bit] NOT NULL,
	[AppliedValue] [decimal](6, 2) NULL,
	[ApplHeaderID] [int] NULL,
	[ApplStatusID] [int] NULL,
	[Applied1LeaveTypeID] [nvarchar](2) NULL,
	[Applied2LeaveTypeID] [nvarchar](2) NULL,
	[Posted1LeaveTypeID] [nvarchar](2) NULL,
	[Posted2LeaveTypeID] [nvarchar](2) NULL,
	[Posted] [bit] NOT NULL,
	[FinalValue] [decimal](6, 2) NULL,
	[AdvanceApplication] [bit] NOT NULL,
	[Destination] [nvarchar](50) NULL,
	[Purpose] [nvarchar](250) NULL,
	[MannuallyCorrected] [bit] NOT NULL,
	[ConfigID] [int] NULL,
	[ConfigDetailID] [int] NULL,
	[ConfigStatus] [nvarchar](2) NULL,
	[TSStatus] [nvarchar](2) NULL,
	[TSStatusBy] [nvarchar](8) NULL,
	[TSStatusOn] [datetime] NULL,
	[HoliDay] [bit] NOT NULL,
	[SiteAttendance] [bit] NOT NULL,
	[SiteAttendanceVerified] [bit] NOT NULL,
	[SiteAttendanceVerifiedOn] [datetime] NULL,
	[SiteAttendanceVerifiedBy] [nvarchar](8) NULL,
	[FirstPunchMachine] [nvarchar](100) NULL,
	[SecondPunchMachine] [nvarchar](100) NULL,
	[OfficeID] [int] NULL,
 CONSTRAINT [PK_ATN_Attendance] PRIMARY KEY CLUSTERED 
(
	[AttenID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_Attendance] ON [dbo].[ATN_Attendance] 
(
	[ApplHeaderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ATN_Attendance_1] ON [dbo].[ATN_Attendance] 
(
	[CardNo] ASC,
	[AttenDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_Attendance_2] ON [dbo].[ATN_Attendance] 
(
	[FinYear] ASC,
	[CardNo] ASC,
	[PunchValue] ASC,
	[Applied] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_Attendance_3] ON [dbo].[ATN_Attendance] 
(
	[FinYear] ASC,
	[CardNo] ASC,
	[AttenDate] ASC,
	[ConfigID] ASC,
	[ConfigDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Attendance_ATN_ApplicationStatus] FOREIGN KEY([ApplStatusID])
REFERENCES [dbo].[ATN_ApplicationStatus] ([ApplStatusID])
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [FK_ATN_Attendance_ATN_ApplicationStatus]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Attendance_ATN_LeaveTypes] FOREIGN KEY([Applied1LeaveTypeID])
REFERENCES [dbo].[ATN_LeaveTypes] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [FK_ATN_Attendance_ATN_LeaveTypes]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Attendance_ATN_LeaveTypes1] FOREIGN KEY([Applied2LeaveTypeID])
REFERENCES [dbo].[ATN_LeaveTypes] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [FK_ATN_Attendance_ATN_LeaveTypes1]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Attendance_ATN_LeaveTypes2] FOREIGN KEY([Posted1LeaveTypeID])
REFERENCES [dbo].[ATN_LeaveTypes] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [FK_ATN_Attendance_ATN_LeaveTypes2]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Attendance_ATN_LeaveTypes3] FOREIGN KEY([Posted2LeaveTypeID])
REFERENCES [dbo].[ATN_LeaveTypes] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [FK_ATN_Attendance_ATN_LeaveTypes3]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Attendance_ATN_PunchStatus] FOREIGN KEY([PunchStatusID])
REFERENCES [dbo].[ATN_PunchStatus] ([PunchStatusID])
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [FK_ATN_Attendance_ATN_PunchStatus]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Attendance_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [FK_ATN_Attendance_HRM_Employees]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Attendance_HRM_Employees1] FOREIGN KEY([TSStatusBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [FK_ATN_Attendance_HRM_Employees1]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Attendance_OfficeID] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [FK_ATN_Attendance_OfficeID]
GO
ALTER TABLE [dbo].[ATN_Attendance]  WITH CHECK ADD  CONSTRAINT [CK_ATN_Attendance] CHECK  (([finalvalue]>=(0) AND [finalvalue]<=(1)))
GO
ALTER TABLE [dbo].[ATN_Attendance] CHECK CONSTRAINT [CK_ATN_Attendance]
GO
ALTER TABLE [dbo].[ATN_Attendance] ADD  CONSTRAINT [DF_ATN_Attendance_PunchValue]  DEFAULT ((0)) FOR [PunchValue]
GO
ALTER TABLE [dbo].[ATN_Attendance] ADD  CONSTRAINT [DF_ATN_Attendance_NeedsRegularization]  DEFAULT ((0)) FOR [NeedsRegularization]
GO
ALTER TABLE [dbo].[ATN_Attendance] ADD  CONSTRAINT [DF_ATN_Attendance_Applied]  DEFAULT ((0)) FOR [Applied]
GO
ALTER TABLE [dbo].[ATN_Attendance] ADD  CONSTRAINT [DF_ATN_Attendance_Posted]  DEFAULT ((0)) FOR [Posted]
GO
ALTER TABLE [dbo].[ATN_Attendance] ADD  CONSTRAINT [DF_ATN_Attendance_AdvanceApplication]  DEFAULT ((0)) FOR [AdvanceApplication]
GO
ALTER TABLE [dbo].[ATN_Attendance] ADD  CONSTRAINT [DF_ATN_Attendance_MannuallyCorrected_1]  DEFAULT ((0)) FOR [MannuallyCorrected]
GO
ALTER TABLE [dbo].[ATN_Attendance] ADD  CONSTRAINT [DF_ATN_Attendance_HoliDay]  DEFAULT ((0)) FOR [HoliDay]
GO
ALTER TABLE [dbo].[ATN_Attendance] ADD  CONSTRAINT [DF_ATN_Attendance_SiteAttendance]  DEFAULT ((0)) FOR [SiteAttendance]
GO
ALTER TABLE [dbo].[ATN_Attendance] ADD  CONSTRAINT [DF_ATN_Attendance_SiteAttendanceVerified]  DEFAULT ((0)) FOR [SiteAttendanceVerified]
GO

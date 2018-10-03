USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IJT_tAttendance](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[DataMonth] [int] NOT NULL,
	[FinYear] [nvarchar](4) NOT NULL,
	[D1] [nvarchar](2) NULL,
	[D2] [nvarchar](2) NULL,
	[D3] [nvarchar](2) NULL,
	[D4] [nvarchar](2) NULL,
	[D5] [nvarchar](2) NULL,
	[D6] [nvarchar](2) NULL,
	[D7] [nvarchar](2) NULL,
	[D8] [nvarchar](2) NULL,
	[D9] [nvarchar](2) NULL,
	[D10] [nvarchar](2) NULL,
	[D11] [nvarchar](2) NULL,
	[D12] [nvarchar](2) NULL,
	[D13] [nvarchar](2) NULL,
	[D14] [nvarchar](2) NULL,
	[D15] [nvarchar](2) NULL,
	[D16] [nvarchar](2) NULL,
	[D17] [nvarchar](2) NULL,
	[D18] [nvarchar](2) NULL,
	[D19] [nvarchar](2) NULL,
	[D20] [nvarchar](2) NULL,
	[D21] [nvarchar](2) NULL,
	[D22] [nvarchar](2) NULL,
	[D23] [nvarchar](2) NULL,
	[D24] [nvarchar](2) NULL,
	[D25] [nvarchar](2) NULL,
	[D26] [nvarchar](2) NULL,
	[D27] [nvarchar](2) NULL,
	[D28] [nvarchar](2) NULL,
	[D29] [nvarchar](2) NULL,
	[D30] [nvarchar](2) NULL,
	[D31] [nvarchar](2) NULL,
	[Locked] [bit] NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[ProjectID] [nvarchar](6) NULL,
 CONSTRAINT [PK_IJT_Attendance] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IJT_tAttendance]  WITH CHECK ADD  CONSTRAINT [FK_IJT_Attendance_ATN_Months] FOREIGN KEY([DataMonth])
REFERENCES [dbo].[ATN_Months] ([MonthID])
GO
ALTER TABLE [dbo].[IJT_tAttendance] CHECK CONSTRAINT [FK_IJT_Attendance_ATN_Months]
GO
ALTER TABLE [dbo].[IJT_tAttendance]  WITH CHECK ADD  CONSTRAINT [FK_IJT_Attendance_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IJT_tAttendance] CHECK CONSTRAINT [FK_IJT_Attendance_HRM_Employees]
GO
ALTER TABLE [dbo].[IJT_tAttendance]  WITH CHECK ADD  CONSTRAINT [FK_IJT_Attendance_IDM_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[IJT_tAttendance] CHECK CONSTRAINT [FK_IJT_Attendance_IDM_Projects]
GO
ALTER TABLE [dbo].[IJT_tAttendance]  WITH CHECK ADD  CONSTRAINT [FK_IJT_Attendance_IJT_Attendance] FOREIGN KEY([FinYear])
REFERENCES [dbo].[ATN_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[IJT_tAttendance] CHECK CONSTRAINT [FK_IJT_Attendance_IJT_Attendance]
GO
ALTER TABLE [dbo].[IJT_tAttendance] ADD  CONSTRAINT [DF_IJT_Attendance_Locked]  DEFAULT ((0)) FOR [Locked]
GO

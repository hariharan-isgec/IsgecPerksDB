USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atn_0126](
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
	[OfficeID] [int] NULL
) ON [PRIMARY]
GO

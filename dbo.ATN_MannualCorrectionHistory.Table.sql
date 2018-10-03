USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_MannualCorrectionHistory](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[AttenID] [int] NULL,
	[AttenDate] [datetime] NULL,
	[CardNo] [nvarchar](8) NULL,
	[Punch1Time] [decimal](6, 2) NULL,
	[Punch2Time] [decimal](6, 2) NULL,
	[PunchStatusID] [nvarchar](2) NULL,
	[MannuallyCorrectedOn] [datetime] NULL,
	[MannuallyCorrectedBy] [nvarchar](8) NULL,
	[NewPunch1Time] [decimal](6, 2) NULL,
	[NewPunch2Time] [decimal](6, 2) NULL,
	[NewPunchStatusID] [nvarchar](2) NULL,
	[Remarks] [nvarchar](100) NULL,
 CONSTRAINT [PK_ATN_MannualCorrectionHistory] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_MannualCorrectionHistory] ON [dbo].[ATN_MannualCorrectionHistory] 
(
	[AttenID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_MannualCorrectionHistory_1] ON [dbo].[ATN_MannualCorrectionHistory] 
(
	[CardNo] ASC,
	[AttenID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

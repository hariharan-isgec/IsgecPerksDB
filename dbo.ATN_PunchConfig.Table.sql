USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_PunchConfig](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[STD1Time] [decimal](6, 2) NOT NULL,
	[Range1Start] [decimal](6, 2) NOT NULL,
	[Range1End] [decimal](6, 2) NOT NULL,
	[MeanTime] [decimal](6, 2) NOT NULL,
	[STD2Time] [decimal](6, 2) NOT NULL,
	[Range2Start] [decimal](6, 2) NOT NULL,
	[Range2End] [decimal](6, 2) NOT NULL,
	[EnableMinHrs] [bit] NOT NULL,
	[MinHrsFullPresent] [decimal](6, 2) NOT NULL,
	[MinHrsHalfPresent] [decimal](6, 2) NOT NULL,
	[FinYear] [nvarchar](4) NOT NULL,
	[Active] [bit] NOT NULL,
	[DataFileLocation] [nvarchar](250) NOT NULL,
	[AllowedForgetPunches] [int] NOT NULL,
	[AllowedShortLeaves] [int] NOT NULL,
	[ActiveFrom] [datetime] NULL,
	[ActiveTill] [datetime] NULL,
	[LocationList] [nvarchar](50) NULL,
 CONSTRAINT [PK_ATN_PunchConfig] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_PunchConfig] ADD  CONSTRAINT [DF_ATN_PunchConfig_EnableMinHrs]  DEFAULT ((1)) FOR [EnableMinHrs]
GO
ALTER TABLE [dbo].[ATN_PunchConfig] ADD  CONSTRAINT [DF_ATN_PunchConfig_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[ATN_PunchConfig] ADD  CONSTRAINT [DF_ATN_PunchConfig_DataFileLocation]  DEFAULT ('') FOR [DataFileLocation]
GO
ALTER TABLE [dbo].[ATN_PunchConfig] ADD  CONSTRAINT [DF_ATN_PunchConfig_AllowedForgetPunches_1]  DEFAULT ((0)) FOR [AllowedForgetPunches]
GO
ALTER TABLE [dbo].[ATN_PunchConfig] ADD  CONSTRAINT [DF_ATN_PunchConfig_AllowedShortLeaves_1]  DEFAULT ((0)) FOR [AllowedShortLeaves]
GO

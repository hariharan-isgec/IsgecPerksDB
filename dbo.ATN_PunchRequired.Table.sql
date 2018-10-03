USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_PunchRequired](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[NoPunch] [bit] NOT NULL,
	[OnePunch] [bit] NOT NULL,
	[RuleException] [bit] NOT NULL,
	[AllLocation] [bit] NOT NULL,
 CONSTRAINT [PK_ATN_PunchRequired] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_PunchRequired]  WITH CHECK ADD  CONSTRAINT [FK_ATN_PunchRequired_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_PunchRequired] CHECK CONSTRAINT [FK_ATN_PunchRequired_HRM_Employees]
GO
ALTER TABLE [dbo].[ATN_PunchRequired] ADD  CONSTRAINT [DF_ATN_PunchRequired_NoPunch]  DEFAULT ((0)) FOR [NoPunch]
GO
ALTER TABLE [dbo].[ATN_PunchRequired] ADD  CONSTRAINT [DF_ATN_PunchRequired_OnePunch]  DEFAULT ((0)) FOR [OnePunch]
GO
ALTER TABLE [dbo].[ATN_PunchRequired] ADD  CONSTRAINT [DF_ATN_PunchRequired_RuleException_1]  DEFAULT ((0)) FOR [RuleException]
GO
ALTER TABLE [dbo].[ATN_PunchRequired] ADD  CONSTRAINT [DF_ATN_PunchRequired_AllLocationPunch]  DEFAULT ((0)) FOR [AllLocation]
GO

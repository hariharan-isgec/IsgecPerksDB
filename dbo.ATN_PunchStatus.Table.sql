USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_PunchStatus](
	[PunchStatusID] [nvarchar](2) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[PunchValue] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_ATN_PunchStatus] PRIMARY KEY CLUSTERED 
(
	[PunchStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_PunchStatus] ADD  CONSTRAINT [DF_ATN_PunchStatus_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[ATN_PunchStatus] ADD  CONSTRAINT [DF_ATN_PunchStatus_PunchValue]  DEFAULT ((0)) FOR [PunchValue]
GO

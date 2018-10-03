USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_Holidays](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[Holiday] [datetime] NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[PunchStatusID] [nvarchar](2) NOT NULL,
	[FinYear] [nvarchar](4) NOT NULL,
	[OfficeID] [int] NULL,
 CONSTRAINT [PK_ATN_Holidays] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_Holidays]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Holidays_ATN_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[ATN_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[ATN_Holidays] CHECK CONSTRAINT [FK_ATN_Holidays_ATN_FinYear]
GO
ALTER TABLE [dbo].[ATN_Holidays]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Holidays_ATN_PunchStatus] FOREIGN KEY([PunchStatusID])
REFERENCES [dbo].[ATN_PunchStatus] ([PunchStatusID])
GO
ALTER TABLE [dbo].[ATN_Holidays] CHECK CONSTRAINT [FK_ATN_Holidays_ATN_PunchStatus]
GO
ALTER TABLE [dbo].[ATN_Holidays]  WITH CHECK ADD  CONSTRAINT [FK_ATN_Holidays_HRM_Offices] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ATN_Holidays] CHECK CONSTRAINT [FK_ATN_Holidays_HRM_Offices]
GO
ALTER TABLE [dbo].[ATN_Holidays] ADD  CONSTRAINT [DF_ATN_Holidays_Description]  DEFAULT ('') FOR [Description]
GO

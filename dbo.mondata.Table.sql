USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mondata](
	[active] [char](1) NULL,
	[paycode] [char](10) NULL,
	[empcd] [char](4) NULL,
	[dept] [char](3) NULL,
	[cat] [char](3) NULL,
	[compcd] [char](3) NULL,
	[in_only] [char](1) NULL,
	[date] [datetime] NULL,
	[status] [char](1) NULL,
	[flag] [char](1) NULL,
	[pre] [decimal](5, 2) NULL,
	[abs] [decimal](5, 2) NULL,
	[hld] [decimal](5, 2) NULL,
	[leave] [decimal](5, 2) NULL,
	[leave_type] [char](3) NULL,
	[start] [decimal](4, 2) NULL,
	[end] [decimal](4, 2) NULL,
	[in1] [decimal](4, 2) NULL,
	[in2] [decimal](4, 2) NULL,
	[out1] [decimal](4, 2) NULL,
	[out2] [decimal](4, 2) NULL,
	[sta] [char](5) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tos_clps_bak](
	[ProjectID] [nvarchar](6) NOT NULL,
	[CLPID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Quantity] [nvarchar](100) NULL,
	[Sequence] [int] NULL,
	[DisplayType] [nvarchar](50) NULL,
	[engTaskID] [int] NULL,
	[ordTaskID] [int] NULL,
	[desTaskID] [int] NULL,
	[ereTaskID] [int] NULL,
	[ioTaskID] [int] NULL,
	[recTaskID] [int] NULL,
	[ad1TaskID] [int] NULL,
	[ad2TaskID] [int] NULL,
	[ad3TaskID] [int] NULL,
	[ad4TaskID] [int] NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF1_ItemReferencewiseProgress](
	[WFID] [int] NULL,
	[Parent_WFID] [int] NULL,
	[Businnesshndl] [varchar](50) NULL,
	[ItemReference] [varchar](200) NULL,
	[ProgressByWeight] [real] NULL,
	[ProgressByCount] [real] NULL,
	[UserId] [varchar](8) NULL,
	[UpdatedDate] [datetime] NULL,
	[UserAction] [varchar](100) NULL,
	[Project] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
